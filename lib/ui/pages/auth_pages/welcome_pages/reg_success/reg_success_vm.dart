import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class RegSuccessViewModel extends ViewModel {
  final BuildContext context;
  RegSuccessViewModel(this.context);

  void onTap() {
    context.router.push(const InputNameViewRoute());
  }

}
