import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginLogoContainer extends StatelessWidget {
  const LoginLogoContainer({
    Key? key,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppContainer(
        padH: 17.sp,   //18
        padV: 20.sp,   //23
        width: 35.sp,   //66
        height: 35.sp, //64
        child: Image.asset(imageUrl),
      ),
    );
  }
}
