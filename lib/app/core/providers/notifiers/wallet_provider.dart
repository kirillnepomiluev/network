import 'package:web3dart/web3dart.dart';
import 'package:flutter/foundation.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class WalletAddressService {
  String generateMnemonic();
  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicKey(String privateKey);
}

class WalletProvider extends ChangeNotifier implements WalletAddressService {

  bool initialized = false;

  WalletProvider() {
    getInit();
  }

  void getInit(){
    loadPrivateKey();
  }

  // Variable to store the private key
  String? privateKey;

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('privateKey');
    privateKey=null;
    notifyListeners();
  }

    // Load the private key from the shared preferences
  Future<void> loadPrivateKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    privateKey = prefs.getString('privateKey');
    print('loadPrivateKey - $privateKey');
    initialized = true;
    notifyListeners();
  }

  // set the private key in the shared preferences
  Future<void> setPrivateKey(String privateKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('privateKey', privateKey);
    this.privateKey = privateKey;
    notifyListeners();
  }

  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    // Set the private key in the shared preferences
    await setPrivateKey(privateKey);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = private.address;
    return address;
  }

  ////////////////////////////////////////



  static Future<Map<String, dynamic>> httpPost({required String domen, required String url, required Map<String, dynamic> dataMap}) async {
    const headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(dataMap);
    Map<String, dynamic> results = {};

    final client = http.Client();
    try {
       final response = await http.post(Uri.https(domen, url), body: jsonBody, headers: headers, encoding: encoding);
       results = json.decode(response.body);
    }
    finally {
      client.close();
    }

    print('results $results');

    return results;
  }



  static Future<Map<String, dynamic>> getBalance({required String address, required String chainName}) async {
    final dataMap = {
      'jsonrpc':'2.0',
      'method':'eth_getBalance',
      'params':[address,'latest'],'id':1
    };
    Map<String, dynamic> results = await httpPost(domen: 'sepolia.infura.io', url: 'v3/e90250eb60d64824abaeaf3750178842', dataMap: dataMap);
    print('results $results');
    return results;
  }

  static Future<int> getBalances({required String address, required String chainName}) async {
    print('getBalances');

    //0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17
    //sepolia
    final dataMap = await getBalance(address: address, chainName: chainName);
    final String balanceHex = dataMap['result']??'';

    if(balanceHex.isEmpty){
      return 0;
    }else{
      return int.parse(balanceHex);
    }

  }

  List<NftModel> nftList = [];

  Future<void> getNftList() async {
    print('getNftList');

    const chainID = 80001;
    const walletAddress = '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17';
    //https://nft.api.infura.io/networks/80001/accounts/0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17/assets/nfts
    final results = await httpsAuthGet(domen: 'nft.api.infura.io', url: 'networks/$chainID/accounts/$walletAddress/assets/nfts');

    List assets = results['assets']??[];
    for(final item in assets){
      final metadata = item['metadata'];
      final NftModel nftModel = NftModel.fromMap(metadata);
      nftList.add(nftModel);
    }

    print('nftList');
    for(final nftModel in nftList){
      print(nftModel);
    }

    notifyListeners();
  }


  static Future<Map<String, dynamic>> httpsAuthGet({required String domen, required String url}) async {
    print('getNftList');
    Map<String, dynamic> results = {};

    String username = 'e90250eb60d64824abaeaf3750178842'; //infuraOpenKey
    String password = '2aafe54e680949c08dcd2764cb6bb42f'; //infuraCloseKey
    String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    final Map<String, String> headers = {'authorization': basicAuth};

    final client = http.Client();
    try {
      http.Response response = await http.get(Uri.https(domen, url), headers: headers);
      results = json.decode(response.body);
    }
    finally {
      client.close();
    }

    print('results $results');

    return results;
  }

}

class NftModel{
  final String name;
  final String description;
  final String imageUrl;

  NftModel({required this.name, required this.description, required this.imageUrl});

  factory NftModel.fromMap(Map<String, dynamic> metadata){
    final String tokenURI = metadata['image'];
    final String imageUrl = tokenURI.replaceFirst('ipfs://', 'https://ipfs.io/ipfs/');
    return NftModel(name: metadata['name'], description: metadata['description'], imageUrl: imageUrl);
  }

  @override
  String toString() {
    return '$name - $description - $imageUrl';
  }

}