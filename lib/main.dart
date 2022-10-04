import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/auth/login_page.dart';
// ignore: unused_import
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

// Map<int, Color> color = {
//   50: const Color.fromRGBO(255, 92, 87, .1),
//   100: const Color.fromRGBO(255, 92, 87, .2),
//   200: const Color.fromRGBO(255, 92, 87, .3),
//   300: const Color.fromRGBO(255, 92, 87, .4),
//   400: const Color.fromRGBO(255, 92, 87, .5),
//   500: const Color.fromRGBO(255, 92, 87, .6),
//   600: const Color.fromRGBO(255, 92, 87, .7),
//   700: const Color.fromRGBO(255, 92, 87, .8),
//   800: const Color.fromRGBO(255, 92, 87, .9),
//   900: const Color.fromRGBO(255, 92, 87, 1),
// };

// MaterialColor colorCustom = MaterialColor(4290624957, color);
// MaterialColor colorCustom = MaterialColor(4294967295, color);

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
              // primarySwatch: colorCustom,
            ),

            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru', 'RU'), // English, no country code
            ],
            home: const
            // FirstPage()
            HomePage(initIndex: 0,),

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
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const LoginPage()));
          },
          child: newtworkRow(),
        ),
      ),
    );
  }
}

// class CustomTextStyle {
//   static TextStyle display5(BuildContext context) {
//     return Theme.of(context).textTheme.display4.copyWith(fontSize: 192.0);
//   }
// }

Widget newtworkRow({bool isAppBar = false}) => Row(
      mainAxisAlignment:
          isAppBar ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon(
        //   Icons.circle,
        //   color: Colors.black,
        //   size: 53,
        // ),
        Container(
          width: 32.sp,    //53
          height: 32.sp,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'network',
            style: TextStyle(
                fontSize: 26.sp,  //34
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
