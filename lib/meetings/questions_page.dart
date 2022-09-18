import 'package:flutter/material.dart';
import 'package:network_app/chat/chat_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

  final _controller = TextEditingController();

  int _missedCount = 3;

  final int _questionCount = 3;
  int _questionIndex = 0;
  double _progress = 0.00;
  bool showSendButton = false;

  bool showSuccessPage = false;

  void sendFunction({bool isMissing = false}){

    if(isMissing && _missedCount>0){
      _missedCount--;
    }

    _controller.clear();

    showSendButton = false;

    if( (_questionIndex+1)==_questionCount){
      showSuccessPage = true;
    }
    else{
      _progress = (_questionIndex+1)/_questionCount;
      _questionIndex++;
    }


    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    final imageWidth = 0.624*mediaWidth;


    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: backButton(context),
              ),

              showSuccessPage? const SizedBox(height: 17,):
              //Прогресс
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      width: 0.1146*mediaWidth,    //43
                      height: 0.1146*mediaWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text('1', style: TextStyle(
                          fontSize: 16.5.sp,   //14
                          fontWeight: FontWeight.w500
                        ),)
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.1173*mediaWidth   //44
                        ),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade100,
                          color: Colors.black,
                          minHeight: 4,
                          value: _progress,
                        ),
                      ),
                    ),

                    Container(
                      width: 0.1146*mediaWidth,    //43
                      height: 0.1146*mediaWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text('3', style: TextStyle(
                              fontSize: 16.5.sp,   //14
                              fontWeight: FontWeight.w500
                          ),)
                      ),
                    ),

                  ],
                ),
              ),

              //Нижняя часть
              showSuccessPage?
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    vertical: 27,
                    horizontal: 16
                ),
                height: mediaHeight,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 19, bottom: 47),
                      child: Text(
                        'Поздравляем, вы ответили\nна все вопросы',
                        style: TextStyle(
                          fontSize: 19.5.sp, //20
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Container(
                      width: imageWidth,     //234
                      height: 0.9359*imageWidth,  //219
                      decoration: BoxDecoration(
                        color: Colors.red,
                      borderRadius: BorderRadius.circular(17)
                    ),),


                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 56),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          'Теперь вы можете открыть чат и договориться о встрече. Конечно же здесь можно разместить и другую ценную информацию.',
                          style: TextStyle(
                            fontSize: 17.5.sp, //16
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),


                    SizedBox(
                      height: mediaWidth*0.1413,   //53
                      child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 0.1626*mediaWidth  //61
                                )),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (context) => const ChatPage()));

                          },
                          child: Text(
                            'Начать чат',
                            style: TextStyle(
                                fontSize: 18.5.sp, //18
                              fontWeight: FontWeight.w500
                            ),
                          )),
                    ),

                  ],
                ),
              )
                  :
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 27,
                    horizontal: 16
                ),
                height: mediaHeight,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _questionCount,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            _questionIndex==index?
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ВОПРОС ${index+1} ИЗ $_questionCount',
                                  style: TextStyle(
                                    fontSize: 17.5.sp, //16
                                    color: ConstColor.grey,
                                    // color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // textAlign: TextAlign.center,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 21,
                                      right: 32
                                  ),
                                  child: SizedBox(
                                    // width: 300,
                                    child: Text(
                                      index==0?
                                      'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'
                                      : 'Какой-нибудь вопрос №${index+1}',
                                      style: TextStyle(
                                        fontSize: 19.5.sp,   //20
                                        fontWeight: FontWeight.w700,
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),

                                ),
                              ],
                            )
                          : Container();

                        }),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30
                      ),
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
                            Container(width: 20,):
                            IconButton(onPressed: (){
                              sendFunction();
                            }, icon: const Icon(Icons.send))

                          ],
                        ),
                      ),
                    ),

                    _missedCount==0? Container():
                    Column(
                      children: [
                        Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: InkWell(
                                  onTap: (){
                                    sendFunction(isMissing: true);
                                  },
                                  child: Container(
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(43),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.5),
                                          child: Text(
                                            'Пропустить вопрос',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 15.5.sp  //12
                                            ),
                                          ),
                                        ),

                                        Padding(padding: const EdgeInsets.only(left: 14, top: 1),

                                        child: Icon(Icons.close_outlined,
                                          size: 17.5.sp, //15
                                          color: Colors.white,),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Вы можете пропустить ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    // color: ConstColor.grey,
                                    color: Colors.grey.shade500,
                                    fontSize: 14.sp //10
                                ),
                              ),

                              Text(
                                '$_missedCount вопроса',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 14.sp //10
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  Widget _textEditor() => SizedBox(
    height: 80,
    child: TextField(
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
      style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),

      textAlign: TextAlign.start,

      autofocus: true,
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
