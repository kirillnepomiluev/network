import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_interests/choose_interests.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomSheetMain extends StatelessWidget {
  const BottomSheetMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final height = mediaHeight * 0.95;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.transparent,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(
                        mediaWidth,
                        (mediaWidth * 0.07733333333333334)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: BottomSheetMinPaint(
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  BlurryContainer(
                    borderRadius: BorderRadius.zero,
                    blur: 50,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const StatColumn(
                          ifProfileSheet: true,
                        ),

                        titleStatText('Статус'),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) =>
                                      const ChooseStatusPage()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  // color: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Я люблю веселиться',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.5.sp, //14
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        NetworkIcons.edit,
                                        size: 22,
                                        color: AppColors.salad100,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),

                        titleStatText('Интересы'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            children: [
                              hobbitsContainer('Большой теннис'),
                              hobbitsContainer('Бассейн'),
                              hobbitsContainer('Управление'),
                              hobbitsContainer('Маркетинг'),
                              Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: AppColors.salad100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                              builder: (context) =>
                                              const ChooseInterestsPage()));
                                    },
                                    icon: const Icon(Icons.add),
                                  )),
                            ],
                          ),
                        ),
                        titleStatText('Обо мне'),
                        textField(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),

                        titleStatText('Сфера деятельности'),
                        // textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            children: [
                              hobbitsContainer('Маркетинг'),
                              hobbitsContainer('IT-сфера'),
                              hobbitsContainer('Финансы'),
                              Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: AppColors.salad100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                  )),
                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: RichTextTwo(
                            text1: 'Вы можете указать ',
                            text2: '3 сферы деятельности',
                            fontSize: 10,
                            fontWeight1: FontWeight.w400,
                            fontWeight2: FontWeight.w400,
                          ),
                        ),

                        titleStatText('Пол'),
                        const RadioList(
                          listOptions: ['Мужчина', 'Женщина'],
                        ),

                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomCheckListTile(
                              title: AppString.of(context).hideSex,
                            )),

                        titleStatText('Возраст'),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: AppColors.salad100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '37 лет',
                                  style: TextStyle(
                                      color: AppColors.textBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp), //14
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 17, right: 3),
                                  child: Icon(
                                    NetworkIcons.pencil,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CustomCheckListTile(
                              title: 'Скрыть возраст',
                            )),

                        titleStatText('Семейное положение'),
                        const RadioList(
                          listOptions: ['Женат', 'Свободен', 'В поиске'],
                        ),

                        const CustomCheckListTile(
                          title: 'Скрыть семейное положение',
                        ),

                        titleStatText('Цель встречи'),
                        const RadioList(
                          listOptions: ['Деловая', 'Общение', 'Свидание'],
                        ),

                        const CustomCheckListTile(
                          title: 'Скрыть цель встречи',
                        ),

                        titleStatText(
                            'Готов ли знакомиться с противоположным полом'),
                        const RadioList(
                          listOptions: [
                            'Да',
                            'Нет',
                          ],
                        ),

                        const CustomCheckListTile(
                          title: 'Скрыть',
                        ),

                        const SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomPaint(
            size: Size(
                mediaWidth,
                (mediaWidth * 0.07733333333333334)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: BottomSheetMinPaint(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
