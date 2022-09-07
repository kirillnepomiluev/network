import 'package:flutter/material.dart';
import 'package:network_app/chat/chat_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';


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

    _controller.clear();

    setState(() {
      showSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:  backButton(context),
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //Верхняя часть
                showSuccess == true? Container():
                Container(
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  width: 345,
                  height: 231,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset('assets/icons/dissapointed_smile.png', width: 66, height: 66,),

                      Padding(
                        padding: const EdgeInsets.only(top: 27.6),
                        child: Text('Мы очень сожалеем о вашем плохом опыте. Пожалуйста, потратьте немного своего времени, чтобы точно описать, что произошло, чтобы мы могли исправить ситуацию, как можно скорее.',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 14,
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
                    padding: const EdgeInsets.symmetric(vertical: 63, horizontal: 16),
                    height: MediaQuery.of(context).size.height-120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                    child:
                    showSuccess == true?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Icon(Network.check_circle_outlined, size: 100,),
                            ),

                            //Текстовое поле
                            Padding(
                              padding: const EdgeInsets.only(top: 45, bottom: 35),
                              child:
                              Text(
                                'Ваша жалоба отправлена',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500

                                ),
                              )
                            ),

                            Text(
                              'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400

                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 17, horizontal: 100)),
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
                            child: Text(
                              'Закрыть',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                        ),

                      ],
                    )
                        :
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text('Выберете тип жалобы', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),),

                              Icon(Icons.arrow_drop_down, size: 20,)

                            ],
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


                        ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 17, horizontal: 100)),
                              backgroundColor:
                              MaterialStateProperty.all(showSendButton? Colors.black: Colors.grey),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(52),
                                ),
                              ),
                            ),
                            onPressed: () {
                                sendFunction();
                            },
                            child: Text(
                              // 'Создать чат',
                              'Отправить',
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500

                              ),
                            )),

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
