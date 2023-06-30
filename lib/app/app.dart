import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/app/core/providers/app_provider.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final router = AppRouter();

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

}

class _MyAppState extends State<MyApp> {

  Locale _locale = const Locale('en');
  void setLocale(String languageCode) {
    setState(() {
      _locale = Locale.fromSubtags(languageCode: languageCode);
    });

    // MyApp.of(context)!.setLocale('ru');
  }

  // @override
  // void initState() {
  //
  //   UserNotifier userNotifier = UserNotifier();
  //   // SettingsNotifier settingsNotifier = SettingsNotifier();
  //
  //   AppSupabase.client.auth.onAuthStateChange.listen((data) {
  //     final AuthChangeEvent event = data.event;
  //     if (event == AuthChangeEvent.signedIn) {
  //       print('app авторизован');
  //       userNotifier.setUserDataFunc();
  //       // settingsNotifier.setSettings();
  //     } else {
  //       print('app не авторизован');
  //     }
  //   });
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: AppProviders.provider,
        child: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp.router(
              routerDelegate: MyApp.router.delegate(),
              routeInformationParser: MyApp.router.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
              title: 'Network',
              theme: AppTheme.mainTheme,
              // locale: const Locale('ru', 'RU'),
              locale: _locale,
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
        ),
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