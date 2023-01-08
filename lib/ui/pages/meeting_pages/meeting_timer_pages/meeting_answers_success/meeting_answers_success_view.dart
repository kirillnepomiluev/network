import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';

class MeetingAnswersSuccessView extends StatelessWidget {
  const MeetingAnswersSuccessView({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: mediaHeight,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 49),
                        child: RichTextTwo(
                          text1: 'Поздравляем, ',
                          color1: AppColors.salad,
                          text2: 'вы ответили\nна все вопросы',
                          color2: AppColors.textWhite,
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
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 16, //16
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 63,
                    ),
                    AppButton(
                      onPressed: () {
                        context.router
                            .push(MeetingTimerViewRoute(isTimer: true));
                      },
                      text: 'Начать чат',
                    )
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
