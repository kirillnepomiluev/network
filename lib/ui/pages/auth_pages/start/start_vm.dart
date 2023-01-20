import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';


class StartViewModel extends ViewModel {
  StartViewModel(this.context){
      // Future.delayed(const Duration(microseconds: 100)).then((value) {
      //   context.router.push(HomeViewRoute(initIndex: 0),);
      //   // context.router.pushAndPopUntil(HomeViewRoute(initIndex: 0), predicate: (route) => false);
      //   // context.router.push(MeetingSearchViewRoute());
      // });
  }
  final BuildContext context;

  void onTap() {
      // context.router.push(HomeViewRoute(initIndex: 0),);
      // context.router.push(ChatPersonalViewRoute());
      context.router.push(const LoginViewRoute());
  }

}