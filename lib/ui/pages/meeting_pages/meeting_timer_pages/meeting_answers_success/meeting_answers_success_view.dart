import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAnswersSuccessView extends StatefulWidget {
  const MeetingAnswersSuccessView({Key? key}) : super(key: key);

  @override
  State<MeetingAnswersSuccessView> createState() => _MeetingAnswersSuccessViewState();
}

class _MeetingAnswersSuccessViewState extends State<MeetingAnswersSuccessView> {

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: AppBackButton(),
              ),

           const SizedBox(
                height: 17,
              ),

              //Нижняя часть
       Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  // vertical: 27,
                    horizontal: 16),
                height: mediaHeight,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 49),
                        child: RichTextTwo(
                          text1: 'Поздравляем, ',
                          color1: AppColors.salad100,
                          // fontWeight1: FontWeight.w600,
                          text2: 'вы ответили\nна все вопросы',
                          color2: AppColors.textWhite,
                          // fontWeight2: FontWeight.w600,
                          // fontSize: 19.5.sp, //20
                          textAlign: TextAlign.center,
                        )),

                    const Padding(
                      padding: EdgeInsets.only(top: 115),
                      child: RhombusText(
                        fontSize: 60,
                        iconSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(
                        left: 38,
                        right: 38,
                        top: 125,
                      ),
                      child: Text(
                        'Здесь размещаем какую-то\nдополнительную информацию',
                        // 'Теперь вы можете открыть чат и договориться о встрече. Конечно же здесь можно разместить и другую ценную информацию.',
                        style: TextStyle(
                          height: 1.3,
                          // color: ConstColor.textWhite,
                          fontSize: 16, //16
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 63,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style:
                            buttonStyleCustom(
                                radius: 20,
                                padV: 26
                            ),
                            onPressed: () {
                              context.router.push(MeetingTimerViewRoute(isTimer: true));
                            },
                            child: Text(
                              'Начать чат',
                              style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontSize: 17.5.sp, //16
                                  fontWeight: FontWeight.w500
                              ),
                            )),
                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
