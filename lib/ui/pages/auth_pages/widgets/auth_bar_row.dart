import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';

class AuthBarRow extends StatelessWidget {
  final bool isAuth;
  final String title;
  const AuthBarRow({Key? key, this.isAuth=true, this.title=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAuth
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppBackButton(),
        AppContainer(
            radius: AppBorderRadius.r15,
            padH: 18,
            padV: 12,
            child: Row(
              children: [
                Text(AppString.of(context).skip),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColors.salad100,
                    size: 20,
                  ),
                )
              ],
            )),
      ],
    )
        : Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const AppBackButton(),
          Center(
              child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.primary18w5))
        ],
      ),
    );
  }
}
