import 'dart:async';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home/home_page.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/utils/responsive_utils.dart';
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



    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () async {

        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => const HomePage(initIndex: 4,)));

        return false;
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
            toolbarHeight: 70,
            elevation: 0,
          title:
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                BackButtonCustom( func: (){
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const HomePage(initIndex: 4,)));
                }),

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text('Джоли',
                    style: TextStyle(
                        fontSize: 20.sp, //20
                        fontWeight: FontWeight.w600),
                  ),
                ),

                const IconContainer(icon: Icons.more_horiz_rounded),

              ],
            ),
          ),
        ),

        body: _body(),

        bottomNavigationBar:
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: keyboardSize+10),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white10,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(child: _textEditor()),

                Padding(padding: const EdgeInsets.only(right: 10),

                child:  showSendButton==false?
                IconButton(onPressed: (){}, icon: Icon(
                  NetworkIcons.smile,
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
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w400),),
                    ),

                    Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        // color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              height: 45,
                              width: 48,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  const Positioned(
                                    top: 0,
                                    child:
                                      CustomCircleAvatar(
                                          imageUrl:  'assets/images/avatars/avatar_0.png',
                                          contSize: 45
                                      )

                                  ),

                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child:
                                      Container(
                                          decoration: const BoxDecoration(
                                              color: AppColors.salad100,
                                              shape: BoxShape.circle
                                          ),
                                          width: 17,
                                          height: 17,
                                          child:
                                          const Icon(
                                              NetworkIcons.electric,
                                            size: 7,
                                            color: Colors.black,
                                          )
                                      )

                                  )

                                ],
                              ),
                            ),
                          ),

                          Flexible(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('У вас запланирована встреча с Джоли',
                                style: TextStyle(
                                  color: AppColors.salad100,
                                    fontSize: 15.5.sp, //12
                                    fontWeight: FontWeight.w600
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('Пообщайтесь и обговорите важные моменты.',
                                  style: TextStyle(
                                      fontSize: 15.5.sp, //12
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),

                            ],
                          )),
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

    final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: intMin<2? 0 : 10),
      child: Column(
        crossAxisAlignment: isYou? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            constraints: BoxConstraints(
              maxWidth: isYou? mediaWidth*0.67 : mediaWidth*0.8,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: isYou? AppColors.salad100 : AppColors.white10
            ),
            padding: const EdgeInsets.all(15),
            child: Text(
                strText, style: TextStyle(
              color: isYou? AppColors.textBlack : AppColors.textWhite,
              fontSize: 16.5.sp, //14
                fontWeight: FontWeight.w400,
            )),
          ),

          intMin<2? Container() :
          Padding(
            padding: const EdgeInsets.only(top: 5,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: isYou? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [

                isYou==false? Container():
                    Icon(NetworkIcons.check_double,
                    color: AppColors.salad100,
                    size: ResponsiveUtils.getResSize(10),   //12
                    ),

                Padding(
                  padding: const EdgeInsets.only(left: 6.5),
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
    // height: 75,
    child: TextField(
      // style: TextStyle(),
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
      // maxLines: 3,
      controller: _controller,
      textAlign: TextAlign.start,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        hintText: 'Ваше сообщение...',
        hintStyle: TextStyle(
            color: AppColors.textGray,
          fontSize: ResponsiveUtils.getResSize(14),
          fontWeight: FontWeight.w400
        ),
        counterText: '',
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
        ),
        enabledBorder:
        const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
          // borderRadius: BorderRadius.circular(15)
        ),
        // filled: true,
        // fillColor: ConstColor.white10,
      ),
    ),
  );


}

