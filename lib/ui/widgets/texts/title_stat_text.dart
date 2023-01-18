import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/utils_responsive.dart';

class TitleStatText extends StatelessWidget {
  final String text;
  const TitleStatText(this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
        top: UtilsResponsive.getResSize(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.primary20.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
