import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CheckMeetingParametersView extends StatefulWidget {
  const CheckMeetingParametersView({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckMeetingParametersView> createState() => _CheckMeetingParametersViewState();
}

class _CheckMeetingParametersViewState extends State<CheckMeetingParametersView> {
  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const AppBackButton(),
                        Center(
                            child: Text(
                              'Создание личного запроса',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.5.sp, //18
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ],
                    ),
                  ),

                  const EnterInfoContainer(
                    text1: 'Проверьте ',
                    text2: 'все параметры встречи',
                    padTop: 40,
                    showDescription: false,
                    fontSize: 24,
                  ),



                  const TitleStatText('Категория встречи'),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            // color: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Деловая встреча',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.5.sp, //14
                                  fontWeight: FontWeight.w400),
                            ),

                            const Padding(
                                padding:  EdgeInsets.only(left: 8.0),
                                child:
                                Icon(
                                  NetworkIcons.edit,
                                  size: 15,
                                  color: AppColors.salad100,
                                )
                            )

                          ],
                        ),
                      ),
                    ),
                  ),

                  const TitleStatText('Описание встречи'),
                  textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),


                  const TitleStatText('Сфера деятельности'),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      direction: Axis.horizontal,
                      children: [
                        const HobbitsContainer('Маркетинг'),
                        const HobbitsContainer('IT-сфера'),
                        const HobbitsContainer('Финансы'),

                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: AppColors.salad100,
                                borderRadius: BorderRadius.circular(7)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: (){},
                              icon: const Icon(Icons.add),
                            )
                        ),

                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: RichTextTwo(
                      text1: 'Вы можете указать ',
                      text2: '3 сферы деятельности',
                      fontSize: 10,
                      fontWeight1: FontWeight.w400,
                      fontWeight2: FontWeight.w400,
                    ),
                  ),

                  const TitleStatText('Интересы'),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      direction: Axis.horizontal,
                      children: [
                        const HobbitsContainer('Большой теннис'),
                        const HobbitsContainer('Бассейн'),
                        const HobbitsContainer('Управление'),
                        const HobbitsContainer('Маркетинг'),

                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: AppColors.salad100,
                                borderRadius: BorderRadius.circular(7)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: (){
                              },
                              icon: const Icon(Icons.add),
                            )
                        ),

                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: RichTextTwo(
                      text1: 'Вы можете указать ',
                      text2: 'до 10 интересов',
                      fontSize: 10,
                      fontWeight1: FontWeight.w400,
                      fontWeight2: FontWeight.w400,
                    ),
                  ),

                  const TitleStatText('Период для планирования встречи'),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(children: [

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child:
                          Text(
                            'с  01.03.2021',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5.sp, //14
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10,),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child:
                          Text(
                            'по  01.03.2021',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.5.sp, //14
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),

                    ],),
                  ),


                  Padding(
                    padding:
                    const EdgeInsets.only(
                      top: 40,
                      bottom: 20,
                      left: 16,
                      right: 16,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: buttonStyleCustom(
                              color: Colors.white,
                              padH: 0,
                              padV: 22,
                              radius: 20),
                          onPressed: () {
                            context.router.push( HomeViewRoute(initIndex: 0));
                          },
                          child: Text(
                            'Создать запрос',
                            style: TextStyle(
                                fontSize: 18.5.sp, //18
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
