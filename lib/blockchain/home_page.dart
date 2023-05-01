import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'custom_button.dart';
import 'eth_utils.dart';

class ContractTestView extends StatefulWidget {
  ContractTestView({Key? key}) : super(key: key);

  @override
  _ContractTestViewState createState() => _ContractTestViewState();
}

class _ContractTestViewState extends State<ContractTestView> {
  EthereumUtils ethUtils = EthereumUtils();

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    final erc721Provider = Provider.of<ERC721ContractNotifier>(context);
    // final balance = exampleContractModel.balance;
    final balance = erc721Provider.balance;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Basic dApp",
          style: TextStyle(
            // fontFamily: 'vtks_distress',
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:

            erc721Provider.showLoading? const CircularProgressIndicator() :
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.3,
                    child: Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Your balance:",
                            style: TextStyle(
                                color: Colors.black38, fontSize: 18.0),
                          ),
                          Text(
                                  "$balance",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.blue.shade600),
                                  textAlign: TextAlign.center,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  title: "REFRESH",
                  color: Colors.greenAccent,
                  onTapped: erc721Provider.getBalance,
                ),
                SfSlider(
                  min: 0.0,
                  max: 10.0,
                  value: _value,
                  interval: 1,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  stepSize: 1.0,
                  onChanged: (dynamic value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                CustomButton(
                  title: "DEPOSIT",
                  color: Colors.blueAccent,
                  onTapped: () async {
                    // var _depositReceipt = await erc721Provider.depositCoin(_value);
                    // print("Deposit response: $_depositReceipt");
                    // if (_value == 0) {
                    //   insertValidValue(context);
                    //   return;
                    // } else {
                    //   showReceipt(context, "deposit", _depositReceipt);
                    // }
                  },
                ),
                CustomButton(
                  title: "SAFE MINT",
                  color: Colors.pinkAccent,
                  onTapped: () async {

                    erc721Provider.safeMint();

                    // var _widthrawReceipt = await exampleContractModel.withdrawCoin(amount: _value);
                    // print("Withdraw response: $_widthrawReceipt");
                    // if (_value == 0) {
                    //   insertValidValue(context);
                    //   return;
                    // } else {
                    //   showReceipt(context, "withdraw", _widthrawReceipt);
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

insertValidValue(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.8),
          title: const Text(
            'Not allowed',
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontFamily: 'vtks_distress',
              fontSize: 18.0,
            ),
          ),
          content: const Text('Please insert a \nvalue different from 0!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
              )),
          actions: [
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

showReceipt(BuildContext context, String text, String receipt) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(1),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Thank you for submiting a $text",
              textAlign: TextAlign.center,
              style: const TextStyle(
                // fontFamily: 'vtks_distress',
                fontSize: 18.0,
              ),
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Use the transaction hash bellow to check if it was successful",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Raleway',
                      color: Colors.blueGrey.shade600),
                ),
                SelectableText(receipt,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Ok', style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
