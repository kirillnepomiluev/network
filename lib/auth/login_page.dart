import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:network_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: InkWell(
            onTap: ((){
              Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const FirstPage()));

            }),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.circle, color: Colors.black, size: 56,),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text('network', style: TextStyle(fontSize: 30, color: Colors.black,),),
                )
              ],),
          ),
        ),

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // alignment: Alignment.centerRight,
                  width: 270,
                  height: 275,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: Text('Главное в связах\n - это связи', style: TextStyle(
                    fontSize: 34,
                    // letterSpacing: 1.5,
                    // wordSpacing: 0,
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Inter'
                  ),),
                ),

                Padding(
                  // padding: const EdgeInsets.only(left: 15, top: 45),
                  padding: const EdgeInsets.only(top: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const LoginSecondPage()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // side: BorderSide(color: Colors.red)
                                )
                            )
                          // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 45, right: 45, top: 19, bottom: 19),
                          child: Text('Войти', style: TextStyle(fontSize: 18, color: Colors.black),),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: ((){
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: Colors.black87,
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(child: Text('G', style: TextStyle(color: Colors.red, fontSize: 20),),),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            // color: Colors.black87,
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(child: Text('F', style: TextStyle(color: Colors.blue, fontSize: 20),),),
                        ),
                      ),
                    ],),
                ),

                Container(
                    padding: const EdgeInsets.only(top: 20, left: 170),
                    // alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: ((){
                          Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const RecoveryPage()));
                        }),
                        child: const Text('Проблемы со входом?', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w600),))
                ),

              ],
            ),
          )
        ],
      ),

    );
  }
}
