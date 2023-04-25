import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/utils/utils.dart';
import 'package:web3dart/web3dart.dart';

class ExampleContractNotifier with ChangeNotifier {
  static const contractName = 'FirstCoin';
  static const contractAddress = 'CONTRACT_ADDRESS_EXAMPLE';
  static final abiPath = Assets.abi.abi;
  late ContractModel contractModel;

  static String strGetBalance = 'getBalance';
  static String strWithdraw = 'withdraw';
  static String strDeposit = 'deposit';

  bool showLoading = true;
  ExampleContractNotifier(){
    getInit();
  }

  Future<void> getInit() async {
    print('getInit $getInit');
    contractModel = await ContractModel.create(contractName: contractName, abiPath: abiPath, contractAddressKey: contractAddress);
    await getBalance(notify: false);
    showLoading = false;
    notifyListeners();
  }
  int balance = 0;

  Future getBalance({bool notify = true}) async {
    List<dynamic> response = await EthereumUtils().read(contract: contractModel.contract, functionName: strGetBalance, args: []);
    final result = response.first as BigInt;
    print('result $result type ${result.runtimeType}'); //_BigIntImpl
    balance = result.toInt();

    if(notify){
      notifyListeners();
    }
  }

  Future<String> withdrawCoin({required double amount}) async {
    final bigAmount = BigInt.from(amount);
    final response = await EthereumUtils().write(contract: contractModel.contract, functionName: strWithdraw, args: [bigAmount]);
    return response;
  }

  Future<String> depositCoin(double amount) async {
    final bigAmount = BigInt.from(amount);
    final response = await EthereumUtils().write(
        contract: contractModel.contract, functionName: strDeposit, args: [bigAmount],);
    return response;
  }

}

class EthereumUtils {
  static final envInfuraApiKey = Utils.getEnv('INFURA_API_KEY');
  static final envMetamaskPrivateKey = Utils.getEnv('METAMASK_PRIVATE_KEY');
  static final EthPrivateKey credential = EthPrivateKey.fromHex(envMetamaskPrivateKey);

  static final infura = "https://sepolia.infura.io/v3/$envInfuraApiKey";

  static final http.Client httpClient = http.Client();
  final Web3Client ethClient = Web3Client(infura, httpClient);
  static const chainID = 11155111;

  Future<List<dynamic>> read(
      {required String functionName,
      required List<dynamic> args,
      required DeployedContract contract,}) async {

    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args,);
    return result;
  }

  Future<String> write(
      {required String functionName,
      required List<dynamic> args,
      required DeployedContract contract,}) async {
    try {
      final ethFunction = contract.function(functionName);
      final result = await ethClient.sendTransaction(
          credential,
          Transaction.callContract(
              contract: contract,
              function: ethFunction,
              parameters: args,
              maxGas: 100000,),
          chainId: chainID,);
      return result;
    } catch (e) {
      print("Something wrong happened! - $e");
    }

    return '';
  }

// StreamSubscription listenEvent(){
//   final events = ethClient.events(FilterOptions.events(contract: contract, event: contract.event('BalanceChange')));
//   return events.listen((FilterEvent event) {
//     if(event.topics==null || event.data == null){
//       return;
//     }
//     final decoded = contract.event('BalanceChange').decodeResults(event.topics!, event.data!);
//     print('Listen Event: $decoded');
//     List<String> balanceList = decoded.map((e) => e.toInt().toString()).toList();
//     // _prefs.setStringList(savedBalance, balanceList);
//   });
//
// }
}

class ContractModel{
  final String contractName;
  final String abiPath;
  final String envContractAddress; //"CONTRACT_ADDRESS_EXAMPLE"
  final DeployedContract contract;
  ContractModel({required this.contractName, required this.abiPath, required this.envContractAddress, required this.contract});

  static Future<ContractModel> create({required String contractName, required String abiPath, required String contractAddressKey,}) async {
    final String envContractAddress = Utils.getEnv(contractAddressKey);
    final contract = await getDeployedContract(contractName: contractName, abiPath: abiPath, envContractAddress: envContractAddress);
    final contractModel = ContractModel(contractName: contractName, abiPath: abiPath, envContractAddress: envContractAddress, contract: contract);
    return contractModel;
  }

  static Future<DeployedContract> getDeployedContract({required String contractName, required String abiPath, required String envContractAddress}) async {
    final abi = await rootBundle.loadString(abiPath);
    final contract = DeployedContract(ContractAbi.fromJson(abi, contractName), EthereumAddress.fromHex(envContractAddress));
    return contract;
  }

}

