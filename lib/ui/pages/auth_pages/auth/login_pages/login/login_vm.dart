import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';


class LoginViewModel extends ViewModel{
  LoginViewModel(this.context);
  final BuildContext context;

  void onEnterTap() {
    context.router.push(const LoginMultipleViewRoute());
  }

  void loginGoogleTap(){}
  void loginFacebookTap(){}

  void onTroubleLoginTap(){
    context.router.push(const RecoveryViewRoute());
  }

}
