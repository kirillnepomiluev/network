import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/wallet.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class VerifyMnemonicPage extends StatefulWidget {
  final String mnemonic;

  const VerifyMnemonicPage({Key? key, required this.mnemonic})
      : super(key: key);

  @override
  _VerifyMnemonicPageState createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  bool isVerified = false;
  String verificationText = '';

  void verifyMnemonic() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    if (verificationText.trim() == widget.mnemonic.trim()) {
      walletProvider.getPrivateKey(widget.mnemonic).then((privateKey) {
        // setState(() {
        //   isVerified = true;
        // });

        Utils.unFocus();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WalletPage()),
        );

      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong mnemonic, paste text from clipboard')));
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToWalletPage() {
      Utils.unFocus();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Mnemonic and Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please verify your mnemonic phrase:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            // TextField(
            //   onChanged: (value) {
            //     setState(() {
            //       verificationText = value;
            //     });
            //   },
            //   decoration: const InputDecoration(
            //     labelText: 'Enter mnemonic phrase',
            //   ),
            // ),

            AppTextField(
              onChanged: (value) {
                setState(() {
                  verificationText = value!;
                });
              },
              labelText: 'Enter mnemonic phrase',
            ),

            const SizedBox(height: 16.0),
            AppButton(onPressed: verifyMnemonic, text: 'Verify'),

            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: isVerified ? navigateToWalletPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
