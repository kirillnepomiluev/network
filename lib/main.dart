import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/auth/auth_succes_page.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/auth_profile_info/choose_sex.dart';
import 'package:network_app/auth_profile_info/input_name.dart';
import 'package:network_app/components/general_widgets.dart';
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
            theme: ThemeData(
              fontFamily: 'Inter',
              buttonTheme: ButtonThemeData(

              ),
              appBarTheme: AppBarTheme(
                // backgroundColor: ConstColor.blackBack
                backgroundColor: Colors.black
              ),
              textTheme: TextTheme(
                //          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black,
                //                                             fontSize: 12,fontWeight: FontWeight.w300)),

                bodyText2: TextStyle(
                  fontSize: getResSize(14),
                  fontWeight: FontWeight.w400,
                  color: ConstColor.textWhite
                ),

              ),
              scaffoldBackgroundColor: ConstColor.blackBack
            ),   //Inter Gilroy
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru', 'RU'), // English, no country code
            ],
            // home: const HomePage(initIndex: 1,),
            home: const ChooseSexPage(),
          );
        },
      );
  }
}


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ConstColor.blackBack,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const LoginPage()));
          },
          child: const NetworkRow(isRow: false, opacity: 0.3,),
        ),
      ),
    );
  }
}






