import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/widgets/meeting_request_info_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarRow(
                  title: AppString.of(context).listOfPersonalRequests,
                ),
                const SizedBox(
                  height: 35,
                ),
                AppButton(
                    onPressed: () {
                      context.router
                          .push(const ChooseMeetingCategoriesViewRoute());
                    },
                    text: AppString.of(context).createNewRequest),
                const SizedBox(
                  height: 40,
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
