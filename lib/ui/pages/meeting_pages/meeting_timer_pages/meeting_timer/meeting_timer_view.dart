import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_bottom.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_circle.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingTimerView extends StatelessWidget {
  const MeetingTimerView({Key? key, this.isTimer = false, this.meetingID = 0})
      : super(key: key);
  final bool isTimer;
  final int meetingID;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingTimerViewModel>(
      createModelDataEx: () =>
          MeetingTimerViewModel(context, isTimer, meetingID),
      builder: (context, model) {
        final userData = Provider.of<UserNotifier>(context).userData;
        bool isCreator = model.meetingModel.creatorID == userData.id;

        bool entered = (isCreator && model.meetingModel.creatorEntered) ||
            (!isCreator && model.meetingModel.partnerEntered);

        bool bothEntered = model.meetingModel.creatorEntered &&
            model.meetingModel.partnerEntered;

        print('tokens ${model.meetingModel.tokens}');

        return WillPopScope(
          onWillPop: model.onWillPop,
          child: SafeArea(
            child: Scaffold(
              body: model.showLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Res.s16,
                          vertical: Res.s10,
                        ),
                        child: Column(
                          children: [
                            AppBarRow(onPressed: model.onBackTap),
                            SizedBox(
                              height: 23.sp, //30
                            ),
                            MeetingTimerCircle(
                                strMinutes: model.strMinutes,
                                strSeconds: model.strSeconds,
                                animationDuration: model.maxSeconds,
                                valueNotifier: model.valueNotifier),
                            SizedBox(
                              height: 29.sp, //50
                            ),

                            if(isTimer==false)
                            Padding(
                              padding: EdgeInsets.only(bottom: Res.s24),
                              child: Text(
                                'Start the meeting',
                                style: AppTextStyles.primary22,
                              ),
                            ),

                            SizedBox(
                              height: Res.s24, //50
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: Res.s20),
                              child: Text(
                                // 'Минимальное время встречи для начисления баллов 20 минут',
                                'The minimum meeting time for scoring is 20 minutes',
                                // 'To receive tokens, you need to spend 20 minutes together',
                                style: AppTextStyles.primary16,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 35.sp, //91
                            ),
                            if (entered == false)
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: AppButton(
                                    onPressed: model.onStartTap, text: 'Start'),
                              ))
                            else
                              bothEntered == false
                                  ? Center(
                                      child: Text('Waiting for the partner', style: AppTextStyles.salad16,),
                                    )
                                  : MeetingTimerBottom(
                                      isTimer: isTimer,
                                      isPaused: model.isPaused,
                                      onGoTap: model.onGoTap,
                                      meetingModel: model.meetingModel,
                                    ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
