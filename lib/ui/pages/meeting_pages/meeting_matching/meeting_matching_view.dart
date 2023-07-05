import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/widgets/meeting_matching_info_container.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/widgets/meeting_matching_profiles_row.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils_locale.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingMatchingView extends StatelessWidget {
  const MeetingMatchingView(
      {Key? key, required this.meetingModel, required this.creatorModel, required this.partnerModel})
      : super(key: key);

  final MeetingModel meetingModel;
  final UserModel creatorModel;
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingMatchingViewModel>(
      createModelDataEx: () => MeetingMatchingViewModel(context, meetingModel),
      builder: (context, model) {
        final mediaWidth = MediaQuery.of(context).size.width;
        return Scaffold(
          extendBody: true,
          body:
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Res.s16,
                ),
                child: Column(
                  children: [
                    const AppBarRow(),
                    SizedBox(
                      height: Res.s25,
                    ),
                    MeetingMatchingProfilesRow(
                      meetingModel: meetingModel,
                    ),
                    SizedBox(
                      height: Res.s40,
                    ),

                    MeetingMatchingInfoContainer(meetingModel: meetingModel),


                    if(model.status=='created' || model.status=='accepted')
                    Column(
                      children: [
                        SizedBox(
                          height: Res.s32,
                        ),

                        if(model.status=='accepted')
                          AppButton(
                            onPressed: model.onStartMeeting,
                            text: 'Start the meeting',
                          )
                        else
                        Column(
                          children: [
                            AppButton(
                              onPressed: model.onAcceptMeeting,
                              text: 'Accept',
                            ),

                            SizedBox(height: Res.s26),
                            InkWell(
                              onTap: model.onRejectMeeting,
                              child: AppContainer.outlined(
                                  width: mediaWidth,
                                  height: 35.sp,
                                  child: Text('Reject',
                                    style: AppTextStyles.primary18.copyWith(fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    )
                    else
                      Padding(
                        padding: EdgeInsets.only(top: Res.s20),
                        child: Text(UtilsLocale.getStatusText(model.status, context), style: AppTextStyles.primary20,),
                      ),

                    // AppButton(
                    //   onPressed: model.onDenyMeeting,
                    //   text: 'Reject',
                    // ),

                    SizedBox(
                      height: Res.s40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
