import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/widgets/meeting_matching_profile_info.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingMatchingProfilesRow extends StatelessWidget {
  const MeetingMatchingProfilesRow({
    Key? key, required this.creatorModel,
  }) : super(key: key);
  final UserModel creatorModel;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MeetingMatchingProfileInfo(
          strName: userData.name,
          level: userData.levelText,
          imageUrl: Assets.images.avatars.avatar0.keyName,
        ),
        Padding(
            padding: EdgeInsets.only(top: Res.s35), //35
            child: AppIconContainer(
              icon: NetworkIcons.electric,
              contColor: AppColors.salad,
              iconSize: 18.sp,
              contSize: 30.sp, //48
              iconColor: Colors.black,
            ),),
        MeetingMatchingProfileInfo(
          strName: creatorModel.name,
          level: creatorModel.levelText,
          imageUrl: Assets.images.avatars.avatar1.keyName,
        ),
      ],
    );
  }
}
