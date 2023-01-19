import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:network_app/app/core/service/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class LoginEmailViewModel extends ViewModel {
  final BuildContext context;
  LoginEmailViewModel(this.context);

  var formstate = GlobalKey<FormState>();

  final emailContr = TextEditingController(text: '');
  final passwordContr = TextEditingController(text: '');

  goBack() {
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');

    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => context.router.pop());
  }


  final _authentificationService = AuthService();

  Future<void> signInByEmail() async {
    print('signInByEmail');
    // var formdata = formstate.currentState;
    context.router.push(const RegSuccessViewRoute());

    // if (formdata!.validate()) {
    //   bool isSuccess = await _authentificationService.signInService(
    //       email: emailContr.text,
    //       password: passwordContr.text
    //   );
    //
    //   print('isSuccess $isSuccess');
    //   if(isSuccess){
    //     context.router.push(RegSuccessViewRoute());
    //   }
    //
    // }
  }
}
