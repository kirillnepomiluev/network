import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/res.dart';

class TitleStatText extends StatelessWidget {
  const TitleStatText(this.text, {
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
        top: Res.s20,
      ),
      child: Text(
        text,
        style: AppTextStyles.salad20.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
