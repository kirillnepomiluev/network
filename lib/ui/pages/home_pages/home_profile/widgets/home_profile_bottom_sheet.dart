import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
import 'package:network_app/ui/widgets/cards/bottom_sheet_min_patinr.dart';
import 'package:network_app/ui/widgets/common/app_check_list_tile.dart';
import 'package:network_app/ui/widgets/common/app_radio_list.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/icons/app_add_rectangle_icon.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeProfileBottomSheet extends StatelessWidget {
  const HomeProfileBottomSheet({Key? key}) : super(key: key);

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
                    size: Size(mediaWidth,
                        (mediaWidth * 0.07733333333333334).toDouble() //29
                        ),
                    painter: BottomSheetMinPaint(
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  BlurryContainer(
                    borderRadius: BorderRadius.zero,
                    blur: 50,
                    color: Colors.transparent,
                    padding: EdgeInsets.all(UtilsResponsive.getResSize(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const StatColumn(
                          ifProfileSheet: true,
                        ),

                        const TitleStatText('Статус'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        InkWell(
                          onTap: () {
                            context.router.push(ChooseStatusViewRoute());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: UtilsResponsive.getResSize(15),
                                vertical: UtilsResponsive.getResSize(10)),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Я люблю веселиться',
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      NetworkIcons.edit,
                                      size: UtilsResponsive.getResSize(22),
                                      color: AppColors.salad,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: UtilsResponsive.getResSize(10),
                        ),
                        const TitleStatText('Интересы'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        AppWrapContainersWithRemove(
                          listOptions: [
                            'Большой теннис',
                            'Бассейн',
                            'Управление',
                            'Маркетинг'
                          ],
                          showAdd: true,
                        ),
                        const TitleStatText('Обо мне'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(10),
                        ),
                        const AppTextField(
                          hintText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.',
                        ),
                        const TitleStatText('Сфера деятельности'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        AppWrapContainersWithRemove(
                          listOptions: ['Маркетинг', 'IT-сфера', 'Финансы'],
                          showAdd: true,
                        ),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        RichTextTwo(
                          text1: 'Вы можете указать ',
                          text2: '3 сферы деятельности',
                          fontSize: UtilsResponsive.getResSize(10),
                          fontWeight1: FontWeight.w400,
                          fontWeight2: FontWeight.w400,
                        ),
                        const TitleStatText('Пол'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        const AppRadioList(
                          listOptions: ['Мужчина', 'Женщина'],
                        ),
                        SizedBox(
                          height: UtilsResponsive.getResSize(10),
                        ),
                        AppCheckListTile(
                          title: AppString.of(context).hideSex,
                        ),
                        const TitleStatText('Возраст'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: UtilsResponsive.getResSize(15),
                              vertical: UtilsResponsive.getResSize(10)),
                          decoration: BoxDecoration(
                              color: AppColors.salad,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('37 лет', style: AppTextStyles.black),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: UtilsResponsive.getResSize(17),
                                    right: 3),
                                child: Icon(
                                  NetworkIcons.pencil,
                                  size: UtilsResponsive.getResSize(16),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: UtilsResponsive.getResSize(10),
                        ),
                        AppCheckListTile(
                          title: 'Скрыть возраст',
                        ),
                        const TitleStatText('Семейное положение'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        const AppRadioList(
                          listOptions: ['Женат', 'Свободен', 'В поиске'],
                        ),
                        const AppCheckListTile(
                          title: 'Скрыть семейное положение',
                        ),
                        const TitleStatText('Цель встречи'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        const AppRadioList(
                          listOptions: ['Деловая', 'Общение', 'Свидание'],
                        ),
                        const AppCheckListTile(
                          title: 'Скрыть цель встречи',
                        ),
                        const TitleStatText(
                            'Готов ли знакомиться с противоположным полом'),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        const AppRadioList(
                          listOptions: [
                            'Да',
                            'Нет',
                          ],
                        ),
                        const AppCheckListTile(
                          title: 'Скрыть',
                        ),
                        SizedBox(
                          height: UtilsResponsive.getResSize(60),
                        ),
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
