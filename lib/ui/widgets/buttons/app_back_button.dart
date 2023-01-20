import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, this.func, this.contColor})
      : super(key: key);
  final VoidCallback? func;
  final Color? contColor;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: AppIconContainer(
          onTap: func ?? context.router.pop,
          icon: NetworkIcons.arrow_back,
          iconSize: 14.sp,
          contColor: contColor,
        ),);
  }
}