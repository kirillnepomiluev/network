import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/generate_mnemonic_page.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/import_wallet.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCreateOrImportPage extends StatelessWidget {
  const WalletCreateOrImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Network Wallet',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Logo
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                height: 200,
                child:
                Assets.images.avatars.avatar3D.image()
                // Image.asset(
                //   'assets/images/logo.png',
                //   fit: BoxFit.contain,
                // ),
              ),
            ),
            const SizedBox(height: 50.0),

            // Login button
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const GenerateMnemonicPage(),
            //       ),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor:
            //         Colors.blue, // Customize button background color
            //     foregroundColor: Colors.white, // Customize button text color
            //     padding: const EdgeInsets.all(20.0),
            //   ),
            //   child: const Text(
            //     'Create Wallet',
            //     style: TextStyle(
            //       fontSize: 18.0,
            //     ),
            //   ),
            // ),

            AppButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenerateMnemonicPage(),
                    ),
                  );
            }, text: 'Create Wallet',
              // buttonColor: Colors.blue,
              // textColor: Colors.white,
            ),

            const SizedBox(height: 16.0),

            // Register button
            AppButton(
              // height: 32.sp,
              buttonColor: Colors.transparent,
              borderColor: AppColors.salad,
              textColor: Colors.white,
              onPressed: () {
                // Add your register logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImportWallet(),
                  ),
                );
              },
              text: 'Import with mnemonic',

              // style: ElevatedButton.styleFrom(
              //   backgroundColor:
              //       Colors.white, // Customize button background color
              //   foregroundColor: Colors.black, // Customize button text color
              //   padding: const EdgeInsets.all(16.0),
              // ),
              // child: const Text(
              //   'Import from Seed',
              //   style: TextStyle(
              //     fontSize: 18.0,
              //   ),
              // ),
            ),

            const SizedBox(height: 24.0),

            // Footer
            Container(
              alignment: Alignment.center,
              child: const Text(
                '© 2023 Network. All rights reserved.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
