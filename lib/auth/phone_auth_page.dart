import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/auth/auth_succes_page.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:network_app/constants.dart';


class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {

  List listCheck = [false, false, false, false];

  final node1 = FocusNode();
  final node2 = FocusNode();
  final node3 = FocusNode();
  final node4 = FocusNode();

  bool showPasswordInput = false;
  bool showSendButton = false;

  String strPhone = '';
  // var _phoneController = TextEditingController();

  var formstate = GlobalKey<FormState>();

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

                if(showPasswordInput){
                  setState(() {
                    showPasswordInput = false;
                    showSendButton = false;
                  });
                }
                else{
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RecoveryPage()));
                }


              },
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
          ),
        ),
      ),
      body:
      showPasswordInput
          ? inputPass()
          : inputPhone(),

    );
  }


  Widget inputPhone() => Padding(
    padding: const EdgeInsets.all(15),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text('Введите ваш номер', style: TextStyle(
                color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w500),),
          ),

          Form(
            key: formstate,
            child: IntlPhoneField(
              autofocus: true,
              style: const TextStyle(fontSize: 14),
              keyboardType: TextInputType.number,
              inputFormatters:  <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialCountryCode: 'RU',
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 15),
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
              ),
              onChanged: (phone) {
                strPhone = phone.completeNumber;
                // print('strPhone $strPhone');
              },
              onCountryChanged: (country) {
                // print('Country changed to: ' + country.name);
              },
            ),
          ),

          const Padding(
            padding:  EdgeInsets.only(bottom: 30),
            child: SizedBox(
              width: 350,
              child: Text(Constants.strLoremIpsum,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),

          Center(
            child: InkWell(
              onTap: ((){
                var formdata = formstate.currentState;

                if (formdata!.validate()) {
                  // print('valid');
                  setState(() {
                    showPasswordInput = true;
                  });

                }
                // else{
                //   showSimpleDialog(title: 'Недоступно', text: 'Некорректный номер', context: context);
                //   // print('not valid');
                // }

              }),
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                const Text('Отправить код', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),

              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget inputCell({focusNode, position}) => SizedBox(
    width: 65,
    height: 80,
    child: TextFormField(
      validator: (val){

        if (val!.isEmpty) {
          return "Пусто";
        }

        return null;

      },
      onChanged: (value){

        if(position==1){
          FocusScope.of(context).requestFocus(node2);
        }
        else if(position==2){
          FocusScope.of(context).requestFocus(node3);
        }
        else if(position==3){
          FocusScope.of(context).requestFocus(node4);
        }
        else if(position==4){
          FocusManager.instance.primaryFocus?.unfocus();
          // FocusScope.of(context).requestFocus();
        }

        listCheck[position-1] = true;

        if(listCheck.contains(false)==false){
          var formdata = formstate.currentState;

          if (formdata!.validate()) {
            // print('valid - $listCheck');
            FocusManager.instance.primaryFocus?.unfocus();

            setState(() {
              showSendButton = true;
            });

          }
          // else{
          //   // showSimpleDialog(title: 'Недоступно', text: 'Некорректный номер', context: context);
          //   // print('not valid - $listCheck');
          // }
        }

      },

      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.center,
      maxLength: 1,
      autofocus: true,
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(5)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(5)
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    ),
  );



  Widget inputPass() => Padding(
    padding: const EdgeInsets.all(15),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text('Введите код', style: TextStyle(
                color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w500),),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('Отправленный на номер', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Text(strPhone, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500),),
          ),

          // ElevatedButton(onPressed: (){
          //   FocusScope.of(context).requestFocus(node2);
          // }, child: const Text('text1')),


          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Form(
              key: formstate,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                inputCell(focusNode: node1, position: 1),
                inputCell(focusNode: node2, position: 2),
                inputCell(focusNode: node3, position: 3),
                inputCell(focusNode: node4, position: 4),
              ],),
            ),
          ),

          Center(
            child:
              // ElevatedButton(onPressed: showSendButton==false? null: (){}, child: Text('Войти'),)

            InkWell(
              onTap: ((){

                FocusManager.instance.primaryFocus?.unfocus();

                if(showSendButton){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AuthSuccesPage()));
                }

              }),
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: showSendButton? Colors.black87 : Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                const Text('Войти', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),

              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: InkWell(
                  onTap: ((){

                    setState(() {
                      showPasswordInput = false;
                      showSendButton = false;
                    });

                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginSecondPage()));
                  }),
                  child: const Text('Повторить попытку', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w600),)),
            ),
          ),


        ],
      ),
    ),
  );


}