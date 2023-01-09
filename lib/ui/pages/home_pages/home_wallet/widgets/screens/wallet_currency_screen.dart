import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_currency_container.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/main_pages/wallet_currency_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCurrencyScreen extends StatelessWidget {
  const WalletCurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.sp,),
        AppButton(
          onPressed: () {},
          text: 'Смотреть историю пополнений',
        ),
        SizedBox(height: 21.sp,),
        for (final WalletCurrencyData data in WalletCurrencyData.currencyList)
          WalletCurrencyContainer(data: data),
      ],
    );
  }
}