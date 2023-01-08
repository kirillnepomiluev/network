import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';

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
                    color: AppColors.salad,
                    size: 20,
                  ),
                )
              ],
            )),
      ],
    )
        : const AppBarRow();
  }
}
