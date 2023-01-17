import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';



class ChooseMeetingCategoriesView extends StatelessWidget {
  const ChooseMeetingCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
        child: AppButtonContinue(onPressed: () {
          context.router.push(const InputDescriptionMeetingViewRoute());
        }),
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),

                  EnterInfoContainer(
                    text1: '${AppString.of(context).choose} ',
                    text2: AppString.of(context).ofCategoryOfMeeting,
                    // padTop: 40,
                    showDescription: false,
                    fontSize: 24,
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
  }
}
