import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/border_radius/app_border_radius.dart';

class AppContainer extends StatelessWidget {
  final Color? color;
  final double radius;
  final double padH;
  final double padV;
  final double? width;
  final double? height;
  final Widget? child;
  const AppContainer(
      {Key? key,
      this.color,
      this.radius = AppBorderRadius.r20,
      this.padH = 0, //18
      this.padV = 0, //23
      this.child,
      this.width,
      this.height
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? ConstColor.white10,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.symmetric(vertical: padH, horizontal: padV),
      child: child,
    );
  }
}
