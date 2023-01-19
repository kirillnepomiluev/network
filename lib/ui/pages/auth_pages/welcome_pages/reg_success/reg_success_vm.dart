import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/service/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegSuccessViewModel extends ViewModel {
  final BuildContext context;
  RegSuccessViewModel(this.context);

  void onTap() {
    // print('currentUser - ${Supabase.instance.client.auth.currentUser!=null}');

    // print('isAuth - ${AuthService.isAuth}');

    context.router.push(const InputNameViewRoute());
  }

}
