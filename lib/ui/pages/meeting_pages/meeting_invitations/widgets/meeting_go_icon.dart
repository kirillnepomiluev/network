import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingGoIcon extends StatelessWidget {
  const MeetingGoIcon({
    super.key,
    required this.meetingModel,
  });

  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    // final width = 35.sp;
    final width = 32.sp;

    return
      meetingModel.status != 'created'? Container():
      InkWell(
        onTap: () {
          context.router.push(MeetingMatchingViewRoute(creatorModel: meetingModel.creatorModel, meetingModel: meetingModel, partnerModel: meetingModel.partnerModel));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: Colors.transparent,
            border: Border.all(color: AppColors.salad),),
          width: width, //66
          height: width * 1.394, //92
          child: Icon(
            NetworkIcons.arrow_long_right,
            color: AppColors.salad,
            size: 16.sp,
          ),
        ),
      );
  }
}

// class MeetingGoIcon extends StatelessWidget {
//   const MeetingGoIcon({
//     super.key,
//     required this.creatorModel,
//     required this.meetingModel,
//     required this.partnerModel,
//   });
//
//   final UserModel creatorModel;
//   final MeetingModel meetingModel;
//   final UserModel partnerModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       meetingModel.status != 'created'? Container():
//       InkWell(
//         onTap: () {
//           context.router.push(MeetingMatchingViewRoute(creatorModel: creatorModel, meetingModel: meetingModel, partnerModel: partnerModel));
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(37),
//             color: Colors.transparent,
//             border: Border.all(color: AppColors.salad),),
//           width: 35.sp, //66
//           height: 35.sp * 1.394, //92
//           child: Icon(
//             NetworkIcons.arrow_long_right,
//             color: AppColors.salad,
//             size: 16.sp,
//           ),
//         ),
//       );
//   }
// }