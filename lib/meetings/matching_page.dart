import 'package:flutter/material.dart';
import 'package:network_app/home_page.dart';
import 'dart:math' as math;

import 'package:network_app/components/network_icons.dart';
import 'package:network_app/meetings/questions_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final aspectRatio = mediaWidth/mediaHeight>=0.6;



    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 25
                ),
                child: backButton(context),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    profileMini(strName: 'Джоли'),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          width: 0.12*mediaWidth,    //12
                          height: 0.12*mediaWidth,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Network.electric,
                              color: Colors.white,
                            ),
                            iconSize: 18.sp, //17
                          )),
                    ),
                    profileMini(strName: 'Тимофей'),
                  ],
                ),
              ),

              //Нижняя часть
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 16  //16
                ),
                // width: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(30)),
                child: SizedBox(
                  width: 343,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '92% совпадений',
                            style: TextStyle(
                              fontSize: 21.5.sp, //24
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      Container(
                        // width: 274,
                        padding: const EdgeInsets.symmetric(
                            vertical: 23,
                          horizontal: 17
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(31)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              height: 29,
                              width: 138,
                              // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                'Деловая встреча',
                                style: TextStyle(
                                  fontSize: 15.5.sp, //12
                                    color: Colors.white,
                                  fontWeight: FontWeight.w400
                                ),
                              )
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Text(
                                'Баллы за встречу +150',
                                style: TextStyle(
                                    fontSize: 15.5.sp, //12
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),

                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              direction: Axis.horizontal,
                              children: [
                                hobbitsContainer('Большой теннис', isDark: false),
                                hobbitsContainer('Маркетинг', isDark: false),
                                // hobbitsContainer('Управление'),
                                hobbitsContainer('Маркетинг', isDark: false),
                                hobbitsContainer('Большой теннис', isDark: false),
                              ],
                            ),

                          ],
                        ),
                      ),

                      Stack(
                        children: [

                          Positioned(
                              right: 30,
                              top: 0,
                              child: Image.asset('assets/images/lines.png',
                              width: aspectRatio? 70.sp : 0.656*mediaWidth,   //246
                                height: aspectRatio? 100.sp :  0.656*mediaWidth*2.1504,            //529
                              )),

                          Positioned(
                            top: 20,
                            left: 0,
                            child: Text(
                              'Вам необходимо ответить\nна 20 вопросов',
                              style: TextStyle(
                                fontSize: 17.5.sp, //16
                                // fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.only(
                                top: 0.266*mediaWidth    //100
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(right: 0.04*mediaWidth),    //15
                                  child: Column(
                                    children: [
                                      questionContainer(
                                        align: 0,
                                        text: 'Какой-нибудь вопрос?',
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaWidth*0.1733  //65
                                        ),
                                        child: questionContainer(
                                            align: -math.pi / 20,
                                            text:
                                                'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaWidth*0.1866   //70
                                        ),
                                        child: questionContainer(
                                            align: -math.pi / 20,
                                            text:
                                                'Зададим вопрос по-сложнее??))))'),
                                      ),
                                    ],
                                  ),
                                ),

                                /////////////////////////////////////////////////

                                Padding(
                                  padding: EdgeInsets.only(left: 0.04*mediaWidth),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaWidth*0.12  //45
                                        ),
                                        child: questionContainer(
                                          align: 0,
                                          text:
                                              'Зададим вопрос по-сложнее??))))',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaWidth*0.0533  //20
                                        ),
                                        child: questionContainer(
                                            align: math.pi / 25,
                                            text: 'Какой-нибудь вопрос?'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: mediaWidth*0.2133 //80
                                        ),
                                        child: questionContainer(
                                            align: 0,
                                            text: 'Какой-нибудь вопрос?'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 23),
                child: Center(
                  child: SizedBox(
                    height: mediaWidth*0.1413,   //53
                    child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 0.096*mediaWidth      //36
                              )),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(52),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const QuestionsPage()));
                        },
                        child: Text(
                          // 'Создать чат',
                          'Начать с 1-го вопроса',
                          style: TextStyle(
                              fontSize: 17.5.sp, //16
                            fontWeight: FontWeight.w500
                          ),
                        )),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget questionContainer({required String text, required double align}) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    // final contSize = mediaWidth*0.4026;  //151

    final aspectRatio = mediaWidth/mediaHeight>=0.6;

    final contSize = aspectRatio? mediaWidth*0.35 : mediaWidth*0.4026;  //151

    return Transform.rotate(
        angle: align,
        child: Container(
          padding: EdgeInsets.all(0.0266*mediaWidth),    //10
          width: contSize,
          height: contSize*0.74,      //112
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(22)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize:  aspectRatio? 14.5.sp : 15.5.sp, //12
                  fontWeight: FontWeight.w500,
                overflow: TextOverflow.visible

              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
  }

  Widget profileMini({required String strName}) {

    final mediaWidth = MediaQuery.of(context).size.width;

    final contWidth = mediaWidth*0.328; //123

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: contWidth,
            height: contWidth*0.935,  //115
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$strName, 28',
                    style: TextStyle(
                        fontSize: 17.5.sp, //16
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),

                Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 2),
                  child: Icon(
                    Icons.verified,
                    color: Colors.black,
                    size: 17.sp, //14
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Уровень "Базовый"',
              style: TextStyle(
                  fontSize: 15.5.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );
  }
}
