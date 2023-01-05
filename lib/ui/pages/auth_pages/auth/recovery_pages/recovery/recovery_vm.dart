import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class RecoveryViewModel extends ViewModel {
  final BuildContext context;
  RecoveryViewModel(this.context);

  void onLoginEmailTap() {
    context.router.push(const RecoveryEmailViewRoute());

  }
}
