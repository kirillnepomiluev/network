import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingTimerPauseDialog extends StatelessWidget {
  const MeetingTimerPauseDialog({
    Key? key,
    required this.startTimer,
    required this.onInterrupt,
  }) : super(key: key);
  final VoidCallback startTimer;
  final VoidCallback onInterrupt;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final padMain = 0.0746 * mediaWidth; //28
    return BlurryContainer(
      blur: 20,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: 0.08 * mediaWidth, //30
        ),
        backgroundColor: Colors.transparent,
        // backgroundColor: ConstColor.white10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlurryContainer(
              blur: 20,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: padMain * 1.57, //44
                bottom: padMain,
              ),
              color: AppColors.white10,
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichTextTwo(
                    text1: 'Are you sure you want\nto end ',
                    text2: 'the meeting?',
                    fontSize: 17.5.sp,
                    fontWeight1: FontWeight.w500,
                    fontWeight2: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0.0986 * mediaWidth, //37
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.salad),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.router.pop();
                            startTimer();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.056 * mediaWidth * 0.428, //9
                              horizontal: 0.0266 * mediaWidth, //15
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: AppColors.textBlack,
                                fontSize: 16.5.sp, //14
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0.064 * mediaWidth, //24
                          ),
                          child: InkWell(
                            onTap: onInterrupt,
                            child: Text(
                              'Interrupt',
                              style: TextStyle(
                                fontSize: 16.5.sp, //14
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGray,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlurryContainer(
                blur: 40,
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 0.128 * mediaWidth * 0.916, //44
                  bottom: padMain, //28
                  // left: 40,     //48
                  // right:40
                ),
                color: AppColors.white10,
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 21),
                      child: Icon(
                        NetworkIcons.warning,
                        size: 21.sp, //23
                        color: AppColors.salad,
                      ),
                    ),
                    RichTextTwo(
                      text1: 'You may leave\na complaint ',
                      text2: 'anonymously',
                      fontSize: 17.5.sp,
                      fontWeight1: FontWeight.w500,
                      fontWeight2: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 37),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          // padding: MaterialStateProperty.all(
                          //     const EdgeInsets.symmetric(vertical: 9, horizontal: 21)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.router
                              .push(const MeetingComplaintViewRoute());
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.056 * mediaWidth * 0.428, //9
                            horizontal: 0.0266 * mediaWidth, //15
                          ),
                          child: Text(
                            // 'Создать чат',
                            'Complain',
                            style: TextStyle(
                              color: AppColors.textBlack,
                              fontSize: 16.5.sp, //14
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
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
