import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingMatchingView extends StatefulWidget {
  const MeetingMatchingView({Key? key}) : super(key: key);

  @override
  State<MeetingMatchingView> createState() => _MeetingMatchingViewState();
}

class _MeetingMatchingViewState extends State<MeetingMatchingView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Padding(
                  padding:
                  EdgeInsets.only(
                      top: 10,
                  ),
                  child: AppBackButton(),
                ),

                //полупрозрачный слой
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      profileMini(strName: 'Джоли', ),

                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child:
                        AppIconContainer(
                          icon: NetworkIcons.electric,
                          contColor: AppColors.salad100,
                          iconSize: 18.sp,
                          contSize: 48,
                          iconColor: Colors.black,
                        )
                      ),

                      profileMini(strName: 'Тимофей', avatarNumb: 1),
                    ],
                  ),
                ),

                //Нижняя часть
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child:
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 23,
                        horizontal: 17
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          '92% совпадений',
                          style: TextStyle(
                            color: AppColors.salad100,
                            fontSize: 21.5.sp, //24
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 15),
                            decoration: BoxDecoration(
                              color: AppColors.salad100,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Деловая встреча',
                              style: TextStyle(
                                  fontSize: 15.5.sp, //12
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28),
                          child: Row(
                            children: [

                              Text(
                                'Токены за встречу',
                                style: TextStyle(
                                    fontSize: 15.5.sp, //12
                                    // color: ConstColor.textWhite,
                                    fontWeight: FontWeight.w400
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: RhombusText(fontSize: 18, fontWeight: FontWeight.w500, ),
                              )

                            ],
                          ),
                        ),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          direction: Axis.horizontal,
                          children: const [
                            HobbitsContainer('Большой теннис', hasEdit: false),
                            HobbitsContainer('Бассейн', hasEdit: false),
                            HobbitsContainer('Управление', hasEdit: false),
                            HobbitsContainer('Маркетинг', hasEdit: false),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                //Начать с 1-го вопроса
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 23),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: buttonStyleCustom(
                          radius: 20,
                          padV: 26
                        ),

                        onPressed: () {
                          context.router.push(const ChatPersonalViewRoute());
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
          ),
        ),
      ),
    );
  }

  List<String> questionsList = [
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'Какой-нибудь вопрос?',
  ];

  Widget questionContainer({required String text}) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = mediaWidth*0.42;

    return Container(
      padding: EdgeInsets.all(0.0266*mediaWidth),    //10
      width: contSize,
      height: contSize*0.74,      //112
      decoration: BoxDecoration(
          color: AppColors.salad100,
          borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15.5.sp, //12
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible

          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }



  // Widget questionContainer({required String text, required double align}) {
  //
  //   final mediaHeight = MediaQuery.of(context).size.height;
  //   final mediaWidth = MediaQuery.of(context).size.width;
  //   // final contSize = mediaWidth*0.4026;  //151
  //
  //   final aspectRatio = mediaWidth/mediaHeight>=0.6;
  //
  //   final contSize = aspectRatio? mediaWidth*0.35 : mediaWidth*0.4026;  //151
  //
  //   return Transform.rotate(
  //       angle: align,
  //       child: Container(
  //         padding: EdgeInsets.all(0.0266*mediaWidth),    //10
  //         width: contSize,
  //         height: contSize*0.74,      //112
  //         decoration: BoxDecoration(
  //             color: Colors.grey.shade300,
  //             borderRadius: BorderRadius.circular(22)),
  //         child: Center(
  //           child: Text(
  //             text,
  //             style: TextStyle(
  //                 fontSize:  aspectRatio? 14.5.sp : 15.5.sp, //12
  //                 fontWeight: FontWeight.w500,
  //               overflow: TextOverflow.visible
  //
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //       ),
  //     );
  // }




  Widget profileMini({required String strName, int avatarNumb = 0}) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          AppCircleAvatar(
            imageUrl: 'assets/images/avatars/avatar_$avatarNumb.png',
            contSize: 120,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$strName, 28',
                    style: TextStyle(
                        fontSize: 17.5.sp, //16
                        // color: ConstColor.textWhite,
                        fontWeight: FontWeight.w400
                    )),

                Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 2),
                  child: Icon(
                    Icons.verified,
                    color: AppColors.salad100,
                    size: 17.sp, //14
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Уровень "Базовый"',
              style: TextStyle(
                  fontSize: 15.5.sp,
                  // color: ConstColor.textWhite,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      );
  }
}
