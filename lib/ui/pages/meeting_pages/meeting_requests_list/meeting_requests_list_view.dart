import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/widgets/meeting_request_info_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';


class MeetingRequestsListView extends StatelessWidget {
  const MeetingRequestsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarRow(
                  onPressed: () {
                    context.router
                        .pushAndPopUntil(HomeViewRoute(), predicate: (route) => false,);
                  },
                  title: AppString.of(context).listOfPersonalRequests,
                ),
                SizedBox(
                  height: Res.s35,
                ),
                AppButton(
                  onPressed: () {
                    context.router.push(ChooseMeetingTypeViewRoute());
                  },
                  text: AppString.of(context).createNewRequest,
                ),
                SizedBox(
                  height: Res.s40,
                ),
                Text(
                  AppString.of(context).createdBefore,
                  style: AppTextStyles.salad20
                      .copyWith(fontWeight: FontWeight.w600),
                ),

                StreamBuilder(
                  stream: AppSupabase.client
                      .from(AppSupabase.strMeetings)
                      .stream(primaryKey: ['id']).eq(
                          'creator_id', userData.id).order('created_date'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data as List<Map<String, dynamic>>;
                      // var list = currentList
                      //     .where(
                      //       (x) => userData.clothesIdList.contains(x['id']) == isCupboard,)
                      //     .toList();
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {

                          MeetingModel meetingModel = MeetingModel.fromMap(list[index]);

                          return Padding(
                            padding: EdgeInsets.only(right: Res.s10),
                            child: MeetingRequestInfoContainer(
                              // currentNote: list[index],
                              meetingModel: meetingModel,
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: CircularProgressIndicator(),
                    ));
                  },
                ),

                const SizedBox(height: 30,)

                // const MeetingRequestInfoContainer(),
                // const MeetingRequestInfoContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
