import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class LoginMultipleViewModel extends ViewModel{
  LoginMultipleViewModel(this.context);
  final BuildContext context;

  void loginPhoneTap() {
    context.router.push(const InputPhoneViewRoute());
  }

  void loginEmailTap(){
    context.router.push(const LoginEmailViewRoute());
  }

  void onTroubleLoginTap(){
    context.router.push(const RecoveryViewRoute());
  }


  void loginGoogleTap(){}

  Future<void> loginFacebookTap() async {

    // bool isSuccess = await AuthService().signInByFacebook();
    //
    // print('isSuccess $isSuccess');
    // if(isSuccess){
    //   context.router.push(const RegSuccessViewRoute());
    // }
  }

}
