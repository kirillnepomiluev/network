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

  WalletProvider() {
    getInit();
  }

  getInit(){
    loadPrivateKey();
  }

  // Variable to store the private key
  String? privateKey;

  // Load the private key from the shared preferences
  Future<void> loadPrivateKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    privateKey = prefs.getString('privateKey');
    print('loadPrivateKey - $privateKey');
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
    final address = await private.address;
    return address;
  }

  ////////////////////////////////////////





  static Future<Map<String, dynamic>> sendHttpReq({required String address, required String chainName}) async {
    const headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final encoding = Encoding.getByName('utf-8');

    final dataMap = {
      "jsonrpc":"2.0",
      "method":"eth_getBalance",
      "params":[address,"latest"],"id":1
    };

    String jsonBody = json.encode(dataMap);
    Map<String, dynamic> results = {};

    var client = http.Client();
    try {
      var response = await http.post(Uri.https('sepolia.infura.io',
          'v3/e90250eb60d64824abaeaf3750178842'
        // 'v3/82c60c8157c1431a81209503dd6f2815'
      ), body: jsonBody, headers: headers, encoding: encoding);
      results = json.decode(response.body);
    }
    finally {
      client.close();
    }

    print('results $results');

    return results;
  }

  static Future<int> getBalances({required String address, required String chainName}) async {
    print('getBalances');

    //0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17
    //sepolia
    final dataMap = await sendHttpReq(address: address, chainName: chainName);
    final String balanceHex = dataMap['result']??'';

    if(balanceHex.isEmpty){
      return 0;
    }else{
      return int.parse(balanceHex);
    }

  }



}
