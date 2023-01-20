import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class RecoveryViewModel extends ViewModel {
  RecoveryViewModel(this.context);
  final BuildContext context;

  void onLoginEmailTap() {
    context.router.push(const RecoveryEmailViewRoute());

  }
}
