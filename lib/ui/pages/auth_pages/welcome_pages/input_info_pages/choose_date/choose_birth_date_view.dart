import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_birth_date_vm.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/widgets/choose_date_rich_text.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_check_list_tile.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';


class ChooseBirthDateView extends StatelessWidget {
  const ChooseBirthDateView({Key? key, required this.isAuth}) : super(key: key);
  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseBirthDateViewModel>(
      createModelDataEx: () => ChooseBirthDateViewModel(context, isAuth),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const AppBackButton(),
                    EnterInfoContainer(
                      text1: '${AppString.of(context).input} ',
                      text2: AppString.of(context).ofBirthDay,
                      description: AppString.of(context).youCanHideYourAge,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ChooseDateRichText(
                      onTap: model.onPickDate,
                      year: model.year,
                      month: model.month,
                      day: model.day,
                    ),
                    const SizedBox(
                      height: 45,
                    ),

                    AppButton(
                      text: isAuth? 'Продолжить' : 'Записать',
                        onPressed: model.dateChoosed ? model.onTap : null,
                    ),

                    // AppButtonContinue(
                    //   onPressed: model.dateChoosed ? model.onTap : null,
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    if(isAuth)
                    AppCheckListTile(
                      width: Res.s188,
                      onChanged: model.onHideAgeCheckBox,
                      value: model.hideAge,
                      title: AppString.of(context).hideAge,
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
