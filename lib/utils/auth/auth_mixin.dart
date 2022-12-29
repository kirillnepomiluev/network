
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_view.dart';

mixin LoginMixin{

  void onTroubleLoginTap(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const RecoveryView()));
  }

  void loginGoogleTap(){}

  void loginFacebookTap() {}

  void loginEmailTap(){}

}