import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingAnswersSuccessView extends StatelessWidget {
  const MeetingAnswersSuccessView({Key? key, required this.meetingModel}) : super(key: key);
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Res.s10,
                  top: Res.s10,
                  bottom: Res.s17,),
              child: const AppBackButton(),
            ),

            //Нижняя часть
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: Res.s16,),
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 30.sp, left: Res.s10, right: Res.s10), //49
                        child: const RichTextTwo(
                          text1: 'Congratulations, ',
                          color1: AppColors.salad,
                          text2: "you've answered all the questions.",
                          color2: AppColors.textWhite,
                          textAlign: TextAlign.center,
                        ),),
                    Padding(
                      padding: EdgeInsets.only(top: 48.sp), //118
                      child: RhombusText(
                        fontSize: Res.s60, //60
                        iconSize: Res.s40,
                        fontWeight: FontWeight.w600,
                        // tokens: 50,
                        tokens: meetingModel.tokens~/5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 48.sp, //118
                          // left: Res.s32, right: Res.s32
                      ),
                      child: Text(
                        'Now you may just discuss\nwhatever you want',
                        style: AppTextStyles.primary16.copyWith(
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: Res.s60, //60
                    ),
                    AppButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        // Navigator.of(context).pop();
                        // Navigator.of(context).pop();
                        context.router.push(MeetingTimerViewRoute(isTimer: true, meetingID: meetingModel.id));
                      },
                      text: 'Начать чат',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
