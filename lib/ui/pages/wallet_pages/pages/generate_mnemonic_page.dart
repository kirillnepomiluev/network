import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/verify_mnemonic_page.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenerateMnemonicPage extends StatelessWidget {
  const GenerateMnemonicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    final mnemonicWords = mnemonic.split(' ');
    // final mnemonicText = mnemonic.split('\n').toString();
    // final mnemonicText = mnemonic.replaceAll(' ', '\n');

    void copyToClipboard() {
      Clipboard.setData(ClipboardData(text: mnemonic));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mnemonic copied to Clipboard')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyMnemonicPage(mnemonic: mnemonic),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Generate Mnemonic'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  const AppBarRow(),
                  const SizedBox(height: 20,),
                  Text(
                    'Please store this mnemonic phrase safely. You will not be able to restore access to the wallet without it. We do not store this data.',
                    style: AppTextStyles.primary18,
                  ),
                ],
              ),
              // const SizedBox(height: 24.0),

              Wrap(
                spacing: 20.sp,
                children: [
                  for (final item in mnemonicWords)
                    Text(
                      // '${index + 1}. ${mnemonicWords[index]}',
                      item,
                      // style: const TextStyle(fontSize: 22.0),
                      style: AppTextStyles.salad20,
                    )
                ],
              ),

              // SelectableText(mnemonicText, style: AppTextStyles.primary16,),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: List.generate(
              //     mnemonicWords.length,
              //     (index) => Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 4.0),
              //       child: Text(
              //         '${index + 1}. ${mnemonicWords[index]}',
              //         style: const TextStyle(fontSize: 16.0),
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 24.0),

              AppButton(onPressed: copyToClipboard, text: 'Copy and Continue')

              // ElevatedButton.icon(
              //   onPressed: () {
              //     copyToClipboard();
              //   },
              //   icon: const Icon(Icons.copy),
              //   label: const Text('Copy to Clipboard'),
              //   style: ElevatedButton.styleFrom(
              //     padding: const EdgeInsets.symmetric(vertical: 24.0),
              //     textStyle: const TextStyle(fontSize: 20.0),
              //     elevation: 4,
              //     shadowColor: Colors.black.withOpacity(0.4),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
