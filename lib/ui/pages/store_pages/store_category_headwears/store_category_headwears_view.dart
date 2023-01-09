import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_headwear_container.dart';
import 'package:network_app/ui/pages/store_pages/store_category_headwears/store_category_headwears_vm.dart';
import 'package:network_app/ui/pages/store_pages/store_category/widgets/store_tab.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreCategoryHeadwearsView extends StatefulWidget {
  const StoreCategoryHeadwearsView({Key? key}) : super(key: key);

  @override
  State<StoreCategoryHeadwearsView> createState() => _StoreCategoryHeadwearsViewState();
}

class _StoreCategoryHeadwearsViewState extends State<StoreCategoryHeadwearsView> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<StoreCategoryHeadwearsViewModel>(
      createModelDataEx: () => StoreCategoryHeadwearsViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const AppBackButton(),
                          Center(child: Text('Головные уборы',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.5.sp,   //18
                              fontWeight: FontWeight.w600,
                              // color: ConstColor.textWhite
                            ),
                          ))
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 23,
                            horizontal: 18
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white10,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Text(Constants.strLoremIpsum,
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              // color: ConstColor.textWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),

                    //Выбор интерфейса
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: SingleChildScrollView(
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
                    ),

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



