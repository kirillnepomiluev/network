import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppAddRectangleIcon extends StatelessWidget {
  const AppAddRectangleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconContainer(
      icon: Icons.add,
      contSize: 25.sp,
      iconSize: 17.5.sp,
      contColor: AppColors.salad,
      iconColor: Colors.black,
      radius: AppBorderRadius.r7,
    );
  }
}
