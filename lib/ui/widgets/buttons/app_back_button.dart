import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? func;
  final Color? contColor;
  const AppBackButton({Key? key, this.func, this.contColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: AppIconContainer(
          onTap: func ?? Navigator.of(context).pop,
          icon: NetworkIcons.arrow_back,
          iconSize: 14.sp,
          contColor: contColor,
        ));
  }
}