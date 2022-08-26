import 'package:flutter/material.dart';
import 'package:network_app/auth/phone_auth_page.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/main.dart';

class LoginSecondPage extends StatefulWidget {
  const LoginSecondPage({Key? key}) : super(key: key);

  @override
  State<LoginSecondPage> createState() => _LoginSecondPageState();
}


class _LoginSecondPageState extends State<LoginSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      bottomNavigationBar:
      BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child:
        Padding(
          padding: EdgeInsets.only(bottom: 15, right: MediaQuery.of(context).size.width*0.1),
          child: InkWell(
            onTap:((){
              Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const RecoveryPage()));
            }),
            child: const Text('Проблемы со входом?', style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600
            ),
              textAlign: TextAlign.end,
            ),
          ),
        )),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: const Text(Constants.strLoremIpsum, textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
            ),

            //Войти по номеру телефона
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: ((){
                  Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const PhoneAuthPage()));
                }),
                child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: const EdgeInsets.all(15),
                    // width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                    // const Center(child: Text('F', style: TextStyle(color: Colors.blue, fontSize: 20),),),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 8),
                          child: Icon(Icons.phone_in_talk_sharp, color: Colors.white, size: 25),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text('Войти по номеру телефона', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),),
                        )
                      ],)
                ),
              ),
            ),

            //Google
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: ((){
                }),
                child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: const EdgeInsets.all(15),
                    // width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                    // const Center(child: Text('F', style: TextStyle(color: Colors.blue, fontSize: 20),),),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 8),
                          child:
                          // Icon(Icons.phone_in_talk_sharp, color: Colors.white, size: 25),
                          Text('G', style: TextStyle(color: Colors.red, fontSize: 25),)
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text('Войти через Google', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),),
                        )
                      ],)
                ),
              ),
            ),

            //Facebok
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: ((){
                }),
                child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: const EdgeInsets.all(15),
                    // width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                    // const Center(child: Text('F', style: TextStyle(color: Colors.blue, fontSize: 20),),),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(left: 15, right: 8),
                            child:
                            // Icon(Icons.phone_in_talk_sharp, color: Colors.white, size: 25),
                            Text('F', style: TextStyle(color: Colors.blue, fontSize: 25),)
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text('Войти через Facebook', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),),
                        )
                      ],)
                ),
              ),
            ),

            // Padding(
            //     padding: EdgeInsets.only(bottom: 20, right: MediaQuery.of(context).size.width*0.1),
            //   child: InkWell(onTap: ((){
            //   }),
            //     child: Container(
            //       // constraints: BoxConstraints(maxWidth: 100),
            //       // width: 100,
            //       decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
            //         padding: const EdgeInsets.only(bottom: 10,),
            //             child: const Text('Проблемы со входом?', style: TextStyle(
            //                 fontWeight: FontWeight.w500
            //             ), textAlign: TextAlign.end,)),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
