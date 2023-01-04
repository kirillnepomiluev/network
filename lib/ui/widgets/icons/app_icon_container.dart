import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppIconContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? contColor;
  final double? iconSize;
  final double? contSize;
  final VoidCallback? onTap;
  const AppIconContainer(
      {Key? key,
        required this.icon,
        this.onTap,
        this.iconColor = Colors.white,
        this.contColor,
        this.iconSize,
        this.contSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: contSize ?? 28.sp, //43
        height: contSize ?? 28.sp,
        decoration: BoxDecoration(
          color: contColor ?? AppColors.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: iconColor, size: iconSize ?? 20.sp //20
        ),
      ),
    );
  }
}
