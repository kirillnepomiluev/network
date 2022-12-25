import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/questions_page.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllQuestionsPage extends StatefulWidget {
  const AllQuestionsPage({Key? key}) : super(key: key);

  @override
  State<AllQuestionsPage> createState() => _AllQuestionsPageState();
}

class _AllQuestionsPageState extends State<AllQuestionsPage> {
  @override
  Widget build(BuildContext context) {

    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Padding(
                  padding:
                  EdgeInsets.only(
                    top: 10,
                  ),
                  child: BackButtonCustom(),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: BuildRichTextTwo(
                    text1: 'Вам необходимо ответить\nна ',
                    text2: '10 вопросов',
                  ),
                ),

                //Начать с 1-го вопроса
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: buttonStyleCustom(
                            radius: 20,
                            padV: 26
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const QuestionsPage()));
                        },
                        child: Text(
                          'Начать с 1-го вопроса',
                          style: TextStyle(
                              color: ConstColor.textBlack,
                              fontSize: 17.5.sp, //16
                              fontWeight: FontWeight.w500
                          ),
                        )),
                  ),
                ),

                //Нижняя часть
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child:
                  Wrap(
                    // runAlignment: WrapAlignment.spaceBetween,
                    // alignment: WrapAlignment.spaceBetween,
                    spacing: mediaWidth*0.08,
                    runSpacing: 22,
                    children: [

                      for(final item in questionsList)
                        questionContainer(
                          text: item,
                        ),

                    ],),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> questionsList = [
    'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    'Зададим вопрос по-сложнее?))))',
  ];

  Widget questionContainer({required String text}) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = mediaWidth*0.42;

    return Container(
      padding: EdgeInsets.all(0.0266*mediaWidth),    //10
      width: contSize,
      height: contSize*0.74,      //112
      decoration: BoxDecoration(
          color: ConstColor.white10,
          borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 12, //12
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible

          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }


  // Widget profileMini({required String strName, int avatarNumb = 0}) {
  //
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //
  //       CustomCircleAvatar(
  //         imageUrl: 'assets/images/avatars/avatar_$avatarNumb.png',
  //         contSize: 120,
  //       ),
  //
  //       Padding(
  //         padding: const EdgeInsets.only(top: 20),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text('$strName, 28',
  //                 style: TextStyle(
  //                     fontSize: 17.5.sp, //16
  //                     // color: ConstColor.textWhite,
  //                     fontWeight: FontWeight.w400
  //                 )),
  //
  //             Padding(
  //               padding: const EdgeInsets.only(left: 6, bottom: 2),
  //               child: Icon(
  //                 Icons.verified,
  //                 color: ConstColor.salad100,
  //                 size: 17.sp, //14
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       Padding(
  //         padding: const EdgeInsets.only(top: 5),
  //         child: Text(
  //           'Уровень "Базовый"',
  //           style: TextStyle(
  //               fontSize: 15.5.sp,
  //               // color: ConstColor.textWhite,
  //               fontWeight: FontWeight.w400
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

}
