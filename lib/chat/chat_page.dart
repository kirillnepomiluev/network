import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/profile/home_page.dart';


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

  final _scrollContr = ScrollController();

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

    _scrollContr.jumpTo(200);

    // _scrollContr.animateTo(
    //     // MediaQuery.of(context).size.height,
    //     300,
    //     curve: Curves.easeOut,
    //     duration: const Duration(seconds: 0)
    // );

      setState(() {});

  }

  @override
  void initState() {

    // _scrollContr.jumpTo(500);

    // _scrollContr.animateTo(
    //     100,
    //     curve: Curves.easeOut,
    //     duration: const Duration(seconds: 1)
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: true,
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
              buttonBack(context),
              const Text('Джоли',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                // alignment: Alignment.topLeft,
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                        size: 25,
                      )),
                ),
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
              Expanded(child: textEditor()),

              showSendButton==false?
              IconButton(onPressed: (){}, icon: const Icon(Icons.tag_faces_sharp)):
              // Container():
              IconButton(onPressed: (){
                sendFunction();
              }, icon: const Icon(Icons.send))

            ],
          ),
        ),
      ),

    );
  }

  Widget _body() =>  GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: ListView.builder(
        controller: _scrollContr,
        // physics: NeverScrollableScrollPhysics(),
      // reverse: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
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

                    const Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text('Сегодня, 12:01', style: TextStyle(fontWeight: FontWeight.w500),),
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
                                          width: 16,
                                          height: 16,
                                          child:
                                          const Icon(
                                              Network.electric, size: 9, color: Colors.white,)
                                      )

                                  )

                                ],
                              ),
                            ),
                          ),

                          const Flexible(child: Text('У вас запланирована встреча с Джоли. Пообщайтесь и обговорите важные моменты.',
                            style: TextStyle(fontWeight: FontWeight.w500),
                            maxLines: null,)),
                        ],
                      ),)

                  ],),
                ),

                messageCont(messagesList[index]),

                index!=messagesList.length-1? Container(): SizedBox(height: 100,)

              ],
            );

        }),
  );


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
              maxWidth: MediaQuery.of(context).size.width*0.6,
            ),
            // width: MediaQuery.of(context).size.width*0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
            ),
            padding: const EdgeInsets.all(15),
            child: Text(strText, style: const TextStyle(fontSize: 14, color: Colors.black)),
          ),

          intMin<2? Container() :
          Padding(
            padding: const EdgeInsets.only(top: 5,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: isYou? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [

                isYou==false? Container():
                SizedBox(
                  width: 12,
                  height: 9,
                  child: Stack(
                    children: const [
                      Positioned(
                          left: 4,
                          child: Icon(Icons.check, size: 10, color: Colors.black)),
                      Positioned(
                          left: 0,
                          child: Icon(Icons.check, size: 10, color: Colors.black,)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '$intMin мин',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ),


        ],),
    );
  }

  Widget textEditor() => SizedBox(
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
      onSubmitted: (value){

        if(value.isNotEmpty){
          sendFunction();
        }

      },
      textInputAction: TextInputAction.send,
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

