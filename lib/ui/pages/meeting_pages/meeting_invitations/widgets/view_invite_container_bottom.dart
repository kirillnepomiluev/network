import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/meeting_go_icon.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewInviteContainerBottom extends StatelessWidget {
  const ViewInviteContainerBottom({
    Key? key,
    required this.imageUrl, required this.meetingModel, required this.creatorModel,
  }) : super(key: key);

  final String imageUrl;
  final MeetingModel meetingModel;
  final UserModel creatorModel;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppCircleAvatar(
              imageUrl: imageUrl,
              contSize: 40.sp, //83
            ),
            Padding(
              padding: EdgeInsets.only(left: Res.s21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIconContainer(
                    icon: Icons.call_made,
                    contColor: AppColors.salad,
                    iconColor: Colors.black,
                    boxShape: BoxShape.circle,
                    iconSize: 15.sp,
                    contSize: Res.s18,
                  ),
                  SizedBox(
                    height: Res.s10,
                  ),
                  Text('250 м',
                      style: AppTextStyles.salad20
                          .copyWith(fontWeight: FontWeight.w600),)
                ],
              ),
            )
          ],
        ),

        MeetingGoIcon(creatorModel: creatorModel, partnerModel: userData,  meetingModel: meetingModel),


      ],
    );
  }
}

