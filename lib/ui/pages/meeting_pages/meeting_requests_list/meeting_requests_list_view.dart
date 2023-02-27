import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/widgets/meeting_request_info_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetingRequestsListView extends StatelessWidget {
  const MeetingRequestsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarRow(
                  title: AppString.of(context).listOfPersonalRequests,
                ),
                SizedBox(
                  height: Res.s35,
                ),
                AppButton(
                    onPressed: () {
                      context.router
                          .push(const ChooseMeetingCategoriesViewRoute());
                    },
                    text: AppString.of(context).createNewRequest,),
                SizedBox(
                  height: Res.s40,
                ),
                Text(
                  AppString.of(context).createdBefore,
                  style: AppTextStyles.salad20
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const MeetingRequestInfoContainer(),
                const MeetingRequestInfoContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}