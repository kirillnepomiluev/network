import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/app_provider.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  static final router = AppRouter();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {

    UserNotifier userNotifier = UserNotifier();
    // SettingsNotifier settingsNotifier = SettingsNotifier();

    AppSupabase.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        print('app авторизован');
        userNotifier.setUserDataFunc();
        // settingsNotifier.setSettings();
      } else {
        print('app не авторизован');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: AppProviders.provider,
        child: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp.router(
              routerDelegate: App.router.delegate(),
              routeInformationParser: App.router.defaultRouteParser(),
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