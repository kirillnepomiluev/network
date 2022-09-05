import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';

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
        body: SafeArea(
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
                          padding: const EdgeInsets.only(top: 42),
                          child: Container(
                              // padding: EdgeInsets.only(top: 20),
                              width: 150,
                              height: 150,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle)),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            'Поздравляем!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 26),
                          child: Text(
                            'Вы успешно зарегистрировались\nв нашем приложении!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
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
                    physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(left: 5, top: 41),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return

                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ListTile(
                            // leading: Icon(Icons.circle, size: 12,),
                            title: Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 9,
                                ),
                                Text(
                                  '  Правило 1',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            contentPadding: EdgeInsets.zero,
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                Constants.strLoremIpsum,
                                maxLines: 2,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                        ),
                          );

                      }),

                ],
              ),
            ),
          ),
        ),
        // showPasswordInput
        //     ? inputPass()
        //     : inputPhone(),

        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: InkWell(
            onTap: (() {
              Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const HomePage()));
            }),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              // width: MediaQuery.of(context).size.width*0.8,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Принять',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
