import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/wallet.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class VerifyMnemonicPage extends StatefulWidget {
  final String mnemonic;

  const VerifyMnemonicPage({Key? key, required this.mnemonic})
      : super(key: key);

  @override
  _VerifyMnemonicPageState createState() => _VerifyMnemonicPageState();
}

//sting grab valve crush differ survey dirt wait army clerk rib tribe

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  bool isLoading = false;
  String verificationText = '';

  Future<void> verifyMnemonic(WalletProvider walletProvider) async {

   Utils.unFocus();
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));

    if (verificationText.trim() == widget.mnemonic.trim()) {

      await walletProvider.getPrivateKey(widget.mnemonic);

      context.router.pushAndPopUntil(HomeViewRoute(initIndex: 2), predicate: (route) => false);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const WalletPage()),
      // );

    }else{
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong mnemonic, paste text from clipboard')));
    }
  }

  @override
  Widget build(BuildContext context) {

    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          isLoading? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Assets.images.avatars.avatar3D.image(
                width: 200,
                height: 200
              ),

              SizedBox(height: 20,),

              Text('Preparing your wallet...', style: AppTextStyles.primary20,),
            ],
          )
          // SimpleCircularProgressBar(
          //   animationDuration: 5,
          //   progressColors: const [AppColors.salad],
          //   mergeMode: true,
          // )
          ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Column(
                children: [
                  AppBarRow(),
                  SizedBox(height: 20,),
                  Text(
                    'Please verify your mnemonic phrase. Before continuing, make sure you have saved the phrase.',
                    style: AppTextStyles.primary18,
                  ),
                ],
              ),
              // const SizedBox(height: 24.0),
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

              // const SizedBox(height: 16.0),

              AppButton(onPressed: (){
                verifyMnemonic(walletProvider);
              }, text: 'Verify'),

              // const SizedBox(height: 24.0),
              // AppButton(
              //   onPressed: isVerified ? navigateToWalletPage : null,
              //   text: 'Next',
              //   // style: ElevatedButton.styleFrom(
              //   //   backgroundColor: Colors.white,
              //   //   foregroundColor: Colors.black,
              //   // ),
              //   // child: const Text('Next'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
