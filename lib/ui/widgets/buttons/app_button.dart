import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AppButton extends StatelessWidget {

  const AppButton(
      {Key? key,
        required this.onPressed,
        this.width = double.infinity,
        this.height,
        required this.text,
        this.buttonColor = Colors.white,
        this.textColor,
        this.borderColor,
        this.borderRadius = AppBorderRadius.r20,
        this.textStyle,
      })
      : super(key: key);
  final Color buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final String text;
  final double? width;
  final double? height;
  final double borderRadius;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height??35.sp,  //65
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor??buttonColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
        ),
        child: Text(
          text,
          style:
          textStyle??
            AppTextStyles.black18.copyWith(fontWeight: FontWeight.w500, color: textColor?? Colors.black),
          // AppTextStyles.primary18.copyWith(color: textColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
