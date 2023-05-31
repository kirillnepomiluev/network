import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingMatchingProfileInfo extends StatelessWidget {
  const MeetingMatchingProfileInfo({
    Key? key,
    required this.strName,
    required this.imageUrl,
    required this.level,
  }) : super(key: key);
  final String strName;
  final String imageUrl;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCircleAvatar(
          imageUrl: imageUrl,
          contSize: 48.sp, //120
        ),
        Padding(
            padding: EdgeInsets.only(top: Res.s20),
            child: NameWithVerification(
              strName: strName,
              showVerified: true,
              textStyle: AppTextStyles.primary16,
              iconSize: 16.sp,
            ),),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            Utils.getLevel(level),
            // '${AppString.of(context).level} "$level"',
            style: AppTextStyles.primary12,
          ),
        ),
      ],
    );
  }
}