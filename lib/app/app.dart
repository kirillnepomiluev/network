import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // static final router = AppRouter(authGuard: AuthGuard());
  static final router = AppRouter();

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

// import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';
// Widget build(BuildContext context) {
//   return ViewModelBuilder<LoginViewModel>(
//       createModelDataEx: () => LoginViewModel(context),
//       builder: (context, model) {
//         return Scaffold();
//       });
// }


// import 'package:flutter/material.dart';
// import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

// class ViewModel extends ViewModel {
//   final BuildContext context;
//   TestViewModel(this.context);
// }