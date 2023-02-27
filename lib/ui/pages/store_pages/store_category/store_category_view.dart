import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_headwear_container.dart';
import 'package:network_app/ui/pages/store_pages/store_category/store_category_vm.dart';
import 'package:network_app/ui/pages/store_pages/store_category/widgets/store_category_avatar_container.dart';
import 'package:network_app/ui/pages/store_pages/store_category/widgets/store_tab.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreCategoryView extends StatelessWidget {
  const StoreCategoryView({
    Key? key,
    required this.storeProductType,
  }) : super(key: key);
  final StoreProductType storeProductType;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreCategoryViewModel>(
        createModelDataEx: () =>
            StoreCategoryViewModel(context, storeProductType),
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
                            style: AppTextStyles.primary16,),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      //Выбор интерфейса
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StoreFilterTab(
                                changeTab: model.changeTab,
                                activeTab: model.activeTab,
                                tabName: ActiveStoreFilerTabs.price,
                                text: 'Цена',),
                            StoreFilterTab(
                                changeTab: model.changeTab,
                                activeTab: model.activeTab,
                                tabName: ActiveStoreFilerTabs.category,
                                text: 'Категория',),
                            StoreFilterTab(
                                changeTab: model.changeTab,
                                activeTab: model.activeTab,
                                tabName: ActiveStoreFilerTabs.level,
                                text: 'Уровень',),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      if (storeProductType == StoreProductType.avatars) Column(
                        children: const [
                          StoreCategoryAvatarContainer(
                            type: 'Редкий',
                          ),

                          StoreCategoryAvatarContainer(
                            type: 'Обычный',
                          ),
                        ],
                      ) else GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: Res.s12,
                                  mainAxisSpacing: Res.s12,
                                  mainAxisExtent: 74.sp,   //300
                              ),
                          itemCount: 6,
                          itemBuilder: (_, index) {
                            return StoreHeadwearContainer(
                              type: index == 0 || index == 3
                                  ? 'Редкий'
                                  : 'Обычный',
                              isView: true,
                            );
                          },)
                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}