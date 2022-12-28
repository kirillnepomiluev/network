import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_date.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class InputNameViewModel extends ViewModel {
  final BuildContext context;
  InputNameViewModel(this.context);

  void onTap() {
    FocusManager.instance.primaryFocus?.unfocus();

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const ChooseDatePage()));
  }

}