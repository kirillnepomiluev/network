// import 'package:flutter/material.dart';
// import 'package:network_app/app/core/credentials/supabase_credentials.dart';
// import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
// import 'package:network_app/generated/assets.gen.dart';
// import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container.dart';
// import 'package:network_app/utils/main_pages/main_enums.dart';
// import 'package:network_app/utils/res.dart';
// import 'package:provider/provider.dart';
//
//
// class InviteContainersColumn extends StatelessWidget {
//   const InviteContainersColumn({
//     Key? key, required this.activeTab,
//   }) : super(key: key);
//   final ActiveInvitationTabs activeTab;
//
//   @override
//   Widget build(BuildContext context) {
//     final userData = Provider.of<UserNotifier>(context).userData;
//
//     return
//       StreamBuilder(
//         stream: AppSupabase.client
//             .from(AppSupabase.strMeetings)
//             .stream(primaryKey: ['id']).eq(
//             'partner_id', userData.userID),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final list = snapshot.data as List<Map<String, dynamic>>;
//             return ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: list.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final meetingMap = list[index] as Map<String, dynamic>;
//
//                 return Padding(
//                   padding: EdgeInsets.only(right: Res.s10),
//                   child:
//                       ViewInviteContainer(
//                         imageUrl: Assets.images.avatars.avatar0.keyName, //0
//                         activeTab: activeTab,
//                         showVerified: true,
//                         meetingMap: meetingMap,
//                       ),
//                   // MeetingRequestInfoContainer(
//                   //   currentNote: list[index],
//                   // ),
//                 );
//               },
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       );
//   }
// }
