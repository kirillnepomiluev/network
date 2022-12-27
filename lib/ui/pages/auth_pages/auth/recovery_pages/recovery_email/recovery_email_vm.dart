import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class RecoveryEmailViewModel extends ViewModel {
  final BuildContext context;
  RecoveryEmailViewModel(this.context);

  void onSendTap() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
