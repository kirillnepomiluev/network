import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/pages/profile_pages/choose_categories/choose_categories_vm.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseCategoriesView extends StatelessWidget {
  const ChooseCategoriesView({Key? key, required this.isAuth, required this.keyName}) : super(key: key);
  final bool isAuth;
  final String keyName;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseCategoriesViewModel>(
        createModelDataEx: () => ChooseCategoriesViewModel(context, isAuth, keyName),
        builder: (context, model) {
          final mediaTop = MediaQuery.of(context).viewPadding.top;
          return Scaffold(
            extendBody: true,
            body: Padding(
              padding: EdgeInsets.only(top: mediaTop),
              child: GestureDetector(
                onTap: model.unFocus,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthBarRow(
                          onSkip: model.onNextPage,
                          isAuth: isAuth,
                          title: AppString.of(context).chooseInterests,
                        ),

                        if (isAuth)
                          EnterInfoContainer(
                            text1: '${AppString.of(context).choose} ',
                            text2: keyName=='interests'? AppString.of(context).interests : AppString.of(context).ofOccupation,
                            showDescription: false,
                          ),
                        //Поиск
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 18),
                          child: SearchTextField(
                            controller: model.textController,
                            onChange: model.onSearchChanged,
                          ),
                        ),

                        WrapSelectContainersTest(
                          onTap: model.onSelectContainer,
                          list: model.displayedList,
                        ),

                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: isAuth
                ? null
                : AppButton(
              width: 58.sp,
              height: 32.5.sp,
              onPressed: model.onAddInterests,
              text: AppString.of(context).toAdd,
            ),
            bottomNavigationBar: isAuth == false
                ? null
                : Padding(
              padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 23),
              child: AppButtonContinue(
                onPressed: model.onContinue,
              ),
            ),
          );
        },);
  }
}
