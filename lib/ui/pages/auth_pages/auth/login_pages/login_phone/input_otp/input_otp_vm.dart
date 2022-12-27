import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/reg_success/reg_succes_view.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class InputOtpViewModel extends ViewModel {
  final BuildContext context;
  final String strPhone;
  InputOtpViewModel(this.context, this.strPhone);

  String? onValdation(String? value) {
    final answer = value == '1234' ? null : 'Неправильный код';

    if (_enterButtonValid) {
      _enterButtonValid = false;
      notifyListeners();
    } else {
      if (answer == null) {
        _enterButtonValid = true;

        notifyListeners();
      }
    }

    return answer;
  }

  void onComplete(String value) {}

  bool _enterButtonValid = false;
  bool get enterButtonValid => _enterButtonValid;

  void onLoginTap() {
    if (_enterButtonValid) {
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (context) => const RegSuccessView()));
    }
  }

  void onRetryTap() {
    Navigator.of(context).pop();
  }
}