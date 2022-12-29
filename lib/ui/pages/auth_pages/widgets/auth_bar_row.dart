import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/skip_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';

class AuthBarRow extends StatelessWidget {
  final bool isAuth;
  final String title;
  const AuthBarRow({Key? key, this.isAuth=true, this.title=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAuth
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        BackButtonCustom(),
        SkipContainer(),
      ],
    )
        : Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BackButtonCustom(),
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
