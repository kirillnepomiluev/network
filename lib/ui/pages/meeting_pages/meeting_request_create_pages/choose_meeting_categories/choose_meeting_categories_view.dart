import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ChooseMeetingCategoriesView extends StatelessWidget {
  const ChooseMeetingCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(

      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: UtilsResponsive.getResSize(16), vertical: UtilsResponsive.getResSize(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),
                  EnterInfoContainer(
                    text1: '${AppString.of(context).choose} ',
                    text2: AppString.of(context).ofCategoryOfMeeting,
                    showDescription: false,
                    fontSize: UtilsResponsive.getResSize(24),
                  ),
                  SizedBox(
                    height: UtilsResponsive.getResSize(20),
                  ),
                  const SearchTextField(),
                  SizedBox(
                    height: UtilsResponsive.getResSize(18),
                  ),
                  const WrapSelectContainers(),
                  SizedBox(
                    height: 45.sp, //100
                  )
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: UtilsResponsive.getResSize(16),
            right: UtilsResponsive.getResSize(16),
            bottom: UtilsResponsive.getResSize(23),
        ),
        child: AppButtonContinue(onPressed: () {
          context.router.push(const InputDescriptionMeetingViewRoute());
        },),
      ),
    );
  }
}
