import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/pages/profile_pages/profile_bottom_sheet/profile_bottom_sheet_vm.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/cards/bottom_sheet_min_patinr.dart';
import 'package:network_app/ui/widgets/common/app_check_list_tile.dart';
import 'package:network_app/ui/widgets/common/app_radio_list.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';

class ProfileBottomSheetView extends StatelessWidget {
  const ProfileBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileBottomSheetViewModel>(
      createModelDataEx: () => ProfileBottomSheetViewModel(context),
      builder: (context, model) {
        final mediaHeight = MediaQuery.of(context).size.height;
        final mediaWidth = MediaQuery.of(context).size.width;
        final height = mediaHeight * 0.95;
        final userData = Provider.of<UserNotifier>(context).userData;

        return GestureDetector(
          onTap: Utils.unFocus,
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
                          (mediaWidth * 0.07733333333333334).toDouble(), //29
                        ),
                        painter: BottomSheetMinPaint(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      BlurryContainer(
                        borderRadius: BorderRadius.zero,
                        blur: 50,
                        padding: EdgeInsets.all(Res.s15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StatColumn(
                              onBuyTokens: model.onBuyTokens,
                              ifProfileSheet: true,
                            ),

                            const TitleStatText('Статус'),
                            SizedBox(
                              height: Res.s20,
                            ),
                            InkWell(
                              onTap: model.onStatusTap,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Res.s15,
                                  vertical: Res.s10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      userData.status,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        NetworkIcons.edit,
                                        size: Res.s18,
                                        color: AppColors.salad,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Res.s10,
                            ),
                            const TitleStatText('Интересы'),
                            SizedBox(
                              height: Res.s20,
                            ),
                            AppWrapContainersWithRemove(
                              onTap: model.onAddInterest,
                              listOptions: userData.interests,
                              // [
                              //   'Большой теннис',
                              //   'Бассейн',
                              //   'Управление',
                              //   'Маркетинг'
                              // ],
                              showAdd: true,
                            ),
                            const TitleStatText('Обо мне'),
                            SizedBox(
                              height: Res.s10,
                            ),

                            InkWell(
                              onTap: model.onAboutTap,
                              child: AppContainer.outlined(
                                width: double.infinity,
                                child: Text(userData.about),
                              ),
                            ),

                            // InkWell(
                            //   onTap: model.onAboutTap,
                            //   child: AppTextField(
                            //     enabled: false,
                            //     // initialValue:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.',
                            //     initialValue: userData.about,
                            //   ),
                            // ),

                            const TitleStatText('Сфера деятельности'),
                            SizedBox(
                              height: Res.s20,
                            ),
                            AppWrapContainersWithRemove(
                              // listOptions: ['Маркетинг', 'IT-сфера', 'Финансы'],
                              listOptions: userData.occupation,
                              showAdd: true,
                              onTap: model.onAddOccupation,
                            ),
                            SizedBox(
                              height: Res.s20,
                            ),
                            RichTextTwo(
                              text1: 'Вы можете указать ',
                              text2: '3 сферы деятельности',
                              fontSize: Res.s10,
                              fontWeight1: FontWeight.w400,
                              fontWeight2: FontWeight.w400,
                            ),
                            const TitleStatText('Пол'),
                            SizedBox(
                              height: Res.s20,
                            ),
                            AppRadioList(
                              listOptions: model.sexListOptions,
                              groupValue: model.sexGroupValue,
                              onRadioChoose: model.onSexRadioChoose,
                            ),
                            SizedBox(
                              height: Res.s10,
                            ),
                            AppCheckListTile(
                              value: model.hideSex,
                              onChanged: model.onHideSexCheckBox,
                              title: AppString.of(context).hideSex,
                            ),

                            const TitleStatText('Возраст'),
                            SizedBox(
                              height: Res.s20,
                            ),
                            InkWell(
                              onTap: model.onAgeTap,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Res.s15,
                                  vertical: Res.s10,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.salad,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('${userData.age} лет',
                                        style: AppTextStyles.black,),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Res.s17,
                                        right: 3,
                                      ),
                                      child: Icon(
                                        NetworkIcons.pencil,
                                        size: Res.s16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Res.s10,
                            ),
                            AppCheckListTile(
                              value: model.hideAge,
                              onChanged: model.onHideAgeCheckBox,
                              title: AppString.of(context).hideAge,
                            ),
                            const TitleStatText('Семейное положение'),
                            SizedBox(
                              height: Res.s20,
                            ),

                            AppRadioList(
                              onRadioChoose: model.onFamilyStatusRadioChoose,
                              groupValue: model.familyStatusGroupValue,
                              listOptions: model.familyStatusListOptions,
                            ),

                            AppCheckListTile(
                              onChanged: model.onHideFamilyStatusCheckBox,
                              value: model.hideFamilyStatus,
                              title: 'Скрыть семейное положение',
                            ),
                            const TitleStatText('Цель встречи'),
                            SizedBox(
                              height: Res.s20,
                            ),
                            AppRadioList(
                              groupValue: model.goalsGroupValue,
                              onRadioChoose: model.onGoalsRadioChoose,
                              listOptions: model.goalsListOptions,
                            ),
                            AppCheckListTile(
                              value: model.hideMeetingsGoal,
                              onChanged: model.onHideMeetingsGoalCheckBox,
                              title: 'Скрыть цель встречи',
                            ),
                            // const TitleStatText(
                            //   'Готов ли знакомиться с противоположным полом',
                            // ),
                            // SizedBox(
                            //   height: Res.s20,
                            // ),
                            // const AppRadioList(
                            //   listOptions: [
                            //     'Да',
                            //     'Нет',
                            //   ],
                            // ),
                            // const AppCheckListTile(
                            //   title: 'Скрыть',
                            // ),
                            SizedBox(
                              height: Res.s60,
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
                  (mediaWidth * 0.07733333333333334).toDouble(),
                ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: BottomSheetMinPaint(color: Colors.transparent),
              ),
            ],
          ),
        );
      },
    );
  }
}
