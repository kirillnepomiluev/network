import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/widgets/meeting_matching_info_container.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/widgets/meeting_matching_profiles_row.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetingMatchingView extends StatelessWidget {
  const MeetingMatchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingMatchingViewModel>(
        createModelDataEx: () => MeetingMatchingViewModel(context),
        builder: (context, model) {
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UtilsResponsive.getResSize(16),),
                  child: Column(
                    children: [
                      const AppBarRow(),
                      SizedBox(
                        height: UtilsResponsive.getResSize(25),
                      ),
                      const MeetingMatchingProfilesRow(),
                      SizedBox(
                        height: UtilsResponsive.getResSize(40),
                      ),
                      const MeetingMatchingInfoContainer(),
                      SizedBox(
                        height: UtilsResponsive.getResSize(40),
                      ),
                      AppButton(
                          onPressed: model.onStartChat,
                          text: AppString.of(context).toStartChat,),
                      SizedBox(
                        height: UtilsResponsive.getResSize(23),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}
