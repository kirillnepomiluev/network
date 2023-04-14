import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bar_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewInviteContainer extends StatefulWidget {
  const ViewInviteContainer({
    Key? key,
    required this.activeTab,
    required this.imageUrl,
    required this.showVerified,
    required this.meetingMap,
  }) : super(key: key);
  final ActiveInvitationTabs activeTab;
  final String imageUrl;
  final bool showVerified;
  final Map<String, dynamic> meetingMap;

  @override
  State<ViewInviteContainer> createState() => _ViewInviteContainerState();
}

class _ViewInviteContainerState extends State<ViewInviteContainer> {
  UserModel creatorModel = UserModel.emptyModel();
  bool show = false;

  Future<void> getInit() async {
    final creatorID = widget.meetingMap['creator_id'];

    final dataList = await AppSupabase.client
        .from(AppSupabase.strUsers)
        .select()
        .eq('id', creatorID);

    creatorModel = UserModel.fromJson(dataList[0]);

    setState(() {
      show = true;
    });
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final creatorName = '${creatorModel.name}, ${creatorModel.age}';
    final level = creatorModel.levelText;
    final meetingType = widget.meetingMap['type'];
    return !show
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: AppContainer(
              padH: Res.s21,
              padV: Res.s26,
              radius: AppBorderRadius.r30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ViewInviteContainerTop(
                    meetingType: meetingType,
                    activeTab: widget.activeTab,
                    showVerified: widget.showVerified,
                  ),

                  SizedBox(
                    height: Res.s15,
                  ),

                  NameWithVerification(
                      strName: creatorName, showVerified: widget.showVerified),

                  SizedBox(
                    height: Res.s15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // '${AppString.of(context).level} "${AppString.of(context).base}"',
                        '${AppString.of(context).level} "$level"',
                      ),
                      Text(
                        '+150 ${AppString.of(context).ofTokens}',
                        style: AppTextStyles.salad,
                      ),
                    ],
                  ),

                  SizedBox(height: 23.sp), //29

                  //Аватар и направление
                  ViewInviteContainerBottom(imageUrl: widget.imageUrl, meetingMap: widget.meetingMap, creatorModel: creatorModel,)
                ],
              ),
            ),
          );
  }
}
