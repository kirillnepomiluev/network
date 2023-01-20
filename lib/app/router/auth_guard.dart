import 'package:auto_route/auto_route.dart';
import 'package:network_app/app/core/services/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  // AuthGuard(this.auth);
  AuthService auth = AuthService();

  // void onNavigation(NavigationResolver resolver, StackRouter router) {
  //   // the navigation is paused until resolver.next() is called with either
  //   // true to resume/continue navigation or false to abort navigation
  //   if(authenitcated){
  //     // if user is authenticated we continue
  //     resolver.next(true);
  //   }else{
  //     // we redirect the user to our login page
  //     router.push(LoginRoute(onResult: (success){
  //       // if success == true the navigation will be resumed
  //       // else it will be aborted
  //       resolver.next(success);
  //     }));
  //   }
  // }

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
  print('onNavigation');

  bool isAuth = false;
  if(Supabase.instance.client.auth.currentUser==null){
    print('это нулл');
  }
  else{
    final id = Supabase.instance.client.auth.currentUser!.id;
    print('id $id');
    isAuth = true;
  }

    // if (auth.isAuth == true) {
    if (isAuth) {
      print('AuthGuard - авторизован');
      resolver.next();
    } else {
      print('AuthGuard - не авторизован');
      await router.push(const LoginViewRoute());
      resolver.next(false);
    }


  }
}
