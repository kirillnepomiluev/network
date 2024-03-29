import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:network_app/app/core/services/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';

class InputPhoneViewModel extends ViewModel {
  InputPhoneViewModel(this.context);
  final BuildContext context;

  String strPhone = '';
  bool showErrorText = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // final phoneContr = TextEditingController(text: '9603793580');

  void goBack() {
    Utils.unFocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');

    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => context.router.pop());
  }

  void onPhoneFieldChange(PhoneNumber phone) {
    if (showErrorText) {
      showErrorText = false;
      notifyListeners();
    }

    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      strPhone = phone.completeNumber;
      Utils.unFocus();
    }
  }

  final _authentificationService = AuthService();

  Future<void> getOTP() async {
    print('getOtp');
    showErrorText = true;
    notifyListeners();

    var formdata = formstate.currentState;

    if (formdata!.validate()) {
        _authentificationService.signInByPhoneGetOTP(phoneNumber: strPhone);
        // print('getOTP - strPhone $strPhone - isSuccess - $isSuccess');

      // strPhone ='${strPhone.substring(0, 1)} ${strPhone.substring(1, 2)} ${strPhone.substring(2, 5)} ${strPhone.substring(5, 8)} ${strPhone.substring(8, 10)} ${strPhone.substring(10)}'; //33
      context.router.push(InputOtpViewRoute(strPhone: strPhone));
    }else{
      print('not valid');
    }
  }
}
