import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/wallet_currency_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCryptoContainer extends StatelessWidget {
  final WalletCurrencyData data;
  final bool isDark;
  const WalletCryptoContainer({
    Key? key, required this.data, this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27.sp, //37
      height: 27.sp, //37
      decoration: BoxDecoration(
          color: isDark ? AppColors.salad : AppColors.black1A,
          borderRadius: BorderRadius.circular(15)),
      child: Icon(data.icon,
          size: data.iconSize,
          color: isDark ? AppColors.black1A : AppColors.salad),
    );
  }
}
