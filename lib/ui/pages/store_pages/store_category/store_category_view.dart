// ignore_for_file: cast_nullable_to_non_nullable
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/store_pages/store_category/store_category_vm.dart';
import 'package:network_app/ui/pages/store_pages/store_category/widgets/store_tab.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class StoreCategoryView extends StatelessWidget {
  const StoreCategoryView({
    Key? key,
    required this.productType,
    required this.isCupboard,
  }) : super(key: key);
  final StoreProductType productType;
  final bool isCupboard;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreCategoryViewModel>(
      createModelDataEx: () => StoreCategoryViewModel(context, productType),
      builder: (context, model) {
        final userData = Provider.of<UserNotifier>(context).userData;
        final strType = Utils.getProductType(productType);

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarRow(
                      title: productType == StoreProductType.head
                          ? AppString.of(context).headwears
                          : AppString.of(context).avatars,
                    ),

                    const SizedBox(
                      height: 21,
                    ),

                    AppContainer(
                      padV: 23,
                      padH: 18,
                      child: Text(
                        AppConstants.strLoremIpsum,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: AppTextStyles.primary16,
                      ),
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
                            text: 'Цена',
                          ),
                          StoreFilterTab(
                            changeTab: model.changeTab,
                            activeTab: model.activeTab,
                            tabName: ActiveStoreFilerTabs.category,
                            text: 'Категория',
                          ),
                          StoreFilterTab(
                            changeTab: model.changeTab,
                            activeTab: model.activeTab,
                            tabName: ActiveStoreFilerTabs.level,
                            text: 'Уровень',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    StreamBuilder(
                      stream: AppSupabase.client
                          .from(AppSupabase.strClothes)
                          .stream(primaryKey: ['id']).eq('type', strType),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final currentList =
                              snapshot.data as List<Map<String, dynamic>>;
                          var list = currentList
                              .where(
                                (x) =>
                                    userData.clothesIdList.contains(x['id']) ==
                                    isCupboard,
                              )
                              .toList();

                          if (snapshot.hasData) {
                            if (productType == StoreProductType.body) {
                              return SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: list.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: Res.s10),
                                      child: StoreAvatarContainer(
                                        currentNote: list[index],
                                        isViewCostume: true,
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return SizedBox(
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: Res.s12,
                                    mainAxisSpacing: Res.s12,
                                    mainAxisExtent: 82.sp, //300
                                  ),
                                  itemCount: list.length,
                                  itemBuilder: (_, index) {
                                    return StoreAvatarContainer(
                                      // width: 55.sp,
                                      currentNote: list[index],
                                    );
                                  },
                                ),
                              );
                            }
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
