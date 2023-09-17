import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppDialogWithButton extends StatelessWidget {
  const AppDialogWithButton({
    Key? key, required this.title, required this.subTitle, required this.buttonText, required this.buttonFunc,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback buttonFunc;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final padMain = 0.0746 * mediaWidth; //28
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0.08 * mediaWidth, //30
      ),
      backgroundColor: Colors.transparent,
      // backgroundColor: ConstColor.white10,
      child: BlurryContainer(
        height: 70.sp,
        blur: 50,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: padMain * 1.57, //44
          bottom: padMain,
        ),
        color: AppColors.black1A,
        // color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // RichTextTwo(
            //   // text1: 'Для встречи необходим костюм\n',
            //   text1: 'You need a matching suit\n\n',
            //   text2: 'Level $level',
            //   fontSize: 17.5.sp,
            //   fontWeight1: FontWeight.w500,
            //   fontWeight2: FontWeight.w500,
            //   textAlign: TextAlign.center,
            // ),

            Text(title, style: AppTextStyles.primary18,),

            if(subTitle.isNotEmpty)
              Text(subTitle, style: AppTextStyles.salad18),

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
              onPressed: buttonFunc,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.056 * mediaWidth * 0.428, //9
                  horizontal: 0.0266 * mediaWidth, //15
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 16.5.sp, //14
                    fontWeight: FontWeight.w400,),
                ),
              ),),
            InkWell(
              onTap: () {
                context.router.pop();
                // onInterrupt();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16.5.sp, //14
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGray,),
              ),
            )
            // Padding(
            //   padding: EdgeInsets.only(top: 0.0986 * mediaWidth, //37
            //   ),
            //   child: Column(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor:
            //           MaterialStateProperty.all(AppColors.salad),
            //           shape: MaterialStateProperty.all(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //         onPressed: () {
            //           context.router.pop();
            //           context.router.push(HomeStoreViewRoute());
            //
            //           // context.router.pop();
            //           // startTimer();
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(
            //             vertical: 0.056 * mediaWidth * 0.428, //9
            //             horizontal: 0.0266 * mediaWidth, //15
            //           ),
            //           child: Text(
            //             'Store',
            //             style: TextStyle(
            //               color: AppColors.textBlack,
            //               fontSize: 16.5.sp, //14
            //               fontWeight: FontWeight.w400,),
            //           ),
            //         ),),
            //       Padding(
            //         padding:
            //         EdgeInsets.only(top: 0.064 * mediaWidth, //24
            //         ),
            //         child: InkWell(
            //           onTap: () {
            //             context.router.pop();
            //             // onInterrupt();
            //           },
            //           child: Text(
            //             'Cancel',
            //             style: TextStyle(
            //               fontSize: 16.5.sp, //14
            //               fontWeight: FontWeight.w400,
            //               color: AppColors.textGray,),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}