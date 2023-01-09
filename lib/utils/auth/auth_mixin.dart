import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';

mixin LoginMixin{

  void onTroubleLoginTap(BuildContext context){
    context.router.push(const RecoveryViewRoute());
  }

  void loginGoogleTap(){}

  void loginFacebookTap() {}

  void loginEmailTap(){}

}