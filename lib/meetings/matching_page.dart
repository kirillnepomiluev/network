import 'package:flutter/material.dart';
import 'package:network_app/profile/home_page.dart';
import 'dart:math' as math;

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        // bottomNavigationBar: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.all(20),
        //     child:
        //     ElevatedButton(
        //         style: ButtonStyle(
        //           padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
        //           backgroundColor: MaterialStateProperty.all(Colors.black),
        //           shape: MaterialStateProperty.all(
        //             RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //           ),
        //         ),
        //         onPressed: (){},
        //         child: Text('Создать чат')
        //     ),
        //   ),
        // ),
        extendBody: true,
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child:
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 25),
                  child: buttonBack(context),
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
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          width: 45,
                          height: 45,
                          child:
                          IconButton(onPressed: (){}, icon: const Icon(Icons.electric_bolt_sharp, color: Colors.white,), iconSize: 18,)
                      ),
                    ),

                      profileMini(strName: 'Тимофей'),

                    ],),
                ),


                //Нижняя часть
                Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child:

                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('92% совпадений', style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15)
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                width: 120,
                                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade500,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: const Center(child:
                                Text('Деловая встреча', style: TextStyle(color: Colors.white, fontSize: 10),)
                                ),
                              ),
                            ),

                            Wrap(
                              spacing: 8,
                              runSpacing: 10,
                              direction: Axis.horizontal,
                              children: [
                                hobbitsContainer('Большой теннис'),
                                hobbitsContainer('Маркетинг'),
                                hobbitsContainer('Управление'),
                                hobbitsContainer('Маркетинг'),
                                hobbitsContainer('Большой теннис'),

                              ],),
                          ],
                        ),
                      ),


                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Вам необходимо ответить\nна 20 вопросов', style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(children: [

                              questionContainer(
                                align: 0,
                                text: 'Какой-нибудь вопрос?',
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 65),
                                child: questionContainer(
                                    align: - math.pi / 20,
                                    text: 'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: questionContainer(
                                    align: - math.pi / 20,
                                    text: 'Зададим вопрос по-сложнее??))))'
                                ),
                              ),

                            ],),
                          ),

                            /////////////////////////////////////////////////

                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                Padding(
                                  padding: const EdgeInsets.only(top: 45),
                                  child: questionContainer(
                                    align: 0,
                                    text: 'Зададим вопрос по-сложнее??))))',
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: questionContainer(
                                      align: math.pi / 25,
                                      text: 'Какой-нибудь вопрос?'
                                  ),
                                ),


                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: questionContainer(
                                        align: 0,
                                        text: 'Какой-нибудь вопрос?'
                                    ),
                                  ),


                              ],),
                            )



                          ],),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child:
                        Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              onPressed: (){},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 35),
                                child: Text('Создать чат', style: TextStyle(fontSize: 18),),
                              )
                          ),
                        ),
                      ),


                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10, left: 0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.black,
                      //         borderRadius: BorderRadius.circular(30)
                      //     ),
                      //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      //     // alignment: Alignment.topLeft,
                      //     // width: 73,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: const [
                      //         Icon(Icons.circle, color: Colors.greenAccent, size: 8,),
                      //         Padding(
                      //           padding: EdgeInsets.only(left: 4),
                      //           child: Text('Онлайн', style: TextStyle(fontSize: 10, color: Colors.white),),
                      //         )
                      //       ],),),
                      // ),
                    ],
                  ),
                )

              ],
            ),
          ),

        ),
      );
  }


  Widget questionContainer({required String text, required double align}) => Transform.rotate(
    angle: align,
    child: Container(
      padding: const EdgeInsets.all(10),
      width: 140,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15)
      ),
      child:
      Center(child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),),
    ),
  );


  Widget profileMini({required String strName}) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 120,
        height: 105,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [

            Text('$strName, 28',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                )
            ),

            const Padding(
              padding: EdgeInsets.only(left: 3),
              child: Icon(Icons.verified, color: Colors.black, size: 14,),
            ),

          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text('Уровень "Базовый"', style: TextStyle(fontSize: 11, color: Colors.grey.shade600, fontWeight: FontWeight.w500),),
      ),

    ],);

}