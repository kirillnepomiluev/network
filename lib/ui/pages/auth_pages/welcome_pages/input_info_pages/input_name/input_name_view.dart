import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_vm.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class InputNameView extends StatefulWidget {
  const InputNameView({Key? key}) : super(key: key);

  @override
  State<InputNameView> createState() => _InputNameViewState();
}

class _InputNameViewState extends State<InputNameView> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<InputNameViewModel>(
      createModelDataEx: () => InputNameViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const AppBackButton(),
                    EnterInfoContainer(
                      text1: '${AppString.of(context).input} ',
                      text2: AppString.of(context).yourName,
                      description: AppString.of(context).soWillDisplayInNetwork,
                    ),

                    const SizedBox(height: 36,),

                    const AppTextField(),

                    const SizedBox(height: 62,),

                    AppButtonContinue(onPressed: model.onTap),

                  ],
                ),
              ),
            ),
          ),
        );
      });
}
}
