import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/border_radius/app_border_radius.dart';


class AppButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  const AppButton(
      {Key? key,
        required this.onPressed,
        this.width = double.infinity,
        this.height = 65,
        required this.text,
        this.buttonColor,
        this.textColor = ConstColor.textBlack
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
            backgroundColor: buttonColor?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.r20),
            )
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: getResSize(18), //18
              color: textColor
          ),
        ),
      ),
    );
  }
}
