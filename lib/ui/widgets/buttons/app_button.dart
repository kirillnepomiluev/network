import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';


class AppButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final String text;
  final double? width;
  final double? height;
  final double borderRadius;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const AppButton(
      {Key? key,
        required this.onPressed,
        this.width = double.infinity,
        this.height = 65,
        required this.text,
        this.buttonColor = Colors.white,
        this.textColor = AppColors.textBlack,
        this.borderColor = Colors.white,
        this.borderRadius = AppBorderRadius.r20,
        this.textStyle
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            )
        ),
        child: Text(
          text,
          style:
          textStyle??
          AppTextStyles.primary18.copyWith(color: textColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
