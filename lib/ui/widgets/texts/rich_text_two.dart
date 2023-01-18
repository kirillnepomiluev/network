import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/utils_responsive.dart';

class RichTextTwo extends StatelessWidget {
  final String text1;
  final String text2;
  final double? fontSize;
  final FontWeight fontWeight1;
  final FontWeight fontWeight2;
  final Color color1;
  final Color color2;
  final TextAlign textAlign;

  const RichTextTwo({
    Key? key,
    this.text1 = '',
    this.text2 = '',
    this.fontSize,
    this.fontWeight1 = FontWeight.w600,
    this.fontWeight2 = FontWeight.w600,
    this.color1 = AppColors.textWhite,
    this.color2 = AppColors.salad,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: color1,
          fontSize: fontSize?? UtilsResponsive.getResSize(20), // 20.sp, //24
          fontWeight: fontWeight1,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
          ),
          TextSpan(
              text: text2,
              style: TextStyle(
                fontWeight: fontWeight2,
                color: color2,
              )),
        ],
      ),
      // minFontSize: 14,
    );
  }
}
