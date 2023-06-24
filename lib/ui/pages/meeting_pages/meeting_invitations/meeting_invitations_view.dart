import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meetring_invitations_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/choose_invitation_screen.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingInvitationsView extends StatelessWidget {
  const MeetingInvitationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final userData = Provider.of<UserNotifier>(context).userData;
    return ViewModelBuilder<MeetingInvitationsViewModel>(
      createModelDataEx: () => MeetingInvitationsViewModel(context),
      builder: (context, model) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Padding(
            padding: EdgeInsets.only(
              top: mediaTop,
              left: Res.s15,
              right: Res.s15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarRow(),
                  SizedBox(
                    height: Res.s20,
                  ),
                  ChooseInvitationScreen(
                    changeTab: model.changeTab,
                    activeTab: model.activeTab,
                  ),
                  SizedBox(
                    height: Res.s20,
                  ),
                  StreamBuilder(
                    stream: AppSupabase.client
                        .from(AppSupabase.strMeetings)
                        .stream(primaryKey: ['id']).eq(
                            'partner_id', userData.id).order('created_date'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final list =
                            snapshot.data! as List<Map<String, dynamic>>;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            final meetingMap = list[index];
                            // MeetingModel meetingModel = MeetingModel.fromMap(meetingMap);
                            return Padding(
                              padding: EdgeInsets.only(right: Res.s10),
                              child: ViewInviteContainerNew(
                                meetingMap: meetingMap,
                                isInvitation: true,
                              ),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 20.sp), //25
            child: AppIconContainer(
              icon: NetworkIcons.tune,
              contSize: 35.sp,
              iconSize: 19.sp,
              boxShape: BoxShape.circle,
              contColor: Colors.white,
              iconColor: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
