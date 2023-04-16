import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_crypto_container.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/main_pages/wallet_currency_data.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class WalletCurrencyContainer extends StatelessWidget {

  const WalletCurrencyContainer({
    Key? key, required this.data,
  }) : super(key: key);
  final WalletCurrencyData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.sp, //21
          ),
      child: Container(
        padding: EdgeInsets.all(22.5.sp), //27
        decoration: BoxDecoration(
            color: AppColors.white10, borderRadius: BorderRadius.circular(15),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                WalletCryptoContainer(data: data, isDark: true),
                Padding(
                  padding:
                      EdgeInsets.only(left: Res.s18, //18
                          ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyles.primary16,
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        data.subtitle,
                        style: AppTextStyles.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '0.00045',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money_sharp,
                          size: Res.s12, //12
                          color: AppColors.salad,),
                      Text(
                        '20.13',
                        style: AppTextStyles.salad12,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
