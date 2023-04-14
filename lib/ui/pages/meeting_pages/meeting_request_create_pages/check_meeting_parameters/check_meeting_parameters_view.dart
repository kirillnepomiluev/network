import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:provider/provider.dart';



class CheckMeetingParametersView extends StatelessWidget {
  const CheckMeetingParametersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final userNotifier = Provider.of<UserNotifier>(context);
    final meetingDraft = userNotifier.meetingDraft;
    final localizations = MaterialLocalizations.of(context);
    final strDate =
        localizations.formatFullDate(meetingDraft.meetingPlaningDate!);
    final strTime = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(meetingDraft.meetingPlaningDate!),
    );
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
                    height: Res.s20,
                  ),
                  AppContainer(
                    padH: Res.s15,
                    padV: Res.s10,
                    radius: AppBorderRadius.r10,
                    child: Text(
                      // AppString.of(context).businessMeeting,
                        meetingDraft.type
                    ),
                  ),

                  // const CheckMeetingDescriptionOfMeeting(),
                  TitleStatText(AppString.of(context).descriptionOfMeeting),
                  SizedBox(
                    height: Res.s10,
                  ),
                  AppContainer.outlined(
                    width: double.infinity,
                    child: Text(meetingDraft.description),
                  ),

                  // const CheckMeetingOccupation(),
                  TitleStatText(AppString.of(context).occupation),
                  SizedBox(
                    height: Res.s20,
                  ),
                  AppWrapContainersWithRemove(
                    listOptions: meetingDraft.occupation,
                  ),

                  SizedBox(
                    height: Res.s20,
                  ),

                  TitleStatText(AppString.of(context).interestsTitle),
                  SizedBox(
                    height: Res.s20,
                  ),

                  AppWrapContainersWithRemove(
                    listOptions: meetingDraft.interests,
                  ),

                  // const CheckMeetingInterests(),
                  SizedBox(
                    height: Res.s20,
                  ),
                  // const CheckMeetingDate(),
                  // const TitleStatText('Период для планирования встречи'),
                  const TitleStatText('Дата встречи'),
                  SizedBox(
                    height: Res.s20,
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
                        width: Res.s10,
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


                  const TitleStatText('Партнер'),
                  StreamBuilder(
                    stream: AppSupabase.client
                        .from(AppSupabase.strUsers)
                        .stream(primaryKey: ['id'])
                        .eq('id', meetingDraft.partnerID),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final list = snapshot.data as List<Map<String, dynamic>>;
                        final currentMap = list.first as Map<String, dynamic>;
                        final name = currentMap['name'];
                        return Text(name, style: AppTextStyles.primary,);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),

                  SizedBox(
                    height: Res.s40,
                  ),
                  AppButton(
                    onPressed: () {
                      final userID = userNotifier.userData.userID;
                      print('userID $userID');
                      AppSupabase.client.from(AppSupabase.strMeetings).insert({
                        'creator_id': userNotifier.userData.userID,
                        'partner_id': meetingDraft.partnerID,
                        'type': meetingDraft.type,
                        'description': meetingDraft.description,
                        'occupation': meetingDraft.occupation,
                        'interests': meetingDraft.interests,
                        'meeting_planing_date':
                            meetingDraft.meetingPlaningDate!.toIso8601String(),
                      }).onError(
                        (error, stackTrace) =>
                            print('Ошибка в insert meetings: $error'),
                      );

                      // context.router.pushAndPopUntil(HomeViewRoute(initIndex: 1), predicate: (route) => false,);
                      context.router.pushAndPopUntil(const MeetingRequestsListViewRoute(), predicate: (route) => false,);

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
