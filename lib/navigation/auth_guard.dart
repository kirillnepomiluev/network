import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();
  // AuthGuard(this.auth);
  // AuthService auth;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
      resolver.next();
    // if (auth.state == AuthState.auth) {
    //   resolver.next();
    // } else {
    //   if (resolver.route.name == 'welcome') return resolver.next();
    //   await router.push(const AuthRoute());
    //   // if (auth.state == AuthState.auth) {
    //   //   resolver.next();
    //   // } else {
    //   //   router.navigate(resolver.route.toPageRouteInfo());
    //   // }
    // }
  }
}
