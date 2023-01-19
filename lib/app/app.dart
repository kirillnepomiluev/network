import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/app/router/auth_guard.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Supabase.initialize(
//     url: SupabaseCredentials.apiUrl,
//     anonKey: SupabaseCredentials.apiKey,
//   );
//
//   runApp(const Core());
// }
//
// class Core extends StatelessWidget {
//   const Core({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(providers: AppProviders.provider, child: const Lava(),);
//   }
// }
//
// class Lava extends StatelessWidget {
//   const Lava({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       initialRoute: AppRoutes.loginRoute,
//       routes: AppRoutes.routes,
//     );
//   }
// }





class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  static final router = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            title: 'Network',
            theme: AppTheme.mainTheme,
            localizationsDelegates: const [
              AppString.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppString.delegate.supportedLocales,
            // home: const HomeView(initIndex: 4, isCupboard: false),
          );
        },
      );
  }
}

// Widget build(BuildContext context) {
//   return ViewModelBuilder<VM>(
//       createModelDataEx: () => VM(context),
//       builder: (context, model) {
//         return Scaffold();
//       });
// }


// import 'package:flutter/material.dart';
// import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

// class TViewModel extends ViewModel {
//   final BuildContext context;
//   TViewModel(this.context);
// }