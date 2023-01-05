import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/widgets/enter_row_container.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_trouble_enter.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
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

                          EnterInfoContainer(
                            padTop: 42,
                            // text1: 'Выполните ',
                            text1: AppString.of(context).execute,
                            text2: AppString.of(context).enter,
                            maxLines: 3,
                          ),

                          SizedBox(height: 30.sp,), //57
                          
                          EnterRowContainer(
                            onTap: model.loginPhoneTap,
                            icon: NetworkIcons.call,
                            title: AppString.of(context).signInByPhone,
                          ),

                          SizedBox(height: UtilsResponsive.getResSize(21),), //21

                          EnterRowContainer(
                            onTap: model.loginEmailTap,
                            icon: Icons.email,
                            title: AppString.of(context).signInByEmail,
                            // leftPad: 24.sp   //30
                          ),

                          SizedBox(height: UtilsResponsive.getResSize(21),), //21

                          EnterRowContainer(
                            onTap: model.loginGoogleTap,
                            iconName: 'logo_google',
                            title: AppString.of(context).signInByGoogle,
                            // leftPad: 23.sp   //28
                          ),

                          SizedBox(height: UtilsResponsive.getResSize(21),), //21

                          EnterRowContainer(
                            onTap: model.loginFacebookTap,
                            iconName: 'logo_facebook',
                            title: AppString.of(context).signInByFacebook,
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
