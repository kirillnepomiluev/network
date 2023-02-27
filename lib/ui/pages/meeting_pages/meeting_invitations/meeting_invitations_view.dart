import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meetring_invitations_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/choose_invitation_screen.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/invite_containers_column.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingInvitationsView extends StatelessWidget {
  const MeetingInvitationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return ViewModelBuilder<MeetingInvitationsViewModel>(
        createModelDataEx: () => MeetingInvitationsViewModel(context),
        builder: (context, model) {
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Padding(
              padding: EdgeInsets.only(top: mediaTop,
                  left: Res.s15,
                  right: Res.s15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarRow(),
                    SizedBox(height: Res.s20,),

                    ChooseInvitationScreen(
                      changeTab: model.changeTab,
                      activeTab: model.activeTab,
                    ),

                    const SizedBox(height: 13,),
                    InviteContainersColumn(
                      activeTab: model.activeTab,
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
        },);
  }
}
