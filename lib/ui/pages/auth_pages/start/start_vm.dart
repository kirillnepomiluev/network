import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class StartViewModel extends ViewModel {
  final BuildContext context;
  StartViewModel(this.context){
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  }


  void onTap() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const LoginView()));
  }

}