import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/utils/auth/auth_mixin.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class LoginMultipleViewModel extends ViewModel with LoginMixin{
  final BuildContext context;
  LoginMultipleViewModel(this.context);

  void loginPhoneTap() {
    context.router.push(const InputPhoneViewRoute());
  }

}
