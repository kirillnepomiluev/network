import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppContainer extends StatelessWidget {
  const AppContainer(
      {Key? key,
      this.color,
      this.radius = AppBorderRadius.r20,
      this.padH = 0, //18
      this.padV = 0, //23
      this.child,
      this.width,
      this.height, this.boxBorder, this.borderColor,
      })
      : super(key: key);

  factory AppContainer.outlined({required Widget child, double? width, double? height, Color? borderColor}){
    return AppContainer(
      boxBorder: Border.all(color: borderColor??AppColors.salad),
      color: Colors.transparent,
      padH: 18.sp,
      padV: 18.sp,
      width: width,
      height: height,
      child: child,
    );
  }
  final Color? color;
  final Color? borderColor;
  final double radius;
  final double padH;
  final double padV;
  final double? width;
  final double? height;
  final Widget? child;
  final BoxBorder? boxBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppColors.white10,
        borderRadius: BorderRadius.circular(radius),
        // shape: BoxShape.rectangle
        border: boxBorder,
      ),
      padding: EdgeInsets.symmetric(vertical: padV, horizontal: padH),
      child: child,
    );
  }
}
