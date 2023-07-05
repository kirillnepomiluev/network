import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invite_details/meeting_invite_details_view.dart';



class ViewInviteContainerNew extends StatefulWidget {
  const ViewInviteContainerNew({
    Key? key,
    required this.meetingMap, required this.isInvitation,
  }) : super(key: key);
  final Map<String, dynamic> meetingMap;
  final bool isInvitation;

  @override
  State<ViewInviteContainerNew> createState() => _ViewInviteContainerNewState();
}

class _ViewInviteContainerNewState extends State<ViewInviteContainerNew> {
  UserModel creatorModel = UserModel.emptyModel();

  MeetingModel meetingModel = MeetingModel.emptyModel();
  Future<void> getInit() async {
    meetingModel = await MeetingModel.create(widget.meetingMap, context);
    setState(() {});
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return meetingModel.isEmpty
        ? Container()
        : Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: (){
          context.router.push(MeetingInviteDetailsViewRoute(meetingModel: meetingModel, isInvitation: widget.isInvitation));
        },
        child: InviteContainerInfo(meetingModel: meetingModel, isInvitation: widget.isInvitation),
      ),
    );
  }
}




// class ViewInviteContainer extends StatefulWidget {
//   const ViewInviteContainer({
//     Key? key,
//     required this.activeTab,
//     required this.imageUrl,
//     required this.showVerified,
//     required this.meetingModel,
//   }) : super(key: key);
//   final ActiveInvitationTabs activeTab;
//   final String imageUrl;
//   final bool showVerified;
//   final MeetingModel meetingModel;
//
//   @override
//   State<ViewInviteContainer> createState() => _ViewInviteContainerState();
// }
//
// class _ViewInviteContainerState extends State<ViewInviteContainer> {
//   UserModel creatorModel = UserModel.emptyModel();
//   // MeetingModel meetingModel = MeetingModel.emptyModel();
//   bool show = false;
//
//   Future<void> getInit() async {
//     // meetingModel = MeetingModel.fromMap(widget.meetingModel);
//     final creatorID = widget.meetingModel.creatorID;
//
//     final dataList = await AppSupabase.client
//         .from(AppSupabase.strUsers)
//         .select()
//         .eq('id', creatorID);
//
//     creatorModel = UserModel.fromMap(dataList[0]);
//
//     setState(() {
//       show = true;
//     });
//   }
//
//   @override
//   void initState() {
//     getInit();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final creatorName = '${creatorModel.name}, ${creatorModel.age}';
//     final level = creatorModel.rankText;
//     final meetingType = widget.meetingModel.type;
//     return !show
//         ? Container()
//         : Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: AppContainer(
//               padH: Res.s21,
//               padV: Res.s26,
//               radius: AppBorderRadius.r30,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   ViewInviteContainerTop(
//                     meetingType: meetingType,
//                     activeTab: widget.activeTab,
//                     showVerified: widget.showVerified,
//                   ),
//
//                   SizedBox(
//                     height: Res.s15,
//                   ),
//
//                   NameWithVerification(
//                       strName: creatorName, showVerified: widget.showVerified),
//
//                   SizedBox(
//                     height: Res.s15,
//                   ),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         // '${AppString.of(context).level} "${AppString.of(context).base}"',
//                         '${AppString.of(context).level} "$level"',
//                       ),
//                       Text(
//                         '+150 ${AppString.of(context).ofTokens}',
//                         style: AppTextStyles.salad,
//                       ),
//                     ],
//                   ),
//
//                   SizedBox(height: Res.s20),
//
//                   ViewInviteContainerBottom(imageUrl: widget.imageUrl, meetingModel: widget.meetingModel, creatorModel: creatorModel,),
//
//                   SizedBox(height: Res.s20),
//
//                   Text('Встреча ${widget.meetingModel.statusText}'),
//
//                   if(widget.meetingModel.rateFromCreator != null)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 10,),
//                         const Divider(color: Colors.white,),
//                         const SizedBox(height: 5,),
//                         Row(
//                           children: [
//                             Text('${widget.meetingModel.rateFromCreator}'),
//                             const SizedBox(width: 5,),
//                             Icon(Icons.star, color: AppColors.salad, size: Res.s16,)
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         Text('${widget.meetingModel.fbFromCreator}'),
//                       ],
//                     ),
//
//                 ],
//               ),
//             ),
//           );
//   }
// }
