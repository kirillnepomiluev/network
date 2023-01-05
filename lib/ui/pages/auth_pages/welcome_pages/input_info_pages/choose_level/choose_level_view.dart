import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_vm.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/widgets/level_checkbox.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/auth/auth_enums.dart';


class ChooseLevelView extends StatelessWidget {
  const ChooseLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<ChooseLevelViewModel>(
      createModelDataEx: () => ChooseLevelViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const AppBackButton(),

                      EnterInfoContainer(
                        padTop: 32,
                        text1: '${AppString.of(context).choose} ',
                        text2: AppString.of(context).level.toLowerCase(),
                        description: 'Здесь мы даем объяснение, что значит уровень',
                      ),

                      LevelContainer(
                          openBottomSheetProfile: model.openBottomSheetProfile,
                          title: AppString.of(context).base,
                          value: LevelOptions.base,
                          groupValue: model.groupValue,
                          onPressed: model.onPressed),
                      LevelContainer(
                          openBottomSheetProfile: model.openBottomSheetProfile,
                          title: AppString.of(context).standart,
                          value: LevelOptions.standart,
                          groupValue: model.groupValue,
                          onPressed: model.onPressed),
                      LevelContainer(
                          openBottomSheetProfile: model.openBottomSheetProfile,
                          title: AppString.of(context).premium,
                          value: LevelOptions.premium,
                          groupValue: model.groupValue,
                          onPressed: model.onPressed),
                    ],
                  ),
                  Column(
                    children: [
                      ButtonContinue(onPressed: model.onContinue),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
  }
}

