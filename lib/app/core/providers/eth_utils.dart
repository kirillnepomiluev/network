import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:web3dart/web3dart.dart';

class ContractModel {
  final String contractName;
  final String abiPath;
  final String envContractAddress; //"CONTRACT_ADDRESS_EXAMPLE"
  final DeployedContract contract;
  ContractModel(
      {required this.contractName,
        required this.abiPath,
        required this.envContractAddress,
        required this.contract});

  static Future<ContractModel> create({
    required String contractName,
    required String abiPath,
    required String contractAddressKey,
  }) async {

    // final String envContractAddress = Utils.getEnv(contractAddressKey);
    final envContractAddress = contractAddressKey;


    final contract = await getDeployedContract(
        contractName: contractName,
        abiPath: abiPath,
        envContractAddress: envContractAddress);
    final contractModel = ContractModel(
        contractName: contractName,
        abiPath: abiPath,
        envContractAddress: envContractAddress,
        contract: contract);
    return contractModel;
  }

  static Future<DeployedContract> getDeployedContract(
      {required String contractName,
        required String abiPath,
        required String envContractAddress}) async {
    final abi = await rootBundle.loadString(abiPath);
    final contract = DeployedContract(ContractAbi.fromJson(abi, contractName),
        EthereumAddress.fromHex(envContractAddress));
    return contract;
  }
}

// class EthereumUtils {
//
//   static const ownerAddress = '0x04Ee5860e4fce5560865197BCfb83b9192ce4dbD'; //0x04Ee5860e4fce5560865197BCfb83b9192ce4dbD
//   static const myAddress = '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17';
//   static const web = 'sepolia'; //goerli
//   static const chainID = 11155111; // 80001; //sepolia 11155111, 5
//
//
//   static final envInfuraApiKey = Utils.getEnv('INFURA_API_KEY');
//   static final envMetamaskPrivateKey = Utils.getEnv('METAMASK_PRIVATE_KEY');
//   static final EthPrivateKey credential =
//   EthPrivateKey.fromHex(envMetamaskPrivateKey);
//
//   static final infura = "https://$web.infura.io/v3/$envInfuraApiKey";
//
//   static final http.Client httpClient = http.Client();
//   final Web3Client ethClient = Web3Client(infura, httpClient);
//
//   // static EthereumAddress getEthAddress(String address) => EthereumAddress.fromHex(address);
//
//   Future<List<dynamic>> read(
//       {required String functionName,
//         required List<dynamic> args,
//         required DeployedContract contract,
//         String strSender = ''}) async {
//     EthereumAddress? sender =
//     strSender.isEmpty ? null : EthereumAddress.fromHex(strSender);
//
//     final ethFunction = contract.function(functionName);
//     final result = await ethClient.call(
//       sender: sender,
//       contract: contract,
//       function: ethFunction,
//       params: args,
//     );
//     return result;
//   }
//
//   Future<String> write(
//       {required String functionName,
//         required List<dynamic> args,
//         required DeployedContract contract,
//         double ethValue = 0.0,
//         String strSender = ''}) async {
//     try {
//       EthereumAddress? sender =
//       strSender.isEmpty ? null : EthereumAddress.fromHex(strSender);
//
//       EtherAmount? value;
//
//       if (ethValue > 0.0) {
//         final int wei = (ethValue * 1000000000000000000).toInt();
//         value = EtherAmount.fromInt(EtherUnit.wei, wei);
//       }
//
//       final ethFunction = contract.function(functionName);
//       final result = await ethClient.sendTransaction(
//         credential,
//         Transaction.callContract(
//           value: value,
//           from: sender,
//           contract: contract,
//           function: ethFunction,
//           parameters: args,
//           // maxGas: 100000,
//         ),
//         chainId: chainID,
//       );
//       return result;
//     } catch (e) {
//       print("Something wrong happened! - $e");
//     }
//
//     return '';
//   }
//
//   Future<bool?> getReciept(String hash) async {
//     final reciept = await ethClient.getTransactionReceipt(hash);
//     print('reciept $reciept');
//     final status = reciept!.status;
//     return status;
//   }
//
//   listenEvent({required DeployedContract contract}) async {
//
//     // final events = ethClient.events(FilterOptions.events(contract: contract, event: contract.event('BalanceChange')));
//
//     print('listenEvent');
//
//     final transferEvent = contract.event('Transfer');
//     final filter = FilterOptions.events(contract: contract, event: transferEvent);
//     final events = ethClient.events(filter);
//     // print('logs $logs');
//
//     final sub = events
//     // .take(1)
//         .listen((event) {
//
//       print('L1');
//
//       final decoded = transferEvent.decodeResults(event.topics!, event.data!);
//
//       print('decoded $decoded');
//
//       final from = decoded[0] as EthereumAddress;
//       final to = decoded[1] as EthereumAddress;
//       final value = decoded[2] as BigInt;
//
//       print('$from sent $value MetaCoins to $to');
//     });
//
//     return sub;
//
//     // final events = ethClient.events(FilterOptions.events(contract: contract, event: contract.event('BalanceChange')));
//     // return events.listen((FilterEvent event) {
//     //   if(event.topics==null || event.data == null){
//     //     return;
//     //   }
//     //   final decoded = contract.event('BalanceChange').decodeResults(event.topics!, event.data!);
//     //   print('Listen Event: $decoded');
//     //   List<String> balanceList = decoded.map((e) => e.toInt().toString()).toList();
//     //   // _prefs.setStringList(savedBalance, balanceList);
//     // });
//
//   }
//
//
// }
//
// class ERC721ContractNotifier with ChangeNotifier {
//   static const contractName = 'ERC721SuitUnlimited';
//   static const contractAddress = 'CONTRACT_ADDRESS_ERC721';
//   static final abiPath = Assets.abi.erc721;
//   late ContractModel contractModel;
//
//   static String strGetBalance = 'getBalance';
//   static String strSafeMint = '_safeMint';
//   static String strTokenURI = 'tokenURI';
//   static String strAddLevelAndRewardForMeet= 'addLevelAndRewardForMeet';
//
//   bool showLoading = true;
//   ERC721ContractNotifier() {
//     getInit();
//   }
//
//   Future<void> getInit() async {
//     print('getInit ERC721');
//
//     contractModel = await ContractModel.create(
//         contractName: contractName,
//         abiPath: abiPath,
//         contractAddressKey: contractAddress);
//
//     EthereumUtils().listenEvent(contract: contractModel.contract);
//
//     await getBalance(notify: false);
//
//     showLoading = false;
//     notifyListeners();
//   }
//
//   int balance = 0;
//
//   Future getBalance({bool notify = true}) async {
//     final currentFunction = strGetBalance;
//
//     List<dynamic> response = await EthereumUtils().read(
//         strSender: EthereumUtils.ownerAddress,
//         contract: contractModel.contract,
//         functionName: currentFunction,
//         args: []
//     );
//
//     final result = response.first as BigInt;
//     print('getBalance result $result'); //_BigIntImpl
//     balance = result.toInt();
//
//     if (notify) {
//       notifyListeners();
//     }
//   }
//
//   Future getTokenURI({required BuildContext context, }) async {
//
//     // final currentFunction = strTokenURI;
//     // List<dynamic> response = await EthereumUtils().read(
//     //     strSender: EthereumUtils.ownerAddress,
//     //     contract: contractModel.contract,
//     //     functionName: currentFunction,
//     //     args: []
//     // );
//     // final tokenURI = response.first;
//     // print('tokenURI $tokenURI');
//
//     const tokenURI = 'ipfs://bafybeifglluvlsceknmh3dqsho3ci7xmpjvn6fhox72ve54ncpxvwljbgq/2';
//     final test = tokenURI.split('://').last;
//     final link = 'https://nftstorage.link/ipfs/$test';
//     http.Response response = await http.get(Uri.parse(link));
//     final statusCode = response.statusCode;
//     print('statusCode $statusCode');
//
//     if(statusCode==200){
//       final results = jsonDecode(response.body);
//       final imageFps = results['image'];
//       final String imageFpsTest = imageFps.split('://').last;
//       final fpsList = imageFpsTest.split('/');
//       final storageLink = 'https://${fpsList.first}.ipfs.nftstorage.link/${fpsList.last}';
//       print('storageLink $storageLink');
//
//       const mumbaiContractAddress = '0xe2d074be971c9290b5bbab059f9c510b0c76936d';
//       const webName = 'mumbai';
//       final tokenID = fpsList.last.split('.').first;
//
//       final seaLink = 'https://testnets.opensea.io/assets/$webName/$mumbaiContractAddress/$tokenID';
//       print('seaLink $seaLink');
//     }
//     else{
//       showSimpleDialog(title: 'Ошибка', text: 'Статус: $statusCode', context: context);
//     }
//   }
//
//   Future<String> safeMint() async {
//     print('safeMint');
//
//     // final transferEvent = contractModel.contract.event('Transfer');
//     // final filter = FilterOptions.events(contract: contractModel.contract, event: transferEvent);
//     // // final events = EthereumUtils().ethClient.events(filter);
//     //
//     // // final logs = await EthereumUtils().ethClient.getTransactionReceipt('0x2ea799f13789b6f00b31d4b25ad63b4aedf2492d8669e9889bd9dcfb95b2bce9');
//     // // final logs = await EthereumUtils().ethClient.events(filter).forEach((element) {print(element.address.toString());});
//     // final logs = await EthereumUtils().ethClient.events(FilterOptions()).length;
//     // print('logs $logs');
//
//     //uint256 private _tokenPrice = 10000000000000000; //0.01 ETH
//
//     final currentFunction = strSafeMint;
//
//     final response = await EthereumUtils().write(
//       contract: contractModel.contract,
//       functionName: currentFunction,
//       strSender: EthereumUtils.myAddress,
//       ethValue: 0.01,
//       args: [EthereumAddress.fromHex(EthereumUtils.myAddress)],
//     );
//
//     print('response $response');
//     return response;
//   }
//
//
//   Future<String> addLevelAndRewardForMeet() async {
//     print('addLevelAndRewardForMeet');
//
//     final currentFunction = strAddLevelAndRewardForMeet;
//
//     final response = await EthereumUtils().write(
//       contract: contractModel.contract,
//       functionName: currentFunction,
//       strSender: EthereumUtils.myAddress,
//       // ethValue: 0.01,
//       args: [EthereumAddress.fromHex(EthereumUtils.myAddress), BigInt.from(2), EthereumAddress.fromHex(EthereumUtils.ownerAddress), BigInt.from(0), true],
//     );
//
//     print('response $response');
//     return response;
//   }
//
//
// }


class _WebData{
  final String chainType;
  final String chainName;
  final int chainID;
  final String infuraApiKey;
  final String infura;
  final String ownerAddress;
  final String erc721address;  //НАДО БУДЕТ ПОМЕНЯТЬ НА contractAddressKey

  _WebData({required this.chainType, required this.chainID, required this.chainName, required this.infuraApiKey, required this.infura, required this.erc721address, required this.ownerAddress});

  static const ethInfuraKey = 'e90250eb60d64824abaeaf3750178842';
  static const polygonInfuraKey = 'f8bf00d32b6448a3818f59c6f16e7f86';

  static String getNetworkName(int chainId) {

    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 11155111:
        return 'Sepolia Testnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  factory _WebData.choose(String webName){

    int chainID = 0;
    String infuraApiKey = '';
    String webType = '';
    String erc721address = '';
    String ownerAddress = '';


    if(webName=='sepolia'){
      webType = webName;
      chainID = 11155111;
      infuraApiKey = ethInfuraKey;
      erc721address = '0x9ebF2d973000780b403522259b09dad9E3B59256';
      ownerAddress = '0x04Ee5860e4fce5560865197BCfb83b9192ce4dbD';
      // erc721address = '0xAb92aED3Dd22ad824123239c1571E598eEDa36db';
      // ownerAddress = '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17';
    }
    else if(webName=='mumbai'){
      webType = 'polygon-mumbai';
      chainID = 80001;
      infuraApiKey = polygonInfuraKey;
      erc721address = '0xe2D074BE971c9290b5BbaB059F9c510B0C76936d';
      ownerAddress = '0xDbfEEa0fc1F1F2f43F7DbaD7827Cccad8C47c337';
    }
    else if(webName=='polygon'){
      webType = 'polygon-mainnet';
      chainID = 137;
      infuraApiKey = polygonInfuraKey;
      erc721address = '';
      ownerAddress = '';
    }

    String infura = 'https://$webType.infura.io/v3/$infuraApiKey';


    String chainName = getNetworkName(chainID);

    return _WebData(chainType: webType, chainID: chainID, chainName: chainName, infuraApiKey: infuraApiKey, infura: infura, erc721address: erc721address, ownerAddress: ownerAddress);
  }

}

class EthereumUtils {
  static final webData = _WebData.choose('sepolia');

  // static const ownerAddress = '0x04Ee5860e4fce5560865197BCfb83b9192ce4dbD'; //0x04Ee5860e4fce5560865197BCfb83b9192ce4dbD
  // static const myAddress = '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17';
  static const myAddress = '0xc14dafbc12e001a4109c2fd313a24b985863070b';
  static const envMetamaskPrivateKey = '524b442f7c94da5cb89808d697a3079000298021626122584a14ebbb8e170b90';


  // static const web = 'sepolia'; //goerli
  // static const chainID = 11155111; // 80001; //sepolia 11155111, polygon mumbai 5  polygon-mainet 137
  // static final envInfuraApiKey = 'e90250eb60d64824abaeaf3750178842';
  // static final infura = "https://$web.infura.io/v3/$envInfuraApiKey";


  static final EthPrivateKey credential = EthPrivateKey.fromHex(envMetamaskPrivateKey);


  static final http.Client httpClient = http.Client();
  final Web3Client ethClient = Web3Client(webData.infura, httpClient);

  // static EthereumAddress getEthAddress(String address) => EthereumAddress.fromHex(address);

  Future<List<dynamic>> read(
      {required String functionName,
        required List<dynamic> args,
        required DeployedContract contract,
        String strSender = ''}) async {
    EthereumAddress? sender =
    strSender.isEmpty ? null : EthereumAddress.fromHex(strSender);

    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
      sender: sender,
      contract: contract,
      function: ethFunction,
      params: args,
    );
    return result;
  }

  Future<String> write(
      {required String functionName,
        required List<dynamic> args,
        required DeployedContract contract,
        double ethValue = 0.0,
        String strSender = ''}) async {
    try {
      EthereumAddress? sender =
      strSender.isEmpty ? null : EthereumAddress.fromHex(strSender);

      EtherAmount? value;

      if (ethValue > 0.0) {
        final int wei = (ethValue * 1000000000000000000).toInt();
        value = EtherAmount.fromInt(EtherUnit.wei, wei);
      }

      final ethFunction = contract.function(functionName);

      final EthPrivateKey moralistCredential = EthPrivateKey.fromHex('1e13471ec6d7430dd605acbbb2a2539ba14cb7c3358b3d55d6ecef173fcf908c');


      final result = await ethClient.sendTransaction(
        // credential,
        moralistCredential,
        Transaction.callContract(
          value: value,
          from: sender,
          contract: contract,
          function: ethFunction,
          parameters: args,
          // maxGas: 100000,
        ),
        chainId: webData.chainID,
      );
      return result;
    } catch (e) {
      print('Something wrong happened! - $e');
    }

    return '';
  }

  Future<bool?> getReciept(String hash) async {
    final reciept = await ethClient.getTransactionReceipt(hash);
    final status = reciept!.status;
    return status;
  }

  Future<dynamic> listenEvent({required DeployedContract contract}) async {

    // final events = ethClient.events(FilterOptions.events(contract: contract, event: contract.event('BalanceChange')));

    print('listenEvent');

    final transferEvent = contract.event('Transfer');
    final filter = FilterOptions.events(contract: contract, event: transferEvent);
    final events = ethClient.events(filter);
    // print('logs $logs');

    final sub = events
    // .take(1)
        .listen((event) {

      print('L1');

      final decoded = transferEvent.decodeResults(event.topics!, event.data!);

      print('decoded $decoded');

      final from = decoded[0] as EthereumAddress;
      final to = decoded[1] as EthereumAddress;
      final value = decoded[2] as BigInt;

      print('$from sent $value MetaCoins to $to');
    });

    return sub;

    // final events = ethClient.events(FilterOptions.events(contract: contract, event: contract.event('BalanceChange')));
    // return events.listen((FilterEvent event) {
    //   if(event.topics==null || event.data == null){
    //     return;
    //   }
    //   final decoded = contract.event('BalanceChange').decodeResults(event.topics!, event.data!);
    //   print('Listen Event: $decoded');
    //   List<String> balanceList = decoded.map((e) => e.toInt().toString()).toList();
    //   // _prefs.setStringList(savedBalance, balanceList);
    // });

  }


}

class ERC721ContractNotifier with ChangeNotifier {
  static const contractName = 'ERC721SuitUnlimited';
  // static const contractAddress = '0x9ebF2d973000780b403522259b09dad9E3B59256'; //sepolia
  static final contractAddress = EthereumUtils.webData.erc721address; //sepolia
  // static final abiPath = Assets.abi.abi;
  // static final abiPath = Assets.abi.erc721;
  static final abiPath = Assets.abi.sepolia721;
  late ContractModel contractModel;

  static String strGetBalance = 'getBalance';
  static String strSafeMint = '_safeMint';
  static String strTokenURI = 'tokenURI';
  static String strAddLevelAndRewardForMeet= 'addLevelAndRewardForMeet';

  bool showLoading = true;
  ERC721ContractNotifier() {
    getInit();
  }

  Future<void> getInit() async {
    print('getInit ERC721');

    contractModel = await ContractModel.create(
        contractName: contractName,
        abiPath: abiPath,
        contractAddressKey: contractAddress);

    // EthereumUtils().listenEvent(contract: contractModel.contract);

    await getBalance(notify: false);

    showLoading = false;
    notifyListeners();
  }

  int balance = 0;

  Future getBalance({bool notify = true}) async {
    final currentFunction = strGetBalance;

    print('getBalance');

    List<dynamic> response = await EthereumUtils().read(
        strSender: EthereumUtils.webData.ownerAddress,
        contract: contractModel.contract,
        functionName: currentFunction,
        args: []
    );

    print('response $response');

    final result = response.first as BigInt;
    print('getBalance result $result'); //_BigIntImpl
    balance = result.toInt();

    if (notify) {
      notifyListeners();
    }
  }

  Future getTokenURI({required BuildContext context, }) async {

    // final currentFunction = strTokenURI;
    // List<dynamic> response = await EthereumUtils().read(
    //     strSender: EthereumUtils.ownerAddress,
    //     contract: contractModel.contract,
    //     functionName: currentFunction,
    //     args: []
    // );
    // final tokenURI = response.first;
    // print('tokenURI $tokenURI');

    const tokenURI = 'ipfs://bafybeifglluvlsceknmh3dqsho3ci7xmpjvn6fhox72ve54ncpxvwljbgq/2';
    final test = tokenURI.split('://').last;
    final link = 'https://nftstorage.link/ipfs/$test';
    http.Response response = await http.get(Uri.parse(link));
    final statusCode = response.statusCode;
    print('statusCode $statusCode');

    if(statusCode==200){
      final results = jsonDecode(response.body);
      final imageFps = results['image'];
      final String imageFpsTest = imageFps.split('://').last;
      final fpsList = imageFpsTest.split('/');
      final storageLink = 'https://${fpsList.first}.ipfs.nftstorage.link/${fpsList.last}';
      print('storageLink $storageLink');

      const mumbaiContractAddress = '0xe2d074be971c9290b5bbab059f9c510b0c76936d';
      const webName = 'mumbai';
      final tokenID = fpsList.last.split('.').first;

      final seaLink = 'https://testnets.opensea.io/assets/$webName/$mumbaiContractAddress/$tokenID';
      print('seaLink $seaLink');
    }
    else{
      showSimpleDialog(title: 'Ошибка', text: 'Статус: $statusCode', context: context);
    }
  }

  Future<String> safeMint() async {
    print('safeMint');
    // if(AppConstants.isTest){
    //   // const hash = '0x6f3b2736dd6249e50dd6e89f460c7d01cd24b42c9007f50332ba66a8890dc039'; //Goerli
    //   const hash = '0xd06ff88ceaa657ae5412aad3b6ea7e589086ebb35eb4ff553e7b7e8c3c981d64'; //Mumbai
    //   return hash;
    // }

    // final transferEvent = contractModel.contract.event('Transfer');
    // final filter = FilterOptions.events(contract: contractModel.contract, event: transferEvent);
    // // final events = EthereumUtils().ethClient.events(filter);
    //
    // // final logs = await EthereumUtils().ethClient.getTransactionReceipt('0x2ea799f13789b6f00b31d4b25ad63b4aedf2492d8669e9889bd9dcfb95b2bce9');
    // // final logs = await EthereumUtils().ethClient.events(filter).forEach((element) {print(element.address.toString());});
    // final logs = await EthereumUtils().ethClient.events(FilterOptions()).length;
    // print('logs $logs');

    //uint256 private _tokenPrice = 10000000000000000; //0.01 ETH

    final currentFunction = strSafeMint;

    final response = await EthereumUtils().write(
      contract: contractModel.contract,
      functionName: currentFunction,
      strSender: EthereumUtils.myAddress,
      // ethValue: 0.01,
      ethValue: 0.05,
      args: [EthereumAddress.fromHex(EthereumUtils.myAddress)],
    );

    print('response $response');

    return response;
  }

  Future<String> addLevelAndRewardForMeet() async {
    print('addLevelAndRewardForMeet');

    final currentFunction = strAddLevelAndRewardForMeet;

    final response = await EthereumUtils().write(
      contract: contractModel.contract,
      functionName: currentFunction,
      strSender: EthereumUtils.myAddress,
      // ethValue: 0.01,
      args: [EthereumAddress.fromHex(EthereumUtils.myAddress), BigInt.from(2), EthereumAddress.fromHex(EthereumUtils.webData.ownerAddress), BigInt.from(0), true],
    );

    print('response $response');
    return response;
  }


}



// class ExampleContractNotifier with ChangeNotifier {
//   static const contractName = 'FirstCoin';
//   static const contractAddress = 'CONTRACT_ADDRESS_EXAMPLE';
//   static final abiPath = Assets.abi.abi;
//   late ContractModel contractModel;
//
//   static String strGetBalance = 'getBalance';
//   static String strWithdraw = 'withdraw';
//   static String strDeposit = 'deposit';
//
//   bool showLoading = true;
//   ExampleContractNotifier() {
//     getInit();
//   }
//
//   Future<void> getInit() async {
//     print('getInit');
//     contractModel = await ContractModel.create(
//         contractName: contractName,
//         abiPath: abiPath,
//         contractAddressKey: contractAddress);
//     await getBalance(notify: false);
//
//     showLoading = false;
//     notifyListeners();
//   }
//
//   int balance = 0;
//
//   Future getBalance({bool notify = true}) async {
//     List<dynamic> response = await EthereumUtils().read(
//         contract: contractModel.contract,
//         functionName: strGetBalance,
//         args: []);
//     final result = response.first as BigInt;
//     // print('getBalance result $result}');
//     balance = result.toInt();
//
//     if (notify) {
//       notifyListeners();
//     }
//   }
//
//   Future<String> withdrawCoin({required double amount}) async {
//     final bigAmount = BigInt.from(amount);
//     final response = await EthereumUtils().write(
//         contract: contractModel.contract,
//         functionName: strWithdraw,
//         args: [bigAmount]);
//     return response;
//   }
//
//   Future<String> depositCoin(double amount) async {
//     final bigAmount = BigInt.from(amount);
//     final response = await EthereumUtils().write(
//       contract: contractModel.contract,
//       functionName: strDeposit,
//       args: [bigAmount],
//     );
//     return response;
//   }
// }
//

