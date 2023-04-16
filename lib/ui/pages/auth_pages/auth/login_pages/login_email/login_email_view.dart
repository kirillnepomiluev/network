import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_email/login_email_vm.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';


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
                      height: Res.s32,
                    ),
                    AppContainer(
                      padV: Res.s23, //23
                      padH: Res.s18, //18
                      width: double.infinity,
                      child: Form(
                        key: model.formstate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextTwo(
                              text1: '${AppString.of(context).input} ',
                              text2: 'email и пароль',
                              fontSize: Res.s21,
                            ), //24
                            SizedBox(
                              height: Res.s20,
                            ),
                            AppTextField(
                              controller: model.emailContr,
                              labelText: 'Email',
                            ),
                            SizedBox(
                              height: Res.s20,
                            ),
                            AppTextField(
                              controller: model.passwordContr,
                              labelText: 'Пароль',
                              obscureText: true,
                            ),
                            SizedBox(
                              height: Res.s20,
                            ),
                            const Text(
                              Constants.strLoremIpsum,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    if (model.showLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      Column(
                        children: [
                          AppButton(
                            onPressed: model.signInByEmail,
                            text: 'Войти',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            onPressed: model.signUpByEmail,
                            text: 'Зарегаться',
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // AppButton(onPressed: model.signOut, text: 'Выйти'),
                        ],
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
