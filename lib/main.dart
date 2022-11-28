import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/auth/first_page.dart';
import 'package:network_app/constants.dart';
// ignore: unused_import
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


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
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru', 'RU'), // English, no country code
            ],
            // home: const HomePage(initIndex: 1,),
            home: const FirstPage(),
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

final _defaultTextStyle = TextStyle(
    fontSize: getResSize(14),
    fontWeight: FontWeight.w400,
    color: ConstColor.textWhite
);

