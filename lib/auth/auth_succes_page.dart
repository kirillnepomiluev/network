import 'package:flutter/material.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:network_app/constants.dart';


class AuthSuccesPage extends StatefulWidget {
  const AuthSuccesPage({Key? key}) : super(key: key);

  @override
  State<AuthSuccesPage> createState() => _AuthSuccesPageState();
}

class _AuthSuccesPageState extends State<AuthSuccesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      // appBar: AppBar(
      //   toolbarHeight: 65,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   // leading:
      //   title:
      //   Container(
      //     width: 55,
      //     height: 55,
      //     decoration: BoxDecoration(
      //       color: Colors.white70,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Center(child:
      //     IconButton(
      //         onPressed: (){
      //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RecoveryPage()));
      //         },
      //         icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
      //     ),
      //   ),
      // ),
      body:
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                    // padding: EdgeInsets.only(top: 20),
                    width: 140,
                height: 140,
                decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                )),
              ),


              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Поздравляем!', textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Вы успешно зарегистрировались\nв нашем приложении!!', textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
              ),

                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 50),
                        //   child: SizedBox(
                        //     width: MediaQuery.of(context).size.width*0.8,
                        //     child:
                        //     const Text('Восстановление\nаккаунта', textAlign: TextAlign.center, style: TextStyle(
                        //         color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                        //   ),
                        // ),


                      ],
                    ),
                  ),


                  ListView.builder(
                    padding: EdgeInsets.only(left: 5, top: 25),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          ListTile(
                            // leading: Icon(Icons.circle, size: 12,),
                            title: Row(
                              children: [
                                Icon(Icons.circle, size: 9,),
                                Text('  Правило 1', style: TextStyle(color: Colors.black),),
                              ],
                            ),
                            contentPadding: EdgeInsets.zero,
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(Constants.strLoremIpsum, maxLines: 2, style: TextStyle(fontSize: 12),),
                            ),

                          );
                      }),


                  // Center(
                  //   child:
                  //   // ElevatedButton(onPressed: showSendButton==false? null: (){}, child: Text('Войти'),)
                  //
                  //   InkWell(
                  //     onTap: ((){
                  //         // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AuthSuccesPage()));
                  //     }),
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width*0.8,
                  //       padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                  //       decoration: BoxDecoration(
                  //         color: Colors.grey.shade800,
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child:
                  //       const Text('Принять', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                  //
                  //     ),
                  //   ),
                  // ),

                ],
              ),
            ),
          ),
        ),
      // showPasswordInput
      //     ? inputPass()
      //     : inputPhone(),

        bottomNavigationBar:
        BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child:
        InkWell(
          onTap: ((){
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AuthSuccesPage()));
          }),
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
            // width: MediaQuery.of(context).size.width*0.8,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(15),
            ),
            child:
            const Text('Принять', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),

          ),
        ),

        )
    );
  }

}