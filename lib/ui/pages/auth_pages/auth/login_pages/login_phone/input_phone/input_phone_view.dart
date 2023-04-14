import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/widgets/input_phone_field.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';



class InputPhoneView extends StatelessWidget {
  const InputPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InputPhoneViewModel>(
        createModelDataEx: () => InputPhoneViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      AppBackButton(
                        func: model.goBack,
                      ),
                      SizedBox(
                        height: Res.s32,
                      ),
                      AppContainer(
                        padV: Res.s23,   //23
                        padH: Res.s18,   //18
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextTwo(
                                text1: '${AppString.of(context).input} ',
                                text2: AppString.of(context).yourPhoneNumber,
                                fontSize: Res.s21,), //24
                            SizedBox(
                              height: Res.s20,
                            ),
                            InputPhoneField(
                              // phoneContr: model.phoneContr,
                              showErrorText: model.showErrorText,
                              formstate: model.formstate,
                              onChange: model.onPhoneFieldChange,
                            ),
                            const Text(
                              Constants.strLoremIpsum,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 45,
                      ),

                      AppButton(onPressed: model.getOTP, text: AppString.of(context).sendCode)

                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}

