import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_view.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class RecoveryViewModel extends ViewModel {
  final BuildContext context;
  RecoveryViewModel(this.context);

  void onLoginEmailTap() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const RecoveryEmailView()));
  }
}
