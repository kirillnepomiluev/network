import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_search/meeting_search_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_search/widgets/search_tab.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingSearchView extends StatelessWidget {
  const MeetingSearchView({Key? key, this.isAuth = false}) : super(key: key);
  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return ViewModelBuilder<MeetingSearchViewModel>(
        createModelDataEx: () => MeetingSearchViewModel(context),
        builder: (context, model) {
          return Scaffold(
            floatingActionButton: AppButton(
              borderRadius: AppBorderRadius.r15,
              onPressed: () {},
              text: AppString.of(context).toSearch,
              width: 54.sp, //177
              height: 30.sp, //55
            ),
            body: Padding(
              padding: EdgeInsets.only(top: mediaTop),
              child: GestureDetector(
                onTap: model.onScreenTap,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBarRow(
                          title: AppString.of(context).search,
                        ),

                        if (isAuth)
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: AppContainer(
                              width: double.infinity,
                              padV: 26,
                              padH: 18,
                              child: RichTextTwo(
                                text1: '${AppString.of(context).choose} ',
                                text2: AppString.of(context).interests,
                                fontSize: 20.sp,
                                fontWeight1: FontWeight.w500,
                                fontWeight2: FontWeight.w500,
                              ),
                            ),
                          ),

                        const SizedBox(
                          height: 18,
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              MeetingSearchTab(
                                  activeTab: model.activeTab,
                                  text: AppString.of(context).byInterests,
                                  tabName: ActiveSearchTabs.byInterests,
                                  changeTab: model.changeTab,),
                              SizedBox(width: Res.s10,),
                              MeetingSearchTab(
                                  activeTab: model.activeTab,
                                  text:
                                      AppString.of(context).byCategoriesOfMeeting,
                                  tabName: ActiveSearchTabs.byCategories,
                                  changeTab: model.changeTab,),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        //Поиск
                        const SearchTextField(),
                        const SizedBox(
                          height: 18,
                        ),

                        const WrapSelectContainers(),

                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },);
  }
}
