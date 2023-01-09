import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletExchangeInfoContainer extends StatelessWidget {
  const WalletExchangeInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppContainer(
        width: double.infinity,
        radius: AppBorderRadius.r15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.sp,
            ),
            const Text(
              'Вы получите',
            ),
            SizedBox(height: UtilsResponsive.getResSize(15)),
            Text('0.00045 BTC',
                style: AppTextStyles.salad38
                    .copyWith(fontWeight: FontWeight.w600)),
            Padding(
                padding: EdgeInsets.only(
                    left: 20.sp, //22
                    right: 20.sp, //22
                    top: 27.sp, //37
                    bottom: 18.5.sp //19
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Комиссия (2%)',
                    ),
                    Text('0.00015', style: AppTextStyles.primary18),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
