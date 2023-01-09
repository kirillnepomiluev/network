import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_headwear_container.dart';
import 'package:network_app/ui/pages/store_pages/store_category_avatars/store_category_avatars_vm.dart';
import 'package:network_app/ui/pages/store_pages/store_category_avatars/widgets/store_category_avatar_container.dart';
import 'package:network_app/ui/pages/store_pages/store_category/widgets/store_tab.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class StoreCategoryView extends StatelessWidget {
  final String title;
  final StoreCategoryScreens storeCategoryScreen;
  const StoreCategoryView({Key? key, required this.storeCategoryScreen, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreCategoryAvatarsViewModel>(
        createModelDataEx: () => StoreCategoryAvatarsViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarRow(
                        title: AppString.of(context).avatars,
                      ),

                      const SizedBox(
                        height: 21,
                      ),

                      AppContainer(
                        padV: 23,
                        padH: 18,
                        child: Text(Constants.strLoremIpsum,
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                            style: AppTextStyles.primary16),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      //Выбор интерфейса
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StoreFilterTab(
                                changeTab: model.changeTab,
                                activeTab: model.activeTab,
                                tabName: ActiveStoreFilerTabs.price,
                                text: 'Цена'),
                            StoreFilterTab(
                                changeTab: model.changeTab,
                                activeTab: model.activeTab,
                                tabName: ActiveStoreFilerTabs.category,
                                text: 'Категория'),
                            StoreFilterTab(
                                changeTab: model.changeTab,
                                activeTab: model.activeTab,
                                tabName: ActiveStoreFilerTabs.level,
                                text: 'Уровень'),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      storeCategoryScreen == StoreCategoryScreens.avatars?
                      Column(
                        children: const [
                          StoreCategoryAvatarContainer(
                            type: 'Редкий',
                          ),

                          StoreCategoryAvatarContainer(
                            type: 'Обычный',
                          ),
                        ],
                      )
                          :
                      Wrap(
                        spacing: 16.sp,
                        runSpacing: 16.sp,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          for (var i=0; i<6; i++)
                            StoreHeadwearContainer(
                              type: i==0 || i==3? 'Редкий' : 'Обычный',
                              isView: true,
                            ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}