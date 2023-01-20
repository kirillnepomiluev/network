import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class RecoveryEmailViewModel extends ViewModel {
  RecoveryEmailViewModel(this.context);
  final BuildContext context;

  void onSendTap() {
    context.router.pop();
    context.router.pop();
  }
}
