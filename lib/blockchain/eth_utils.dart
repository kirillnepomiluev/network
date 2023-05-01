import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/utils/utils.dart';
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
    final String envContractAddress = Utils.getEnv(contractAddressKey);
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

const String ownerAddress = '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17';
const String myAddress = '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17';

class EthereumUtils {
  static final envInfuraApiKey = Utils.getEnv('INFURA_API_KEY');
  static final envMetamaskPrivateKey = Utils.getEnv('METAMASK_PRIVATE_KEY');
  static final EthPrivateKey credential =
  EthPrivateKey.fromHex(envMetamaskPrivateKey);

  static final infura = "https://goerli.infura.io/v3/$envInfuraApiKey";

  static final http.Client httpClient = http.Client();
  final Web3Client ethClient = Web3Client(infura, httpClient);
  static const chainID = 5;

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
      final result = await ethClient.sendTransaction(
        credential,
        Transaction.callContract(
          value: value,
          from: sender,
          contract: contract,
          function: ethFunction,
          parameters: args,
          // maxGas: 100000,
        ),
        chainId: chainID,
      );
      return result;
    } catch (e) {
      print("Something wrong happened! - $e");
    }

    return '';
  }


  listenEvent({required DeployedContract contract}) async {

    // final events = ethClient.events(FilterOptions.events(contract: contract, event: contract.event('BalanceChange')));

    print('listenEvent');

    final transferEvent = contract.event('Transfer');
    final filter = FilterOptions.events(contract: contract, event: transferEvent);
    final events = ethClient.events(filter);
    // final logs = await ethClient.getTransactionReceipt('0x2ea799f13789b6f00b31d4b25ad63b4aedf2492d8669e9889bd9dcfb95b2bce9');
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
  static const contractAddress = 'CONTRACT_ADDRESS_ERC721';
  static final abiPath = Assets.abi.erc721;
  late ContractModel contractModel;

  static String strGetBalance = 'getBalance';
  static String strSafeMint = '_safeMint';

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

    EthereumUtils().listenEvent(contract: contractModel.contract);

    await getBalance(notify: false);

    showLoading = false;
    notifyListeners();
  }

  int balance = 0;

  Future getBalance({bool notify = true}) async {

    List<dynamic> response = await EthereumUtils().read(
        strSender: ownerAddress,
        contract: contractModel.contract,
        functionName: strGetBalance,
        args: []
    );

    final result = response.first as BigInt;
    print('getBalance result $result'); //_BigIntImpl
    balance = result.toInt();

    if (notify) {
      notifyListeners();
    }
  }

  Future<String> safeMint() async {
    print('safeMint');

    // final transferEvent = contractModel.contract.event('Transfer');
    // final filter = FilterOptions.events(contract: contractModel.contract, event: transferEvent);
    // // final events = EthereumUtils().ethClient.events(filter);
    //
    // // final logs = await EthereumUtils().ethClient.getTransactionReceipt('0x2ea799f13789b6f00b31d4b25ad63b4aedf2492d8669e9889bd9dcfb95b2bce9');
    // // final logs = await EthereumUtils().ethClient.events(filter).forEach((element) {print(element.address.toString());});
    // final logs = await EthereumUtils().ethClient.events(FilterOptions()).length;
    // print('logs $logs');


    //uint256 private _tokenPrice = 10000000000000000; //0.01 ETH
    final response = await EthereumUtils().write(
      contract: contractModel.contract,
      functionName: strSafeMint,
      strSender: myAddress,
      ethValue: 0.01,
      args: [EthereumAddress.fromHex(myAddress)],
    );

    print('response $response');
    return response;
  }


}


class ExampleContractNotifier with ChangeNotifier {
  static const contractName = 'FirstCoin';
  static const contractAddress = 'CONTRACT_ADDRESS_EXAMPLE';
  static final abiPath = Assets.abi.abi;
  late ContractModel contractModel;

  static String strGetBalance = 'getBalance';
  static String strWithdraw = 'withdraw';
  static String strDeposit = 'deposit';

  bool showLoading = true;
  ExampleContractNotifier() {
    getInit();
  }

  Future<void> getInit() async {
    print('getInit');
    contractModel = await ContractModel.create(
        contractName: contractName,
        abiPath: abiPath,
        contractAddressKey: contractAddress);
    await getBalance(notify: false);

    showLoading = false;
    notifyListeners();
  }

  int balance = 0;

  Future getBalance({bool notify = true}) async {
    List<dynamic> response = await EthereumUtils().read(
        contract: contractModel.contract,
        functionName: strGetBalance,
        args: []);
    final result = response.first as BigInt;
    // print('getBalance result $result}');
    balance = result.toInt();

    if (notify) {
      notifyListeners();
    }
  }

  Future<String> withdrawCoin({required double amount}) async {
    final bigAmount = BigInt.from(amount);
    final response = await EthereumUtils().write(
        contract: contractModel.contract,
        functionName: strWithdraw,
        args: [bigAmount]);
    return response;
  }

  Future<String> depositCoin(double amount) async {
    final bigAmount = BigInt.from(amount);
    final response = await EthereumUtils().write(
      contract: contractModel.contract,
      functionName: strDeposit,
      args: [bigAmount],
    );
    return response;
  }
}


