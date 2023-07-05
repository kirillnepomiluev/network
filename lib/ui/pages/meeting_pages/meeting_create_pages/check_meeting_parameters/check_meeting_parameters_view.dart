import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart' as provider;
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckMeetingParametersView extends StatelessWidget {
  const CheckMeetingParametersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final userNotifier = provider.Provider.of<UserNotifier>(context);
    final meetingDraft = userNotifier.meetingDraft;
    final localizations = MaterialLocalizations.of(context);
    final strDate = localizations.formatFullDate(meetingDraft.scheduledDate);
    final strTime = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(meetingDraft.scheduledDate),
    );

    final height = Res.s18;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: Utils.unFocus,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Res.s16,
                vertical: Res.s10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),
                  EnterInfoContainer(
                    text1: '${AppString.of(context).check} ',
                    text2: AppString.of(context).allParametrsOfMeeting,
                    showDescription: false,
                    fontSize: Res.s24,
                  ),

                  // const CheckMeetingCategoryOfMeeting(),
                  TitleStatText(AppString.of(context).categoryOfMeeting),
                  SizedBox(
                    height: height,
                  ),
                  Text(meetingDraft.type, style: AppTextStyles.primary18,),
                  // AppContainer(
                  //   padH: Res.s15,
                  //   padV: Res.s10,
                  //   radius: AppBorderRadius.r10,
                  //   child: Text(
                  //       // AppString.of(context).businessMeeting,
                  //       meetingDraft.type),
                  // ),

                  // const CheckMeetingDescriptionOfMeeting(),
                  TitleStatText(AppString.of(context).descriptionOfMeeting),
                  SizedBox(
                    height: height,
                  ),
                  // Text('One two three four five six seven eight nine ten eleven twelve', style: AppTextStyles.primary18,),
                  Text(meetingDraft.description, style: AppTextStyles.primary18,),
                  // AppContainer.outlined(
                  //   width: double.infinity,
                  //   child: Text(meetingDraft.description),
                  // ),

                  // const CheckMeetingOccupation(),
                  TitleStatText(AppString.of(context).occupation),
                  SizedBox(
                    height: height,
                  ),
                  AppWrapContainersWithRemove(
                    listOptions: meetingDraft.occupation,
                  ),

                  // SizedBox(
                  //   height: Res.s15,
                  // ),

                  TitleStatText(AppString.of(context).interestsTitle),
                  SizedBox(
                    height: height,
                  ),

                  AppWrapContainersWithRemove(
                    listOptions: meetingDraft.interests,
                  ),

                  // const CheckMeetingInterests(),
                  // SizedBox(
                  //   height: Res.s15,
                  // ),
                  // const CheckMeetingDate(),
                  // const TitleStatText('Период для планирования встречи'),
                  TitleStatText(AppString.of(context).dateOfMeeting),
                  SizedBox(
                    height: height,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppContainer(
                          padV: Res.s15,
                          padH: Res.s15,
                          radius: AppBorderRadius.r10,
                          child: Text(
                            strDate,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Res.s15,
                      ),
                      AppContainer(
                        padV: Res.s15,
                        padH: Res.s20,
                        radius: AppBorderRadius.r10,
                        child: Text(
                          strTime,
                        ),
                      ),
                    ],
                  ),

                  TitleStatText(AppString.of(context).partner),
                  SizedBox(
                    height: height,
                  ),

                  // Text(
                  //   meetingDraft.partnerModel.name,
                  //   style: AppTextStyles.primary16,
                  // ),

                  PartnerAvatarRow(
                    userModel: meetingDraft.partnerModel,
                    partnerLevel: meetingDraft.partnerModel.level,
                    yourLevel: userNotifier.userData.level,
                    showYourLevel: false,
                  ),

                  // StreamBuilder(
                  //   stream: AppSupabase.client
                  //       .from(AppSupabase.strUsers)
                  //       .stream(primaryKey: ['id']).eq(
                  //           'id', meetingDraft.partnerID),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       final list =
                  //           snapshot.data as List<Map<String, dynamic>>;
                  //       final currentMap = list.first as Map<String, dynamic>;
                  //       final name = currentMap['name'];
                  //       return Text(
                  //         name,
                  //         style: AppTextStyles.primary16,
                  //       );
                  //     }
                  //     return const Center(child: CircularProgressIndicator());
                  //   },
                  // ),

                  SizedBox(
                    height: Res.s32,
                  ),
                  AppButton(
                    onPressed: () async {
                      final userID = userNotifier.userData.id;
                      print('userID $userID');

                      final partnerLevel = meetingDraft.partnerModel.level;
                      final tokens = partnerLevel*100;

                      await AppSupabase.client
                          .from(AppSupabase.strMeetings)
                          .insert({
                        'creator_level' : userNotifier.userData.level,
                        'partner_level' : partnerLevel,
                        'questions_list' : AppConstants.questionsList,
                        'tokens' : tokens>0? tokens : userNotifier.userData.level*100,
                        'creator_id': userNotifier.userData.id,
                        'partner_id': meetingDraft.partnerModel.id,
                        'type': meetingDraft.type,
                        'description': meetingDraft.description,
                        'occupation': meetingDraft.occupation,
                        'interests': meetingDraft.interests,
                        'scheduled_date': meetingDraft.scheduledDate.toIso8601String(),
                      }).then((value) {
                        // print('Then');
                        userNotifier.meetingDraft = MeetingModel.emptyModel();
                        context.router.pushAndPopUntil(
                          const MeetingRequestsListViewRoute(),
                          predicate: (route) => false,
                        );
                      }).onError(
                        (PostgrestException error, stackTrace) {
                          print('Ошибка в insert meetings: $error');
                          showSimpleDialog(
                              title: 'Ошибка',
                              text: error.message,
                              context: context);
                        },
                      );
                    },
                    text: AppString.of(context).createRequest,
                  ),
                  SizedBox(
                    height: Res.s20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
