import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/profile/home_page.dart';


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

      home:
      // const FirstPage(),
      const HomePage(),


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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.circle, color: Colors.black, size: 56,),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text('network', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),),
                )
              ],),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute<void>(builder: (context) => const LoginPage()));
              }, child: const Text('Далее')),
            )
          ],
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
