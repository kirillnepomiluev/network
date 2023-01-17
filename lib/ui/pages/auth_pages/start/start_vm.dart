import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';


class StartViewModel extends ViewModel {
  final BuildContext context;
  StartViewModel(this.context){
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  }

  void onTap() {
    // context.router.push(const LoginViewRoute());
    context.router.push(HomeViewRoute(initIndex: 0),);
  }

}