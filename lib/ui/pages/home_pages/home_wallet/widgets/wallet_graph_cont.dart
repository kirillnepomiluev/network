import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_crypto_container.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_grapsh_svg.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/wallet_currency_data.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletGraphCont extends StatelessWidget {
  const WalletGraphCont({
    Key? key, required this.data,
  }) : super(key: key);

  final WalletCurrencyData data;

  @override
  Widget build(BuildContext context) {
    const double contWidth = 165;
    const double contHeight = contWidth * 0.3333333333333333;
    final bool isDark = data.title == 'SOL';

    return Padding(
      padding: EdgeInsets.only(right: 20.sp, //21
          ),
      child: Container(
        padding: EdgeInsets.only(
            top: Res.s14,
            right: Res.s14,
            bottom: Res.s14,),
        width: 55.sp, //161
        decoration: BoxDecoration(
            color: isDark ? AppColors.white10 : AppColors.salad,
            borderRadius: BorderRadius.circular(15),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: Res.s14, //14
                          ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                            fontSize: Res.s16, //16
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? AppColors.salad
                                : AppColors.textBlack,),
                      ),
                      Text(
                        '+5,76%',
                        style: TextStyle(
                            fontSize: Res.s12, //12
                            fontWeight: FontWeight.w400,
                            color: isDark
                                ? AppColors.textWhite
                                : AppColors.textBlack,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Res.s14, //14
                      top: 5,),
                  child: Text(
                    data.subtitle,
                    style: TextStyle(
                        fontSize: Res.s14, //14
                        fontWeight: FontWeight.w400,
                        color: isDark ? AppColors.textGray : AppColors.black1A,),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(top: Res.s26), //27
              child: Transform.scale(
                scaleY: isDark ? -1 : 1,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 0.8,
                    heightFactor: 1.0,
                    child: CustomPaint(
                      size: const Size(contWidth,
                          contHeight,), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: WalletGraphSvg(isDark: isDark),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Res.s10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Вы получите',
                      style: TextStyle(
                          fontSize: Res.s10, //10
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? AppColors.textGray
                              : AppColors.textBlack,),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: Res.s14, //14
                        top: Res.s12, //12
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WalletCryptoContainer(data: data, isDark: isDark),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '0.00045',
                              style: TextStyle(
                                  fontSize: Res.s14, //14
                                  fontWeight: FontWeight.w400,
                                  color: isDark
                                      ? AppColors.textWhite
                                      : AppColors.textBlack,),
                            ),
                            Row(
                              children: [
                                Icon(Icons.attach_money_sharp,
                                    size: Res.s12,
                                    color: AppColors.textBlack,),
                                Text(
                                  '20.13',
                                  style: TextStyle(
                                      fontSize:
                                          Res.s12, //12
                                      fontWeight: FontWeight.w400,
                                      color: isDark
                                          ? AppColors.salad
                                          : AppColors.textBlack,),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


