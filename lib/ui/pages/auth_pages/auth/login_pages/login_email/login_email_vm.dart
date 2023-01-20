import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/app/core/services/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class LoginEmailViewModel extends ViewModel {
  LoginEmailViewModel(this.context);
  final BuildContext context;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final emailContr = TextEditingController(text: '');
  final passwordContr = TextEditingController(text: '');

  void goBack() {
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');

    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => context.router.pop());
  }


  final _authentificationService = AuthService();

  Future<void> signInByEmail() async {
    print('signInByEmail');
    // context.router.push(const RegSuccessViewRoute());

    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      bool isSuccess = await _authentificationService.signInService(
          email: emailContr.text,
          password: passwordContr.text,
      );

      print('isSuccess $isSuccess');
      if(isSuccess){
        context.router.push(const RegSuccessViewRoute());
      }

    }
  }
}
