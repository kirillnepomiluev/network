import 'package:flutter/material.dart';
import 'package:network_app/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'Inter',
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              Icon(Icons.circle, color: Colors.black, size: 56,),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text('network', style: TextStyle(fontSize: 30, fontFamily: 'Inter', color: Colors.black, fontWeight: FontWeight.w500),),
              )
            ],),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
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
