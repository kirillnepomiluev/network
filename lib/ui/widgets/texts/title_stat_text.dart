import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class TitleStatText extends StatelessWidget {
  final String text;
  const TitleStatText(this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        text,
        style: AppTextStyles.primary20w5,
        // style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.w600,
        //     fontSize: 19.sp //20
        // ),
      ),
    );
  }
}
