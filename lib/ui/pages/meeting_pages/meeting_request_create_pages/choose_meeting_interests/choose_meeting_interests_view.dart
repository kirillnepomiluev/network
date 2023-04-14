import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ChooseMeetingInterestsView extends StatelessWidget {
  const ChooseMeetingInterestsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: Res.s16,
              right: Res.s16,
              bottom: Res.s23,
          ),
          child: AppButtonContinue(
            onPressed: () {
              context.router.push(const ChooseMeetingDateViewRoute());
            },
          ),),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: Utils.unFocus,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Res.s16, vertical: Res.s10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),

                  EnterInfoContainer(
                    text1: '${AppString.of(context).choose} ',
                    text2: AppString.of(context).interests,
                    showDescription: false,
                    fontSize: Res.s24,
                  ),

                  //Поиск
                  Padding(
                    padding: EdgeInsets.only(bottom: Res.s20, top: Res.s18),
                    child: const SearchTextField(
                    ),
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
    );
  }
}
