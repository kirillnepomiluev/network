import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'custom_button.dart';
import 'eth_utils.dart';

class ContractTestView extends StatefulWidget {
  const ContractTestView({Key? key}) : super(key: key);

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
          'Basic dApp',
          style: TextStyle(
            // fontFamily: 'vtks_distress',
            fontSize: 25.0,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:

          erc721Provider.showLoading? const CircularProgressIndicator() :
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: SizedBox(
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
                          'Your balance:',
                          style: TextStyle(
                              color: Colors.black38, fontSize: 18.0),
                        ),
                        Text(
                                '$balance',
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
                title: 'REFRESH',
                color: Colors.greenAccent,
                onTapped: erc721Provider.getBalance,
              ),
              SfSlider(
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
                title: 'DEPOSIT',
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
                title: 'TEST',
                color: Colors.pinkAccent,
                onTapped: () async {
                  // erc721Provider.safeMint();
                  // erc721Provider.addLevelAndRewardForMeet();

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> insertValidValue(BuildContext context) {
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

Future<void> showReceipt(BuildContext context, String receipt) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Transaction is created',
              textAlign: TextAlign.center,
              style: AppTextStyles.primary18,
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  // "Use the transaction hash bellow to check if it was successful",
                  // 'Вы можете проверить статус по хэшу ниже:',
                  'You can check its status by this hash:',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.primary16,
                ),
                SelectableText(receipt,
                    textAlign: TextAlign.center,
                  style: AppTextStyles.primary,
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.only(bottom: Res.s20),
          actions: [
            ElevatedButton(
              child: const Text('View', style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
                context.router.push(const OrdersViewRoute());},
            ),
          ],
        );
      });
}
