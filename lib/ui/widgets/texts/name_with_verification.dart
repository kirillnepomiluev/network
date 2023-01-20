import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NameWithVerification extends StatelessWidget {
  const NameWithVerification({
    Key? key,
    required this.strName,
    required this.showVerified, this.textStyle, this.iconSize,
  }) : super(key: key);
  final String strName;
  final bool showVerified;
  final TextStyle? textStyle;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(strName,
            style: textStyle?? AppTextStyles.primary18.copyWith(fontWeight: FontWeight.w500),),
        if (showVerified)
          Padding(
            padding: const EdgeInsets.only(left: 5.75),
            child: Icon(
              Icons.verified,
              color: AppColors.salad,
              size: iconSize?? 18.sp, //17
            ),
          ),
      ],
    );
  }
}
