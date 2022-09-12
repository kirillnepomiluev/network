import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {

  final _controller = TextEditingController();

  bool showSendButton = false;
  bool showSuccess = false;

  sendFunction(){

    FocusManager.instance.primaryFocus?.unfocus();

    _controller.clear();

    setState(() {
      showSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade400,
          body:
          showSuccess == true?
          Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, bottom: 20),
                child:  backButton(context),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: mediaWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                  child:

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                            padding: EdgeInsets.only(
                                top: 0.087*mediaHeight   //63
                            ),
                            child: Icon(Network.check_circle_outlined, size: 100,),
                          ),

                          //Текстовое поле
                          Padding(
                              padding: EdgeInsets.only(
                                  top: mediaHeight*0.0624,    //45
                                  bottom: mediaHeight*0.0485  //35
                              ),
                              child:
                              Text(
                                'Ваша жалоба отправлена',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.5.sp, //18
                                    fontWeight: FontWeight.w500

                                ),
                              )
                          ),

                          Text(
                            'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.5.sp,   //14
                                fontWeight: FontWeight.w400

                            ),
                          ),
                        ],
                      ),


                      Padding(
                        padding: EdgeInsets.only(
                            bottom:  mediaHeight*0.0485  //35
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(

                                backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(52),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 17),
                                child: Text(
                                  // 'Создать чат',
                                  'Закрыть',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.5.sp,   //16
                                      fontWeight: FontWeight.w500

                                  ),
                                ),
                              )),
                        ),
                      ),

                    ],
                  )

                ),
              ),
            ],
          )
              :

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 20),
                  child:  backButton(context),
                ),

                //Верхняя часть

                Container(
                  padding: const EdgeInsets.all(20),
                  width: mediaWidth*0.92,   //345
                  // height: 0.92*mediaWidth*0.6695,  //231
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset('assets/icons/dissapointed_smile.png',
                        width: 0.176*mediaWidth,  //66
                        height: 0.176*mediaWidth,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 27.6),
                        child: Text('Мы очень сожалеем о вашем плохом опыте. Пожалуйста, потратьте немного своего времени, чтобы точно описать, что произошло, чтобы мы могли исправить ситуацию, как можно скорее.',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 16.5.sp, //14
                          fontWeight: FontWeight.w400
                        ),
                        ),
                      )

                    ],
                  ),
                ),


                //Нижняя часть
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    // height: mediaHeight-120,
                    // width: mediaWidth,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text('Выберете тип жалобы', style: TextStyle(
                                  fontSize: 17.5.sp,   //16
                                  fontWeight: FontWeight.w500
                                ),),

                                Icon(Icons.arrow_drop_down, size: 20,)

                              ],
                            ),
                          ),
                        ),

                        //Текстовое поле
                        Padding(
                          padding: const EdgeInsets.only(top: 21, bottom: 48),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: _textEditor()),

                                showSendButton==false?
                                // IconButton(onPressed: (){}, icon: const Icon(Icons.tag_faces_sharp)):
                                Container(width: 20,):
                                IconButton(onPressed: (){
                                  sendFunction();
                                }, icon: const Icon(Icons.send))

                              ],
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(52),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                    sendFunction();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 17),
                                  child: Text(
                                    'Отправить',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontSize: 17.5.sp,   //16
                                        fontWeight: FontWeight.w500

                                    ),
                                  ),
                                )),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _textEditor() => SizedBox(
    // height: 62,
    height: 200,
    child: TextField(
      // validator: (val){
      //
      //   if (val!.isEmpty) {
      //     return "Пусто";
      //   }
      //
      //   return null;
      //
      // },
      onChanged: (value){

        if(value.isEmpty){
          setState(() {
            showSendButton = false;
          });
        }else{
          setState(() {
            showSendButton = true;
          });
        }

      },
      maxLines: 3,
      controller: _controller,
      // textInputAction: TextInputAction.none,
      // onSubmitted: (value){
      //   if(value.isNotEmpty){
      //     sendFunction();
      //   }
      // },
      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
      // onFieldSubmitted: (value){
      //   print('submitted - $value');
      //
      //   // SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      //   FocusManager.instance.primaryFocus?.unfocus();
      //
      // },
      textAlign: TextAlign.start,
      // maxLines: 2,
      // maxLength: 1,
      autofocus: false,
      decoration: const InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
        ),
        enabledBorder:

        OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
          // borderRadius: BorderRadius.circular(15)
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    ),
  );


}
