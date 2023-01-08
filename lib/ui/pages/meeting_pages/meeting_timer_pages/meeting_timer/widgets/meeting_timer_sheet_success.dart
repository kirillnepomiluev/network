import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';


class MeetingTimerSheetSuccess extends StatelessWidget {
  const MeetingTimerSheetSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 30,
      color: Colors.transparent,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 63),
              child: RichTextTwo(
                text1: 'Вы получили\n',
                text2: 'токены за встречу',
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 101),
              child: RhombusText(
                  padLeft: 20,
                  fontSize: 60,
                  iconSize: 45,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 104),
              child:
              AppButton(
                height: 70,
                onPressed: () {
                  context.router.pop();
                  context.router.push(const MeetingRateFirstViewRoute());
                },
                text: 'Оценить встречу',
              ),

            ),

            Padding(
              padding: const EdgeInsets.only(top: 31, bottom: 20),
              child: AppButton(
                onPressed: () {
                  context.router.pop();
                  context.router.pop();
                },
                text: 'Оценить позже',
                height: 70,
                buttonColor: Colors.black,
                borderColor: Colors.white,
                textStyle: AppTextStyles.primary18,
                // width: 1,
              )
            ),
          ],
        ),
      ),
    );
  }
}
