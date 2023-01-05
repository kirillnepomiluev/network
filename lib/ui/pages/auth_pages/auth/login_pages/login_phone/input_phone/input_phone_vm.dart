import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class InputPhoneViewModel extends ViewModel {
  final BuildContext context;
  InputPhoneViewModel(this.context);

  String strPhone = '';
  var formstate = GlobalKey<FormState>();

  goBack() {
    FocusManager.instance.primaryFocus?.unfocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');

    Future.delayed(const Duration(milliseconds: 100)).then((value) => context.router.pop());
  }

  void func(PhoneNumber phone) {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      strPhone = phone.completeNumber;
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void getOTP() {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      strPhone = '${strPhone.substring(0, 1)} ${strPhone.substring(1, 2)} ${strPhone.substring(2, 5)} ${strPhone.substring(5, 8)} ${strPhone.substring(8, 10)} ${strPhone.substring(10)}'; //33
      context.router.push(InputOtpViewRoute(strPhone: strPhone));
    }
  }

}
