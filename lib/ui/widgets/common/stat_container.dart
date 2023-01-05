import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class StatMiniContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const StatMiniContainer({
    Key? key, required this.title, required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double contWidth = 45.sp; //107

    return BlurryContainer(
      blur: 20,
      width: contWidth, //107
      height: 55.sp, //162
      color: AppColors.white10,
      borderRadius: BorderRadius.circular(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title == ''
              ? Container()
              : Text(
                  title,
                  style: TextStyle(
                      fontSize: 23.sp, //28
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 17.5.sp, //16
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
