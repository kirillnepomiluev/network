import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:network_app/auth/login_page.dart';
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
            // WalletPage()
            FirstPage()
            // HomePage(initIndex: 0,),

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
              Image.asset('assets/images/circles/Ellipse 1.png'),
              const NetworkRow(isRow: false, opacity: 0.3,),
            ],
          ),
        ),
      ),
    );
  }
}


class NetworkRow extends StatelessWidget {
  final double opacity;
  final bool isRow;
  const NetworkRow({Key? key, required this.isRow, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRow==false?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        _circle(),
        _text(isColumn: true),
        _social(opacity: opacity),

      ],
    )
        :
    Row(
      mainAxisAlignment:
      isRow ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        _circle(),
        _text(),

      ],
    );
  }

  Widget _circle() =>   Container(
    width: 31.sp,    //57
    height: 31.sp,
    decoration:
    const BoxDecoration(color: ConstColor.salad100, shape: BoxShape.circle),
  );

  Widget _text({bool isColumn = false}) => Padding(
    padding: EdgeInsets.only(left: isColumn? 0 : 15.0, top: isColumn? 10 : 0),
    child: Text(
      'network',
      style: TextStyle(
          fontSize: 23.5.sp,  //34
          color: Colors.white,
          fontWeight: FontWeight.w500
      ),
    ),
  );

  Widget _social({double opacity = 0.05}) => Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      width: 105,
      height: 37,
      // blur: 10,
  decoration: BoxDecoration(
    // color: ConstColor.halfWhite,
    color: Colors.white.withOpacity(opacity),
    borderRadius: BorderRadius.circular(10),
  ),
      child: const Center(
        child: Text('social', style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),),
      ),
    ),
  );

}


class AuthBackScaffold extends StatelessWidget {
  bool hasTroubleEnter = false;
  final bool centerYellow;
  final Widget childColumn;
  AuthBackScaffold({Key? key, required this.childColumn, this.hasTroubleEnter=false, required this.centerYellow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    // top: mediaHeight*0.15,
    return Scaffold(
      backgroundColor: ConstColor.blackBack,
      body:
      SafeArea(
        child: Stack(
          children: [

            Positioned(
                right: 0,
                child: Image.asset('assets/images/circles/Ellipse 3.png')
            ),

            Positioned(
                top: centerYellow? mediaHeight*0.15 :  0,
                left: 0,
                child: Image.asset('assets/images/circles/Ellipse 2.png')
            ),

            hasTroubleEnter==false? Container():
            Positioned(
                bottom: 17.sp,  //5
                right: 17.sp,   //10
                child: troubleEnter(context)),

            childColumn

          ],
        ),
      ),
    );
  }
}



