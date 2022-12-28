import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex.dart';
import 'package:network_app/ui/theme/app_theme.dart';
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
            home: const ChooseLevelPage(),
          );
        },
      );
  }
}