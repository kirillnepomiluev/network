import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/service/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class InputOtpViewModel extends ViewModel {
  final BuildContext context;
  final String strPhone;
  InputOtpViewModel(this.context, this.strPhone);

  String? onValdation(String? value) {
    // final answer = value == '1234' ? null : 'Неправильный код';
    //
    // if (_enterButtonValid) {
    //   _enterButtonValid = false;
    //   notifyListeners();
    // } else {
    //   if (answer == null) {
    //     _enterButtonValid = true;
    //
    //     notifyListeners();
    //   }
    // }
    //
    // return answer;
  }

  String strOtp = '';

  void onCompletePassword(String value) {
    strOtp = value;
    print('onCompletePassword strOtp $strOtp');
  }

  bool _enterButtonValid = true;
  bool get enterButtonValid => _enterButtonValid;
  final _authentificationService = AuthService();

  Future<void> onOtpSent() async {
    print('otpSent');
    context.router.push(const RegSuccessViewRoute());

      // if(strOtp.length == 6){
      //   final isSucceful = await _authentificationService.sendOtp(phoneNumber: strPhone, otp: strOtp);
      //   print('onOtpSent - strOtp $strOtp - isSucceful - $isSucceful');
      //   if(isSucceful){
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Неверный пароль')));
      //     FocusManager.instance.primaryFocus?.unfocus();
      //     context.router.push(const RegSuccessViewRoute());
      //   }
      // }
      // else{
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Заполните поле')));
      // }
  }

  void onRetryTap() {
    context.router.pop();
  }
}