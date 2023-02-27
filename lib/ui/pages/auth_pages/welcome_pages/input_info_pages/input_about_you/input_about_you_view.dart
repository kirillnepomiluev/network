import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_about_you/input_about_you_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class InputAboutYouView extends StatelessWidget {
  const InputAboutYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<InputAboutYouViewModel>(
      createModelDataEx: () => InputAboutYouViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SingleChildScrollView(
                child:
                InputInfoColumn(
                  onNextPage: model.onNextPage,
                  controller: model.textController,
                  onContinue: model.onContinue,
                  text1: '${AppString.of(context).tell} ',
                  text2: AppString.of(context).aboutYou,
                  description: AppString.of(context).thisInfoWillBeShowedInProfile,
                ),
              ),
            ),
          ),
        );
      });
}

}
