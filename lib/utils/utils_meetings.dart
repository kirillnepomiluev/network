import 'package:auto_route/auto_route.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:provider/provider.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class _NeedCostumeDialog extends StatelessWidget {
  const _NeedCostumeDialog({
    Key? key, required this.level,
  }) : super(key: key);
  final int level;


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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichTextTwo(
              text1: 'Для встречи необходим костюм\n',
              text2: 'уровня $level',
              fontSize: 17.5.sp,
              fontWeight1: FontWeight.w500,
              fontWeight2: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.0986 * mediaWidth, //37
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
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
                      context.router.push(HomeStoreViewRoute());

                      // context.router.pop();
                      // startTimer();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.056 * mediaWidth * 0.428, //9
                        horizontal: 0.0266 * mediaWidth, //15
                      ),
                      child: Text(
                        'В магазин',
                        style: TextStyle(
                          color: AppColors.textBlack,
                          fontSize: 16.5.sp, //14
                          fontWeight: FontWeight.w400,),
                      ),
                    ),),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 0.064 * mediaWidth, //24
                    ),
                    child: InkWell(
                      onTap: () {
                        context.router.pop();
                        // onInterrupt();
                      },
                      child: Text(
                        'Отмена',
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
      ),
        );
  }
}


class UtilsMeeting {

  static void onMeetingTap(BuildContext context, UserModel partnerModel) {
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    final myLevel = userData.level;
    final partnerLevel = partnerModel.level;

    print('myLevel $myLevel partnerLevel $partnerLevel');

    if (myLevel < partnerLevel) {
      // return showSimpleDialog(
      //     title: 'Недоступно', text: 'Купите костюм', context: context);

      showDialog<void>(
        context: context,
        builder: (BuildContext context) => _NeedCostumeDialog(
          level: partnerLevel,
        ),
      );
      return;
    }

    // context.router.push(MeetingTimerViewRoute());
    context.router.push(ChooseMeetingTypeViewRoute(partnerModel: partnerModel));
  }


  static void onChosePartner(BuildContext context, UserModel partnerModel){
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    userNotifier.meetingDraft.partnerID = partnerModel.id!;
    userNotifier.meetingDraft.partnerModel = partnerModel;
    print('onTap - ${userNotifier.meetingDraft.partnerID}');
    context.router.push(const InputDescriptionMeetingViewRoute());
  }

}