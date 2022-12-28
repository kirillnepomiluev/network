import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_view.dart';
import 'package:network_app/utils/auth/auth_functions_mixin.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class LoginMultipleViewModel extends ViewModel with AuthFunctionsMixin{
  final BuildContext context;
  LoginMultipleViewModel(this.context);

  void loginPhoneTap() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const InputPhoneView()));
  }

}
