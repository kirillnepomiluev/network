import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:provider/provider.dart';

import 'wallet.dart';
import 'create_or_import.dart';

class WalletLoginPage extends StatelessWidget {
  const WalletLoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    print('walletProvider.privateKey ${walletProvider.privateKey}');

    if(walletProvider.initialized==false){
      return const CircularProgressIndicator();
    }
    else if (walletProvider.privateKey == null) {
      // If private key doesn't exist, load CreateOrImportPage
      return const WalletCreateOrImportPage();
    } else {
      // If private key exists, load WalletPage
      return const WalletPage();
    }
  }
}
