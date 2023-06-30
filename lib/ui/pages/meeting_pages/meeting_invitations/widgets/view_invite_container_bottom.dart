import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils_locale.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InviteContainerAvatarRow extends StatelessWidget {
  const InviteContainerAvatarRow({
    Key? key,
   required this.meetingModel,  required this.isInvitation, required this.showDetails,
  }) : super(key: key);

  final MeetingModel meetingModel;
  final bool isInvitation;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    final userModel = isInvitation? meetingModel.creatorModel : meetingModel.partnerModel;
    final partnerLevel = isInvitation? meetingModel.creatorLevel : meetingModel.partnerLevel;
    final yourLevel = isInvitation? meetingModel.partnerLevel : meetingModel.creatorLevel;
    return
      PartnerAvatarRow(
        userModel: userModel,
        partnerLevel: partnerLevel,
        yourLevel: yourLevel,
        showYourLevel: showDetails,
      );
  }
}


class PartnerAvatarRow extends StatelessWidget {
  const PartnerAvatarRow({Key? key, required this.userModel, required this.partnerLevel, required this.yourLevel, required this.showYourLevel, this.contSize}) : super(key: key);
  final UserModel userModel;
  final int partnerLevel;
  final int yourLevel;
  final bool showYourLevel;
  final double? contSize;

  @override
  Widget build(BuildContext context) {
    final userLevel = UtilsLocale.getLevelText(partnerLevel, context);
    return Row(
      children: [
        AppCircleAvatar(
          avatarUrl: userModel.avatarURL,
          contSize: contSize??40.sp, //83
          isAssetImage: false,
        ),
        SizedBox(width: Res.s20,),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameWithVerification(
                  userModel: userModel,
              ),
              const SizedBox(height: 10,),
              Text(userLevel),
              if(showYourLevel)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('(ваш уровень $yourLevel)'),
                ),
            ],
          ),
        )
      ],
    );
  }
}


// class ViewInviteContainerBottom extends StatelessWidget {
//   const ViewInviteContainerBottom({
//     Key? key,
//     required this.imageUrl, required this.meetingModel, required this.creatorModel,
//   }) : super(key: key);
//
//   final String imageUrl;
//   final MeetingModel meetingModel;
//   final UserModel creatorModel;
//
//   @override
//   Widget build(BuildContext context) {
//     final userData = Provider.of<UserNotifier>(context).userData;
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             AppCircleAvatar(
//               imageUrl: imageUrl,
//               contSize: 40.sp, //83
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: Res.s21),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppIconContainer(
//                     icon: Icons.call_made,
//                     contColor: AppColors.salad,
//                     iconColor: Colors.black,
//                     boxShape: BoxShape.circle,
//                     iconSize: 15.sp,
//                     contSize: Res.s18,
//                   ),
//                   SizedBox(
//                     height: Res.s10,
//                   ),
//                   Text('250 м',
//                       style: AppTextStyles.salad20
//                           .copyWith(fontWeight: FontWeight.w600),)
//                 ],
//               ),
//             )
//           ],
//         ),
//
//         MeetingGoIcon(creatorModel: creatorModel, partnerModel: userData,  meetingModel: meetingModel),
//
//
//       ],
//     );
//   }
// }

