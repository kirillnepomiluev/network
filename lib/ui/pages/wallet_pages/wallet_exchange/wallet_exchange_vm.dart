import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class WalletExchangeViewModel extends ViewModel {
  WalletExchangeViewModel(this.context);
  final BuildContext context;

  void onExchangeTap(){
    context.router.push(const WalletExchangeSuccessViewRoute());
  }

  void onCloseIconTap(){
    context.router.pop();
  }

}