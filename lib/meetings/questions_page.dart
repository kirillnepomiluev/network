import 'package:flutter/material.dart';
import 'package:network_app/chat/chat_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
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

  void sendFunction({bool isMissing = false}) {
    if (isMissing && _missedCount > 0) {
      _missedCount--;
    }

    _controller.clear();

    showSendButton = false;

    if ((_questionIndex + 1) == _questionCount) {
      showSuccessPage = true;
    } else {
      _progress = (_questionIndex + 1) / _questionCount;
      _questionIndex++;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    final double imageWidth = 161; //161

    return Scaffold(
      // backgroundColor: ConstColor.blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: BackButtonCustom(),
              ),

              showSuccessPage
                  ? const SizedBox(
                      height: 17,
                    )
                  :
                  //Прогресс
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 0.1146 * mediaWidth, //43
                            height: 0.1146 * mediaWidth,
                            decoration: BoxDecoration(
                              color: ConstColor.white10,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: Text(
                              '1',
                              style: TextStyle(
                                  // color: ConstColor.textWhite,
                                  fontSize: 16.5.sp, //14
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.1173 * mediaWidth //44
                                  ),
                              child: LinearProgressIndicator(
                                backgroundColor: ConstColor.white10,
                                color: ConstColor.salad100,
                                minHeight: 4,
                                value: _progress,
                              ),
                            ),
                          ),
                          Container(
                            width: 0.1146 * mediaWidth, //43
                            height: 0.1146 * mediaWidth,
                            decoration: BoxDecoration(
                              color: ConstColor.white10,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: Text(
                              '3',
                              style: TextStyle(
                                  // color: ConstColor.textWhite,
                                  fontSize: 16.5.sp, //14
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ],
                      ),
                    ),

              //Нижняя часть
              showSuccessPage
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          // vertical: 27,
                          horizontal: 16),
                      height: mediaHeight,
                      width: mediaWidth,
                      decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 49),
                              child: BuildRichTextTwo(
                                text1: 'Поздравляем, ',
                                color1: ConstColor.salad100,
                                // fontWeight1: FontWeight.w600,
                                text2: 'вы ответили\nна все вопросы',
                                color2: ConstColor.textWhite,
                                // fontWeight2: FontWeight.w600,
                                // fontSize: 19.5.sp, //20
                                textAlign: TextAlign.center,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: Text(
                              'Джоли, 28',
                              style: TextStyle(
                                // color: ConstColor.textWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              width: imageWidth+11,
                              height: imageWidth+15,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: imageWidth, //161
                                    height: 0.93 * imageWidth, //150
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        borderRadius: BorderRadius.circular(22.25)),
                                    child: Image.asset(
                                      'assets/images/avatars/avatar_6.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconContainer(
                                        contColor: ConstColor.salad100,
                                        icon: Network.chat,
                                      iconColor: Colors.black,
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(
                                left: 38,
                                right: 38,
                                top: 25,
                            ),
                            child: SizedBox(
                              // width: 300,
                              child: Text(
                                'Теперь вы можете открыть чат и договориться о встрече. Конечно же здесь можно разместить и другую ценную информацию.',
                                style: TextStyle(
                                  height: 1.3,
                                  // color: ConstColor.textWhite,
                                  fontSize: 16, //16
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              top: 44,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style:
                                  buttonStyleCustom(
                                      radius: 20,
                                      padV: 26
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ChatPage()));
                                  },
                                  child: Text(
                                    'Начать чат',
                                    style: TextStyle(
                                        color: ConstColor.textBlack,
                                        fontSize: 17.5.sp, //16
                                        fontWeight: FontWeight.w500
                                    ),
                                  )),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(top: 44),
                          //   child: SizedBox(
                          //     height: mediaWidth * 0.1413, //53
                          //     child: ElevatedButton(
                          //         style: ButtonStyle(
                          //           padding: MaterialStateProperty.all(
                          //               EdgeInsets.symmetric(
                          //                   horizontal: 0.1626 * mediaWidth //61
                          //                   )),
                          //           backgroundColor:
                          //               MaterialStateProperty.all(Colors.black),
                          //           shape: MaterialStateProperty.all(
                          //             RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(30),
                          //             ),
                          //           ),
                          //         ),
                          //         onPressed: () {
                          //           Navigator.of(context).push(
                          //               MaterialPageRoute<void>(
                          //                   builder: (context) =>
                          //                       const ChatPage()));
                          //         },
                          //         child: Text(
                          //           'Начать чат',
                          //           style: TextStyle(
                          //               fontSize: 18.5.sp, //18
                          //               fontWeight: FontWeight.w500),
                          //         )),
                          //   ),
                          // ),

                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 27, horizontal: 16),
                      height: mediaHeight,
                      width: mediaWidth,
                      decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _questionCount,
                              itemBuilder: (BuildContext context, int index) {
                                return _questionIndex == index
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Вопрос ${index + 1} из $_questionCount',
                                            style: TextStyle(
                                              fontSize: 17.5.sp, //16
                                              color: ConstColor.salad100,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, right: 32),
                                            child: SizedBox(
                                              // width: 300,
                                              child: Text(
                                                index == 0
                                                    ? 'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'
                                                    : 'Какой-нибудь вопрос №${index + 1}',
                                                style: TextStyle(
                                                  // color: ConstColor.textWhite,
                                                  fontSize: 19.5.sp, //20
                                                  fontWeight: FontWeight.w600,
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
                            padding: const EdgeInsets.only(top: 35),
                            child: _textEditor(),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 30
                          //   ),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         // color: Colors.white,
                          //         borderRadius: BorderRadius.circular(15)
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Expanded(child: _textEditor()),
                          //
                          //         showSendButton==false?
                          //         Container(width: 20,):
                          //         IconButton(onPressed: (){
                          //           sendFunction();
                          //         }, icon: const Icon(Icons.send))
                          //
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          _missedCount == 0
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: InkWell(
                                        onTap: () {
                                          sendFunction(isMissing: true);
                                        },
                                        child: Container(
                                          // height: 32,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 18),
                                          decoration: BoxDecoration(
                                            color: ConstColor.white10,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.5),
                                                child: Text(
                                                  'Пропустить этот вопрос',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                      fontSize: 15.5.sp //12
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 11, top: 1),
                                                child: Container(
                                                  width: 21,
                                                  height: 21,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          ConstColor.salad100,
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.close_rounded,
                                                    size: getResSize(12), //15
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                fontWeight: FontWeight.w400,
                                                color: ConstColor.salad100,
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
        // height: 80,
        child: TextField(
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                showSendButton = false;
              });
            } else {
              setState(() {
                showSendButton = true;
              });
            }
          },
          // maxLines: 3,
          controller: _controller,
          style: TextStyle(
              fontSize: getResSize(18),
              // color: ConstColor.textWhite,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
          autofocus: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            counterText: '',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ConstColor.salad100),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ConstColor.salad100),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      );
}
