import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_interests/choose_interests.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/geolocation/geolocation.dart';
import 'package:network_app/ui/theme/app_theme.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Network',
            theme:  AppTheme.mainTheme,
            localizationsDelegates: const [
              AppString.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppString.delegate.supportedLocales,
            home: const TurnOnLocationPage(),
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
// class TestViewModel extends ViewModel {
//   final BuildContext context;
//   TestViewModel(this.context);
//
//   void onTap() {
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (context) => const InputNamePage()));
//   }
//
// }