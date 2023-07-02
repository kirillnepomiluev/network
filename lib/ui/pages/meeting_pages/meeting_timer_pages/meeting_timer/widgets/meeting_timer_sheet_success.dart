import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingTimerSheetSuccess extends StatelessWidget {
  const MeetingTimerSheetSuccess({
    Key? key, required this.meetingModel,
  }) : super(key: key);
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return BlurryContainer(
      height: mediaHeight*0.8,
      blur: 30,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 34.sp), //63
            child: const RichTextTwo(
              text1: 'You received tokens\n',
              text2: 'for the meeting',
              textAlign: TextAlign.center,
            ),
          ),

          RhombusText(
              fontSize: Res.s60, //60
              iconSize: Res.s40, //45
              fontWeight: FontWeight.w600,
          tokens: meetingModel.tokens,
          ),

          Padding(
              padding: EdgeInsets.only(bottom: Res.s20),
            child: Column(
              children: [
                AppButton(
                  height: 35.sp, //70
                  onPressed: () {
                    context.router.pop();
                    context.router.push(MeetingRateFirstViewRoute(meetingModel: meetingModel));
                  },
                  text: 'Rate the meeting',
                ),

                SizedBox(height: 23.sp), //30

                AppButton(
                  onPressed: () {
                    context.router.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false,);
                  },
                  text: 'Rate later',
                  height: 35.sp, //70
                  buttonColor: Colors.black,
                  textStyle: AppTextStyles.primary18,
                  // width: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
