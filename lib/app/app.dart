import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_page.dart';
// ignore: unused_import
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
            theme:  _themeData,
            localizationsDelegates: const [
              AppString.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppString.delegate.supportedLocales,
            // supportedLocales: const [
            //   Locale('ru', 'RU'), // English, no country code
            //   Locale('en', 'EN'), // English, no country code
            // ],
            // home: const HomePage(initIndex: 1,),
            home: const StartPage(),
          );
        },
      );
  }
}


final _themeData = ThemeData(
    unselectedWidgetColor: ConstColor.salad100,
    fontFamily: 'Inter',
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.symmetric(
          //   vertical: 10,
          //   horizontal: 20
          // ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
            )
        )
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    textTheme: TextTheme(
      //          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300)),
        bodyText2: _defaultTextStyle
    ),
    scaffoldBackgroundColor: ConstColor.blackBack
);

final _defaultTextStyle =
GoogleFonts.inter(
      fontSize: getResSize(14),
    fontWeight: FontWeight.w400,
    color: ConstColor.textWhite
);
// TextStyle(
//   fontFamily: 'Inter',
//     fontSize: getResSize(14),
//     fontWeight: FontWeight.w400,
//     color: ConstColor.textWhite
// );

