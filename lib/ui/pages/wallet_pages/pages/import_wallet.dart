import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/wallet.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ImportWallet extends StatefulWidget {
  const ImportWallet({Key? key}) : super(key: key);

  @override
  _ImportWalletState createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  bool isVerified = false;
  String mnemonic = '';

  void navigateToWalletPage() {
    context.router.pushAndPopUntil(HomeViewRoute(initIndex: 2), predicate: (route) => false);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const WalletPage()),
    // );
  }

  // Future<void> verifyMnemonic() async {
  //   final walletProvider = Provider.of<WalletProvider>(context, listen: false);
  //   await walletProvider.getPrivateKey(verificationText);
  //   navigateToWalletPage();
  // }

  bool isLoading = false;

  Future<void> verifyMnemonic(WalletProvider walletProvider) async {

    Utils.unFocus();
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));

    await walletProvider.getPrivateKey(mnemonic);

    context.router.pushAndPopUntil(HomeViewRoute(initIndex: 2), predicate: (route) => false);
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
                    'Input a mnemonic phrase to access an existing wallet. If you don\'t have a wallet yet, you can create one on the previous page',
                    style: AppTextStyles.primary18,
                  ),
                ],
              ),

              AppTextField(
                onChanged: (value) {
                  setState(() {
                    mnemonic = value!;
                  });
                },
                labelText: 'Enter mnemonic phrase',
              ),

              AppButton(
                onPressed: (){
                  verifyMnemonic(walletProvider);
                },
                text: 'Import'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
