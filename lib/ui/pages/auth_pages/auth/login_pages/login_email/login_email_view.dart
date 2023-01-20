import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_email/login_email_vm.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';


class LoginEmailView extends StatelessWidget {
  const LoginEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginEmailViewModel>(
        createModelDataEx: () => LoginEmailViewModel(context),
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
                        height: UtilsResponsive.getResSize(32),
                      ),
                      AppContainer(
                        padV: UtilsResponsive.getResSize(23),   //23
                        padH: UtilsResponsive.getResSize(18),   //18
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextTwo(
                                text1: '${AppString.of(context).input} ',
                                text2: AppString.of(context).yourPhoneNumber,
                                fontSize: UtilsResponsive.getResSize(21),), //24
                            SizedBox(
                              height: UtilsResponsive.getResSize(20),
                            ),
                            AppTextField(
                              controller: model.emailContr,
                              labelText: 'Email',
                            ),
                            AppTextField(
                              controller: model.passwordContr,
                              labelText: 'Пароль',
                              obscureText: true,
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
                      AppButton(onPressed: model.signInByEmail, text: 'Войти')
                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}

