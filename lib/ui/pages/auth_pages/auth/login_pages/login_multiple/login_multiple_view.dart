import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/widgets/enter_row_container.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_trouble_enter.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginMultipleView extends StatelessWidget {
  const LoginMultipleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginMultipleViewModel>(
        createModelDataEx: () => LoginMultipleViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [

                  Positioned(
                      bottom: 17.sp, //5
                      right: 17.sp, //10
                      child: TroubleLoginTextLink(onTroubleEnterTap: model.onTroubleLoginTap,)
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(height: 30.sp,), //60
                          const NetworkRow(isRow: true,),

                          const EnterInfoContainer(
                            padTop: 42,
                            text1: 'Выполните ',
                            text2: 'вход',
                            maxLines: 3,
                          ),

                          SizedBox(height: 30.sp,), //57

                          EnterRowContainer(
                            onTap: model.loginPhoneTap,
                            icon: NetworkIcons.call,
                            title: 'Войти по номеру телефона',
                          ),

                          SizedBox(height: getResSize(21),), //21

                          EnterRowContainer(
                            onTap: model.loginEmailTap,
                            icon: Icons.email,
                            title: 'Войти с помошью почты',
                            // leftPad: 24.sp   //30
                          ),

                          SizedBox(height: getResSize(21),), //21

                          EnterRowContainer(
                            onTap: model.loginGoogleTap,
                            iconName: 'logo_google',
                            title: 'Войти через Google',
                            // leftPad: 23.sp   //28
                          ),

                          SizedBox(height: getResSize(21),), //21

                          EnterRowContainer(
                            onTap: model.loginFacebookTap,
                            iconName: 'logo_facebook',
                            title: 'Войти через Facebook',
                            // leftPad: 23.sp   //28
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
