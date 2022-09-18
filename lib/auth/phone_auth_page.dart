import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/auth/auth_succes_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  List listCheck = <bool>[false, false, false, false];

  final node1 = FocusNode();
  final node2 = FocusNode();
  final node3 = FocusNode();
  final node4 = FocusNode();

  bool showPasswordInput = false;

  String strPhone = '';
  // var _phoneController = TextEditingController();

  var formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if (showPasswordInput) {
          setState(() {
            showPasswordInput = false;
          });
        } else {
          Navigator.of(context).pop();
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading:
          title:
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: backButton(context, func: (){
                  if (showPasswordInput) {
                    setState(() {
                      showPasswordInput = false;
                    });
                  } else {
                    Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const LoginSecondPage()));
                  }
              }),
            ),

        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 31),
          child: showPasswordInput ? inputPass() : inputPhone(),
        ),
      ),
    );
  }

  Widget inputPhone() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(bottom: 27),
                child: Text(
                  'Введите ваш номер',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 23.sp, //28
                      fontWeight: FontWeight.w400),
                ),
              ),

              // Form(
              //   key: formstate,
              //   child: IntlPhoneField(
              //     autofocus: true,
              //     style: const TextStyle(fontSize: 14),
              //     keyboardType: TextInputType.number,
              //     inputFormatters: <TextInputFormatter>[
              //       FilteringTextInputFormatter.digitsOnly
              //     ],
              //     initialCountryCode: 'RU',
              //     decoration: InputDecoration(
              //       // isDense: false,
              //       contentPadding: const EdgeInsets.only(top: 22, bottom: 23, left: 20),
              //       focusedBorder: OutlineInputBorder(
              //           borderSide:
              //               const BorderSide(width: 1, color: Colors.white),
              //           borderRadius: BorderRadius.circular(20)),
              //       enabledBorder: OutlineInputBorder(
              //           borderSide:
              //               const BorderSide(width: 1, color: Colors.white),
              //           borderRadius: BorderRadius.circular(20)),
              //
              //       filled: true,
              //       fillColor: Colors.white,
              //     ),
              //     onChanged: (phone) {
              //       strPhone = phone.completeNumber;
              //
              //       strPhone = '${strPhone.substring(0, 1)} ${strPhone.substring(1, 2)} ${strPhone.substring(2, 5)} ${strPhone.substring(5, 8)} ${strPhone.substring(8, 10)} ${strPhone.substring(10)}'; //33
              //
              //       var formdata = formstate.currentState;
              //
              //       if (formdata!.validate()) {
              //         // print('valid');
              //         setState(() {
              //           showSendButton = true;
              //         });
              //       } else {
              //         if (showSendButton) {
              //           setState(() {
              //             showSendButton = false;
              //           });
              //         }
              //       }
              //
              //       // print('strPhone $strPhone');
              //     },
              //     onCountryChanged: (country) {
              //       // print('Country changed to: ' + country.name);
              //     },
              //   ),
              // ),
              //


              Form(
                key: formstate,
                child: SizedBox(
                  height: 80,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: SizedBox(
                          child: IntlPhoneField(
                            // textInputAction: TextInputAction.done,
                            // disableLengthCheck: true,
                            autofocus: true,
                            style: const TextStyle(fontSize: 14),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            initialCountryCode: 'RU',

                            decoration: InputDecoration(
                              // isDense: false,
                              contentPadding: const EdgeInsets.only(top: 25, bottom: 24),
                              // errorText:'Неправильный номер',

                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 3, color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)),

                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (phone) {
                              strPhone = phone.completeNumber;

                              strPhone = '${strPhone.substring(0, 1)} ${strPhone.substring(1, 2)} ${strPhone.substring(2, 5)} ${strPhone.substring(5, 8)} ${strPhone.substring(8, 10)} ${strPhone.substring(10)}'; //33

                              var formdata = formstate.currentState;

                              if (formdata!.validate()) {
                                // print('valid');
                                // setState(() {
                                //   showSendButton = true;
                                // });

                                FocusManager.instance.primaryFocus?.unfocus();

                              }
                              // else {
                              //   if (showSendButton) {
                              //     setState(() {
                              //       showSendButton = false;
                              //     });
                              //   }
                              // }
                              // print('strPhone $strPhone');
                            },
                            // onCountryChanged: (country) {
                            //   // print('Country changed to: ' + country.name);
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(top: 38, bottom: 52),
                child: Center(
                  child: Text(Constants.strLoremIpsum,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.5.sp,   //16
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),



              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: buttonStyleCustom(padH: 0, padV: 28, radius: 20),
                    onPressed: () {

                      var formdata = formstate.currentState;

                      if (formdata!.validate()) {
                        // print('valid');
                        setState(() {
                          showPasswordInput = true;
                        });
                      }

                      // FocusManager.instance.primaryFocus?.unfocus();

                    },
                    child: Text(
                      'Отправить код',
                      style:
                      TextStyle(
                          fontSize: 18.5.sp,     //18
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )),
              ),

              // Center(
              //   child: InkWell(
              //     onTap: (() {
              //       var formdata = formstate.currentState;
              //
              //       if (formdata!.validate()) {
              //         // print('valid');
              //         setState(() {
              //           showPasswordInput = true;
              //         });
              //       }
              //       // else{
              //       //   showSimpleDialog(title: 'Недоступно', text: 'Некорректный номер', context: context);
              //       //   // print('not valid');
              //       // }
              //     }),
              //     child: Container(
              //       width: MediaQuery.of(context).size.width * 0.8,
              //       padding: const EdgeInsets.only(
              //           left: 15, right: 15, top: 20, bottom: 20),
              //       decoration: BoxDecoration(
              //         // color: Colors.grey.shade800,
              //         color: showSendButton
              //             ? Colors.black87
              //             : Colors.grey.shade600,
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: const Text(
              //         'Отправить код',
              //         style: TextStyle(
              //             fontSize: 18,
              //             color: Colors.white,
              //             fontWeight: FontWeight.w500),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // ),
              //
            ],
          ),
        ),
      );

  Widget inputCell({required FocusNode focusNode, required int position}) {

    final mediaWitdh = MediaQuery.of(context).size.width;

    return SizedBox(
      width: mediaWitdh*0.18666,    //70
      child: TextFormField(
        style: TextStyle(
            fontSize: 20.sp,     //24
            fontWeight: FontWeight.w500),

        validator: (val) {
          if (val!.isEmpty) {
            return "Пусто";
          }

          return null;
        },
        onChanged: (value) {
          if (position == 1) {
            FocusScope.of(context).requestFocus(node2);
          } else if (position == 2) {
            FocusScope.of(context).requestFocus(node3);
          } else if (position == 3) {
            FocusScope.of(context).requestFocus(node4);
          } else if (position == 4) {
            FocusManager.instance.primaryFocus?.unfocus();
            // FocusScope.of(context).requestFocus();
          }

          listCheck[position - 1] = true;

          if (listCheck.contains(false) == false) {
            var formdata = formstate.currentState;

            if (formdata!.validate()) {
              // print('valid - $listCheck');
              FocusManager.instance.primaryFocus?.unfocus();

              // setState(() {
              //   showEnterButton = true;
              // });
            }
            else{
              // showSimpleDialog(title: 'Недоступно', text: 'Некорректный номер', context: context);
              // print('not valid - $listCheck');
            }
          }
        },
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        maxLength: 1,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 25,
              // horizontal: 20
          ),

          counterText: '',
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );

  }




  Widget inputPass() => Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 27),
                child: Text(
                  'Введите код',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Отправленный на номер',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 44),
                child: Text(
                  strPhone,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),

              // ElevatedButton(onPressed: (){
              //   FocusScope.of(context).requestFocus(node2);
              // }, child: const Text('text1')),

              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Form(
                  key: formstate,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      inputCell(focusNode: node1, position: 1),
                      inputCell(focusNode: node2, position: 2),
                      inputCell(focusNode: node3, position: 3),
                      inputCell(focusNode: node4, position: 4),
                    ],
                  ),
                ),
              ),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: buttonStyleCustom(padH: 0, padV: 28, radius: 20),
                    onPressed: () {

                      FocusManager.instance.primaryFocus?.unfocus();

                      // if (showEnterButton) {
                      //   Navigator.of(context).push(MaterialPageRoute<void>(
                      //       builder: (context) => const AuthSuccesPage()));
                      // }

                      var formdata = formstate.currentState;

                      if (formdata!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const AuthSuccesPage()));
                      }

                    },
                    child: Text(
                      'Войти',
                      style:
                      TextStyle(
                          fontSize: 18.5.sp,     //18
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )),
              ),

              // Center(
              //   child:
              //       // ElevatedButton(onPres5sed: showSendButton==false? null: (){}, child: Text('Войти'),)
              //
              //       InkWell(
              //     onTap: (() {
              //       FocusManager.instance.primaryFocus?.unfocus();
              //
              //       // if (showEnterButton) {
              //       //   Navigator.of(context).push(MaterialPageRoute<void>(
              //       //       builder: (context) => const AuthSuccesPage()));
              //       // }
              //
              //       var formdata = formstate.currentState;
              //
              //       if (formdata!.validate()) {
              //         Navigator.of(context).push(MaterialPageRoute<void>(
              //             builder: (context) => const AuthSuccesPage()));
              //       }
              //
              //     }),
              //     child: Container(
              //       width: MediaQuery.of(context).size.width * 0.8,
              //       padding: const EdgeInsets.only(
              //           left: 15, right: 15, top: 20, bottom: 20),
              //       decoration: BoxDecoration(
              //         color: showEnterButton
              //             ? Colors.black87
              //             : Colors.grey.shade600,
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: const Text(
              //         'Войти',
              //         style: TextStyle(
              //             fontSize: 18,
              //             color: Colors.white,
              //             fontWeight: FontWeight.w500),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: InkWell(
                      onTap: (() {
                        setState(() {
                          showPasswordInput = false;
                          // showEnterButton = false;
                        });
                      }),
                      child:

                      SizedBox(
                        height: 30,
                        // width: 200,
                        child: Stack(
                          alignment: Alignment.center,
                          children: const [
                            Positioned(
                              bottom: 10,
                              child: Text(
                                'Повторить попытку',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              // padding: EdgeInsets.only(top: 8),
                              child: Text(
                                '________________________',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),

                      // const Text(
                      //   'Повторить попытку',
                      //   style: TextStyle(
                      //       decoration: TextDecoration.underline,
                      //       fontWeight: FontWeight.w600),
                      // )


                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
