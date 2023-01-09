import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingMatchingProfileInfo extends StatelessWidget {
  final String strName;
  final String imageUrl;
  const MeetingMatchingProfileInfo({
    Key? key, required this.strName, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppCircleAvatar(
          imageUrl: imageUrl,
          contSize: 120,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
            NameWithVerification(strName: strName, showVerified: true, textStyle: AppTextStyles.primary16, iconSize: 16.sp,)
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            '${AppString.of(context).level} "${AppString.of(context).base}"',
            style: AppTextStyles.primary12,
          ),
        ),
      ],
    );
  }
}
