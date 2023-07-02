import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingRateInterruptDialog extends StatelessWidget {
  const MeetingRateInterruptDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final padMain = 0.0746 * mediaWidth; //28
    return BlurryContainer(
      blur: 15,
      child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 0.04 * mediaWidth, //30
              ),
          // insetPadding: EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: Colors.transparent,
          child: BlurryContainer(
            blur: 30,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 31,
              bottom: padMain,
            ),
            color: AppColors.white10,
            borderRadius: BorderRadius.circular(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RichTextTwo(
                  text1: 'Are you sure\n',
                  text2: 'you want to end the meeting?',
                  fontSize: 16,
                  fontWeight1: FontWeight.w500,
                  fontWeight2: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 37),
                  child: Text(
                    'You may rate the meeting later',
                    style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14, //16
                        fontWeight: FontWeight.w400,),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0986 * mediaWidth, //37
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
                                  fontWeight: FontWeight.w400,),
                            ),
                          ),),
                      Padding(
                        padding: EdgeInsets.only(left: 0.064 * mediaWidth, //24
                            ),
                        child: InkWell(
                          onTap: () {
                            context.router.pushAndPopUntil(
                                HomeViewRoute(),
                                predicate: (route) => false,);
                          },
                          child: Text(
                            'Interrupt',
                            style: TextStyle(
                                fontSize: 16.5.sp, //14
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGray,),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),),
    );
  }
}
