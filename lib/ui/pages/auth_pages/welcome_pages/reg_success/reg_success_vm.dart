import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class RegSuccessViewModel extends ViewModel {
  RegSuccessViewModel(this.context){
    getInit();
  }
  final BuildContext context;

  void onBack(){
    AppSupabase.client.auth.signOut();
    context.router.push(const StartViewRoute());
  }

  void getInit(){
    if(AppSupabase.client.auth.currentUser!=null){
      UserNotifier().updateData(newData: {
        'email' : AppSupabase.client.auth.currentUser!.email??'',
        'phone' : AppSupabase.client.auth.currentUser!.phone??''
      },);
    }
  }

  void onTap() {
    // print('currentUser - ${Supabase.instance.client.auth.currentUser!=null}');
    // print('isAuth - ${AuthService.isAuth}');
    context.router.push(const InputNameViewRoute());
  }

}
