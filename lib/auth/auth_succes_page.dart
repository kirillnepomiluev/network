import 'package:flutter/material.dart';
import 'package:network_app/auth_profile_info/input_name.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthSuccesPage extends StatefulWidget {
  const AuthSuccesPage({Key? key}) : super(key: key);

  @override
  State<AuthSuccesPage> createState() => _AuthSuccesPageState();
}

class _AuthSuccesPageState extends State<AuthSuccesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: BackButtonCustom(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 31),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ConstColor.white05
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            'Поздравляем!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ConstColor.salad100,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 29),
                          child: Text(
                            'Вы успешно зарегистрировались\nв нашем приложении!!',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(left: 0, top: 35),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ListTile(
                                  // leading: Icon(Icons.circle, size: 12,),
                                  title: Text(
                                    'Правило ${index + 1}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),

                                  contentPadding: EdgeInsets.zero,
                                  subtitle: const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      Constants.strLoremIpsum,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: ConstColor.textWhite,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 42),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: buttonStyleCustom(
                            padH: 0, padV: 22, radius: 20),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(
                              builder: (context) =>
                                  const InputNamePage()
                              // const HomePage(
                              //   initIndex: 0,
                              // )
                          ));
                        },
                        child: Text(
                          'Принять',
                          style: TextStyle(
                              fontSize: 18.5.sp, //18
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
