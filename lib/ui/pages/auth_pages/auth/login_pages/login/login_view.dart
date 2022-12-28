import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/widgets/login_logo_container.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_trouble_enter.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>(
        createModelDataEx: () => LoginViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      bottom: 17.sp,
                      right: 17.sp,
                      child: TroubleLoginTextLink(onTroubleEnterTap: model.onTroubleLoginTap)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 188,
                      ),
                      const Center(
                          child: NetworkRow(
                        isRow: false,
                      )),
                      const SizedBox(
                        height: 106,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 17.5.sp,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextTwo(
                              text1:
                                  '${AppString.of(context).mainThingInRelationsIs} ',
                              text2: AppString.of(context).relations,
                              fontSize: 26.sp, //36
                            ),
                            SizedBox(
                              height: 26.sp,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                AppButton(
                                  width: 56.sp, //168
                                  height: 35.sp, //62
                                  onPressed: model.onEnterTap,
                                  text: AppString.of(context).signIn,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 14.sp //10
                                      ), //10
                                  child: LoginLogoContainer(
                                    imageUrl:
                                        Assets.images.icons.logoGoogle.keyName,
                                    onTap: model.loginGoogleTap,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 14.sp), // 10
                                  child: LoginLogoContainer(
                                    imageUrl: Assets
                                        .images.icons.logoFacebook.keyName,
                                    onTap: model.loginFacebookTap,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
