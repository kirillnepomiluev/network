import 'package:flutter/material.dart';
import 'package:network_app/auth/phone_auth_page.dart';
import 'package:network_app/auth/recovery_page.dart';

class RecoveryEmailPage extends StatefulWidget {
  const RecoveryEmailPage({Key? key}) : super(key: key);

  @override
  State<RecoveryEmailPage> createState() => _RecoveryEmailPageState();
}

class _RecoveryEmailPageState extends State<RecoveryEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading:
        title:
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child:
          IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RecoveryPage()));
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const Text('Введите адрес\nэлектронной почты', style: TextStyle(
                  color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),),

              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text('Чтобы восстановить доступ\nк своему аккаунту', style: TextStyle(
                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: ' Введите адрес электронной почты',
                  ),
                ),
              ),


              Center(
                child: InkWell(
                  onTap: ((){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const PhoneAuthPage()));
                  }),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                    const Text('Восстановить доступ', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
