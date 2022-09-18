import 'dart:async';

import 'package:flutter/material.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<Map<String, dynamic>> messagesList = [
    <String, dynamic> {
      'you' : false,
      'text' : 'Привет! Как дела?',
      'min' : 35,
    },

    <String, dynamic> {
      'you' : true,
      'text' : 'Привет, Джоли! У меня все в порядке. Спасибо)))',
      'min' : 10,
    },

    <String, dynamic> {
      'you' : false,
      'text' : 'Когда у тебя есть свободное время?',
      'min' : 0,
    },

    <String, dynamic> {
      'you' : false,
      'text' : 'Может встретимся?',
      'min' : 5,
    },

    <String, dynamic> {
      'you' : true,
      'text' : 'Можем встретиться в выходные',
      'min' : 3,
    },

  ];

  final _controller = TextEditingController();
  bool showSendButton = false;

  final ScrollController _scrollController = ScrollController();

  void sendFunction(){

    messagesList.add(
      <String, dynamic> {
        'you' : true,
        'text' : _controller.text,
        'min' : 1,
      },
    );

    // SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    FocusManager.instance.primaryFocus?.unfocus();
    _controller.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    // _scrollController.jumpTo(200);

    // _scrollContr.animateTo(
    //     // MediaQuery.of(context).size.height,
    //     300,
    //     curve: Curves.easeOut,
    //     duration: const Duration(seconds: 0)
    // );

      setState(() {});

  }

  void _scrollToBottom() {

    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(const Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }


  // @override
  // void initState() {
  //   super.initState();
  // }

  bool checked = false;

  @override
  Widget build(BuildContext context) {

    if(!checked){
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      checked = true;
    }

    final mediaWidth = MediaQuery.of(context).size.width;


    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () async {

        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => const HomePage(initIndex: 3,)));

        return false;
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          automaticallyImplyLeading: false,
            toolbarHeight: 70,
            backgroundColor: Colors.grey.shade400,
            elevation: 0,
          title:
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                backButton(context, func: (){
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const HomePage(initIndex: 3,)));
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text('Джоли',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp, //20
                        fontWeight: FontWeight.w600),
                  ),
                ),

                Row(
                  children: [

                    Container(
                      width: 0.1146*mediaWidth,    //43
                      height: 0.1146*mediaWidth,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:
                      Icon(
                        Network.electric,
                        color: Colors.white,
                        size: 17.sp, //17
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Container(
                        width: 0.1146*mediaWidth,    //43
                        height: 0.1146*mediaWidth,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                // Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.more_horiz,
                                color: Colors.black,
                                size: 17.sp, //17
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        body: _body(),

        bottomNavigationBar:
        Container(
          color: Colors.transparent,
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: keyboardSize+10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _textEditor()),

                Padding(padding: const EdgeInsets.only(right: 10),

                child:  showSendButton==false?
                IconButton(onPressed: (){}, icon: Icon(
                  Network.smile,
                  size: 22.sp,   //26
                  color: Colors.grey,
                )):
                IconButton(onPressed: (){
                  sendFunction();
                }, icon: Icon(
                    Icons.send,
                  size: 22.sp,   //26
                )),
                )

              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget _body() {

    return GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: messagesList.length,
        itemBuilder: (BuildContext context, int index) {
          return
            Column(
              children: [

                index!=0? Container():
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(children: [

                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('Сегодня, 12:01', style: TextStyle(
                          fontSize: 15.5.sp, //12
                          fontWeight: FontWeight.w400),),
                    ),

                    Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              height: 45,
                              width: 45,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Positioned(
                                    top: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade500,
                                            shape: BoxShape.circle),
                                        width: 45,
                                        height: 45,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Network.person,
                                            color: Colors.black,
                                          ),
                                          iconSize: 18,
                                        )),
                                  ),

                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child:

                                      Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle),
                                          width: 17,
                                          height: 17,
                                          child:
                                          const Icon(
                                              Network.electric,
                                            size: 7,
                                            color: Colors.white,)
                                      )

                                  )

                                ],
                              ),
                            ),
                          ),

                          Flexible(child: Text('У вас запланирована встреча с Джоли. Пообщайтесь и обговорите важные моменты.',
                            style: TextStyle(
                                fontSize: 15.5.sp, //12
                                fontWeight: FontWeight.w400),
                            maxLines: null,)),
                        ],
                      ),)

                  ],),
                ),

                messageCont(messagesList[index]),

                index!=messagesList.length-1? Container(): const SizedBox(height: 100,)

              ],
            );

        }),
  );
  }


  Widget messageCont(Map<String, dynamic> messageMap) {

    bool isYou = messageMap['you'] as bool;
    String strText = messageMap['text'] as String;
    int intMin = messageMap['min'] as int;

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: intMin<2? 0 : 10),
      child: Column(
        crossAxisAlignment: isYou? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width*0.67,
            ),
            // width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
            ),
            padding: const EdgeInsets.all(15),
            child: Text(strText, style: TextStyle(
                fontSize: 16.5.sp, //14
                fontWeight: FontWeight.w400,
                color: Colors.black)),
          ),

          intMin<2? Container() :
          Padding(
            padding: const EdgeInsets.only(top: 5,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: isYou? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [

                isYou==false? Container():
                    Icon(Network.check_double,
                    size: 15.5.sp,   //12
                    ),
                // SizedBox(
                //   width: 12,
                //   height: 9,
                //   child: Stack(
                //     children: const [
                //       Positioned(
                //           left: 4,
                //           child: Icon(Icons.check, size: 10, color: Colors.black)),
                //       Positioned(
                //           left: 0,
                //           child: Icon(Icons.check, size: 10, color: Colors.black,)),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '$intMin мин',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400),
                  ),
                ),

              ],
            ),
          ),


        ],),
    );
  }

  Widget _textEditor() => SizedBox(
    height: 75,
    // width: double.infinity,
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
      // onSubmitted: (value){
      //
      //   if(value.isNotEmpty){
      //     sendFunction();
      //   }
      //
      // },
      // textInputAction: TextInputAction.send,

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
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
        ),
        enabledBorder:
        OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
          // borderRadius: BorderRadius.circular(15)
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    ),
  );


}

