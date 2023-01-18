import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
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
        AppContainerWithRemove(title: AppString.of(context).skip,),
      ],
    )
        : const AppBarRow();
  }
}

