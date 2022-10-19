import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/auth/auth_succes_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

bool _enterButtonValid = false;

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  bool showPasswordInput = false;

  String strPhone = '';

  var formstate = GlobalKey<FormState>();

  void backFunc() {
    if (showPasswordInput) {
      setState(() {
        showPasswordInput = false;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {

    _enterButtonValid = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {

          backFunc();

          // if (showPasswordInput) {
          //   setState(() {
          //     showPasswordInput = false;
          //   });
          // } else {
          //   Navigator.of(context).pop();
          // }
          return false;
        },
        child: AuthBackScaffold(
          centerYellow: true,
          childColumn: showPasswordInput ? inputPass() : inputPhone(),
        ));
  }

  Widget inputPhone() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: backButton(context, func: backFunc),
          ),
          const EnterInfoContainer(
            padTop: 32,
            text1: 'Введите ',
            text2: 'ваш номер',
            maxLines: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Form(
              key: formstate,
              child: SizedBox(
                height: 80,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: SizedBox(
                        child: IntlPhoneField(
                          dropdownIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          autofocus: false,
                          dropdownTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          initialCountryCode: 'RU',
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.only(top: 25, bottom: 24),
                            contentPadding:
                            const EdgeInsets.only(top: 22, bottom: 24),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: ConstColor.salad100),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: ConstColor.salad100),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: ConstColor.salad100),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onChanged: (phone) {
                            strPhone = phone.completeNumber;

                            strPhone =
                            '${strPhone.substring(0, 1)} ${strPhone.substring(1, 2)} ${strPhone.substring(2, 5)} ${strPhone.substring(5, 8)} ${strPhone.substring(8, 10)} ${strPhone.substring(10)}'; //33

                            var formdata = formstate.currentState;

                            if (formdata!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: buttonStyleCustom(padH: 0, padV: 22, radius: 20),
                  onPressed: () {
                    var formdata = formstate.currentState;

                    if (formdata!.validate()) {
                      // print('valid');
                      setState(() {
                        showPasswordInput = true;
                      });
                    }
                  },
                  child: Text(
                    'Отправить код',
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
  );


  Widget inputPass() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: backButton(context, func: backFunc),
          ),

          EnterInfoContainerPass(
            formstate: formstate,
            strPhone: strPhone,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: buttonStyleCustom(
                      color: _enterButtonValid? Colors.white : Colors.white.withOpacity(0.05),
                      padH: 0, padV: 22, radius: 20),
                  onPressed: () {

                    FocusManager.instance.primaryFocus?.unfocus();

                    var formdata = formstate.currentState;

                    if (formdata!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const AuthSuccesPage()));
                    }

                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(
                        fontSize: 18.5.sp, //18
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                  )),
            ),
          ),


          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 20),
              child: InkWell(
                onTap: (() {
                  setState(() {
                    showPasswordInput = false;
                  });
                }),
                child: SizedBox(
                  height: 30,
                  // width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Positioned(
                        bottom: 10,
                        child: Text(
                          'Повторить попытку',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ConstColor.greyText
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        // padding: EdgeInsets.only(top: 8),
                        child: Text(
                          '_____________________________',
                          style: TextStyle(
                              fontSize: 10,
                              color: ConstColor.greyText,
                              fontWeight: FontWeight.bold),
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

class EnterInfoContainerPass extends StatefulWidget {
  final GlobalKey<FormState> formstate;
  final String strPhone;
  EnterInfoContainerPass({Key? key, required this.strPhone, required this.formstate})
      : super(key: key);

  @override
  State<EnterInfoContainerPass> createState() => _EnterInfoContainerPassState();
}

class _EnterInfoContainerPassState extends State<EnterInfoContainerPass> {
  final node1 = FocusNode();
  final node2 = FocusNode();
  final node3 = FocusNode();
  final node4 = FocusNode();
  List listCheck = <bool>[false, false, false, false];

  // var formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 31),
      child: BlurryContainer(
        width: double.infinity,
        blur: 20,
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildRichText(text1: 'Введите ', text2: 'код'),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Отправленный на номер',
                style: TextStyle(
                    fontSize: getResSize(14),
                    color: ConstColor.greyText,
                    fontWeight: FontWeight.w400),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                widget.strPhone,
                style: TextStyle(
                    fontSize: getResSize(14),
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Form(
                key: widget.formstate,
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
          ],
        ),
      ),
    );
  }

  Widget inputCell({required FocusNode focusNode, required int position}) {

    return SizedBox(
      width: 62, //62
      child: TextFormField(
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp, //24
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
            var formdata = widget.formstate.currentState;

            if (formdata!.validate()) {
              // print('valid - $listCheck');
              FocusManager.instance.primaryFocus?.unfocus();

              setState(() {
                _enterButtonValid = true;
              });
            } else {
              // showSimpleDialog(title: 'Недоступно', text: 'Некорректный номер', context: context);
              // print('not valid - $listCheck');
            }
          }
        },
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: Colors.white,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          counterText: '',
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          // filled: true,
          // fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRichText({
    String text1 = '',
    String text2 = '',
  }) =>
      RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp, //24
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: text1,
            ),
            TextSpan(
                text: text2,
                style: const TextStyle(
                  color: ConstColor.salad100,
                )),
          ],
        ),
        // minFontSize: 14,
      );
}
