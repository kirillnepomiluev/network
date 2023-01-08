import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingNotificationRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  const MeetingNotificationRichText(this.text1, this.text2, this.text3, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.5.sp, //12
        ),
        children: <TextSpan>[
          TextSpan(
              text: text1,
              style: const TextStyle(
                  color: AppColors.salad, fontWeight: FontWeight.w600)),
          TextSpan(
              text: text2,
              style: const TextStyle(fontWeight: FontWeight.w400)),
          TextSpan(
              text: text3,
              style: const TextStyle(
                  color: AppColors.salad, fontWeight: FontWeight.w600)),
        ],
      ),
      // minFontSize: 14,
    );
  }
}

