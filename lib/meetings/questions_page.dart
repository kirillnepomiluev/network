import 'package:flutter/material.dart';
import 'package:network_app/chat/chat_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';


class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

  final _controller = TextEditingController();

  int _missedCount = 3;

  int _questionCount = 3;
  int _questionIndex = 0;
  double _progress = 0.00;
  bool showSendButton = false;

  bool showSuccessPage = false;

  sendFunction({bool isMissing = false}){

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
    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: backButton(context),
              ),

              showSuccessPage? SizedBox(height: 17,):
              //Прогресс
              Padding(
                // padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(right: 44),
                      child: Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text('1', style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),)
                        ),
                      ),
                    ),

                    Expanded(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.shade100,
                        color: Colors.black,
                        minHeight: 4,
                        value: _progress,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 44),
                      child: Container(
                        // alignment: Alignment.topLeft,
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Text('$_questionCount', style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),)
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              //Нижняя часть
              showSuccessPage?
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
                height: MediaQuery.of(context).size.height-100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 19, bottom: 47),
                      child: Text(
                        'Поздравляем, вы ответили\nна все вопросы',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Container(
                      width: 234,
                      height: 219,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      borderRadius: BorderRadius.circular(17)
                    ),),


                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 56),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          'Теперь вы можете открыть чат и договориться о встрече. Конечно же здесь можно разместить и другую ценную информацию.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),


                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 15)),
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            // 'Создать чат',
                            'Начать чат',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),

                  ],
                ),
              )
                  :
              Container(
                // alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
                height: MediaQuery.of(context).size.height-150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // padding: const EdgeInsets.only(left: 5, top: 41),
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
                                    fontSize: 16,
                                    color: ConstColor.grey,
                                    // color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // textAlign: TextAlign.center,
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 21, right: 32),
                                  child: SizedBox(
                                    // width: 300,
                                    child: Text(
                                      index==0?
                                      'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'
                                      : 'Какой-нибудь вопрос №${index+1}',
                                      style: TextStyle(
                                        fontSize: 20,
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
                      padding: const EdgeInsets.only(top: 30),
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
                                    // width: 200,
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
                                                color: Colors.white, fontSize: 12),
                                          ),
                                        ),

                                        Padding(padding: EdgeInsets.only(left: 14,),

                                        child: Icon(Icons.close_outlined, size: 16, color: Colors.white,),
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

                                    fontSize: 10),
                              ),

                              Text(
                                '$_missedCount вопроса',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black, fontSize: 10),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),


                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.all(20),
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.shade300,
                    //       borderRadius: BorderRadius.circular(31)),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(bottom: 20),
                    //         child: Container(
                    //           width: 120,
                    //           padding: const EdgeInsets.symmetric(
                    //               vertical: 7, horizontal: 0),
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey.shade500,
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: const Center(
                    //               child: Text(
                    //                 'Деловая встреча',
                    //                 style: TextStyle(
                    //                     color: Colors.white, fontSize: 10),
                    //               )),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),


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
    // height: 62,
    height: 80,
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
