import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class LifeMeaningProvider extends ChangeNotifier{
  static const String contractName = 'LifeMeaning'; //название контракта
  static const String ip = '192.168.1.65'; //ip адрес сети, к которой собираемся подключиться
                               //это нужно потому, что мы исп. разные устройства
                              // через команду ipconfig - IPv4-адрес : 192.168.1.65

  static const String port = '7545'; //это порт Ganache по умолч.

  final String _rpcURL = 'http://$ip:$port'; // url-адрес rpc 
  final String _wsURL = 'ws://$ip:$port';  // url-адрес web-сокетов

  final String _privateKey = '0xfd934f4ee808fac8938362c07f0b03414bc0d8f5e36c4526abfbbe4cbde8923f'; //закрытый ключ кошелька, взяли с 1-го акка в Ganache


  late Web3Client _client;
  late DeployedContract _contract;
  late EthPrivateKey _credentials;



  LifeMeaningProvider(BuildContext context){
    
  }

  Future<void> getInit(BuildContext context) async {
    //Client() из http
    _client = Web3Client(_rpcURL, Client(), socketConnector: (){
      return IOWebSocketChannel.connect(_wsURL).cast<String>();
    });
    
    //abi - типа API для смарт контрактов
    final abiStringFile = await DefaultAssetBundle.of(context).loadString(Assets.build.contracts.lifeMeaning); //LifeMeaning.json

    final abiJson = jsonDecode(abiStringFile);
    final abi = jsonEncode(abiJson["abi"]); //извлекли abi

    //Создаем контракт
    final contractAddress = EthereumAddress.fromHex(abiJson['networks']['5777']['address']); //адрес контракта
    _credentials = EthPrivateKey.fromHex(_privateKey);
    _contract = DeployedContract(ContractAbi.fromJson(abi, contractName), contractAddress);
  }


}