import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_view.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class RegSuccessViewModel extends ViewModel {
  final BuildContext context;
  RegSuccessViewModel(this.context);

  void onTap() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const InputNamePage()));
  }

}
