import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer(
      {Key? key,
      this.color,
      this.radius = AppBorderRadius.r20,
      this.padH = 0, //18
      this.padV = 0, //23
      this.child,
      this.width,
      this.height,
      })
      : super(key: key);
  final Color? color;
  final double radius;
  final double padH;
  final double padV;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppColors.white10,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.symmetric(vertical: padV, horizontal: padH),
      child: child,
    );
  }
}
