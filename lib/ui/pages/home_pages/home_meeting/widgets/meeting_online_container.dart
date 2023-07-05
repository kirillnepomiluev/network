import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';

class MeetingOnlineContainer extends StatelessWidget {
  const MeetingOnlineContainer({
    Key? key, required this.partnerModel,
  }) : super(key: key);
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    final online = partnerModel.online;
    // const online = true;
    return Column(
      children: [
        AppContainer(
          color: Colors.black,
          radius: AppBorderRadius.r30,
          padV: 5,
          padH: 17,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle,
                color: online? AppColors.salad : AppColors.grey,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(online? 'Online' : 'Offline',
                    style: AppTextStyles.primary12,),
              ),
            ],
          ),
        ),

        if(partnerModel.avatarURL != AppConstants.baseAvatarUrl)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppCircleAvatar(contSize: Res.s60, avatarUrl: partnerModel.avatarURL, isAssetImage: false,),
        )

      ],
    );
  }
}
