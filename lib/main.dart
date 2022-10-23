import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/auth/login_page.dart';
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
            theme: ThemeData(fontFamily: 'Inter',),   //Inter Gilroy
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru', 'RU'), // English, no country code
            ],
            home: const HomePage(initIndex: 1,),
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
    // FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.blackBack,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const LoginPage()));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/circles/ellipse_1.png'),
              const NetworkRow(isRow: false, opacity: 0.3,),
            ],
          ),
        ),
      ),
    );
  }
}






