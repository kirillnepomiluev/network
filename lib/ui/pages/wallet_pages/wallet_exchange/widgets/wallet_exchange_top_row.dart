import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class WalletExchangeTopRow extends StatelessWidget {
  const WalletExchangeTopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Вы собираетесь обменять',
            style:
                AppTextStyles.primary24.copyWith(fontWeight: FontWeight.w500)),
        RichText(
            text: TextSpan(
                style: AppTextStyles.primary24
                    .copyWith(fontWeight: FontWeight.w500),
                children: const <TextSpan>[
              TextSpan(
                  text: '300 баллов ',
                  style: TextStyle(color: AppColors.salad)),
              TextSpan(
                text: 'в ',
              ),
              TextSpan(
                  text: 'Bitcoin', style: TextStyle(color: AppColors.salad)),
            ])),
      ],
    );
  }
}
