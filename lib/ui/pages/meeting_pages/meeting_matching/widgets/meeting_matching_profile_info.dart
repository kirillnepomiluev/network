import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_locale.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingMatchingProfileInfo extends StatelessWidget {
  const MeetingMatchingProfileInfo({
    Key? key, required this.userModel,
  }) : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCircleAvatar(
          imageUrl: userModel.avatarURL,
          contSize: 48.sp, //120
        ),
        Padding(
            padding: EdgeInsets.only(top: Res.s20),
            child: NameWithVerification(
              userModel: userModel,
              textStyle: AppTextStyles.primary16,
              iconSize: 16.sp,
            ),),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            UtilsLocale.getLevelText(userModel.level, context),
            // '${AppString.of(context).level} "$level"',
            style: AppTextStyles.primary12,
          ),
        ),
      ],
    );
  }
}