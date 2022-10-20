import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _activeProfileTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeProfileTab = position;
          });
        }),
        child: BlurryContainer(
          blur: 10,
          color: ConstColor.halfWhite,
          borderRadius: BorderRadius.circular(20),
          // height: 56,
          padding: EdgeInsets.symmetric(
              // vertical: mediaHeight*0.02635, //19
              vertical: 18.5.sp, //19
              horizontal: 14.5.sp //13
              ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _activeProfileTab == position
                  ? Icon(
                      Network.person,
                      size: 18.5.sp, //18
                      color: Colors.white,
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  _activeProfileTab == position
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 19.sp, //20
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    // final double sheetHeight = mediaHeight * 0.15;  //147
    // final mediaRadius = mediaWidth*0.45;
    final mediaRadius = 60.sp;

    final double contWidth = mediaWidth; //375
    // final double contWidth = 84.sp;   //375
    final double contHeight = contWidth * 0.392;

    final double sheetHeightMinus = -contHeight * 0.1156; //-17

    final double padLeft = 17.5.sp; //16

    // final _aspectRatio = mediaWidth>400 && mediaHeight<690;
    final aspectRatio = mediaWidth / mediaHeight >= 0.6;

    return Scaffold(
        extendBody: true,
        backgroundColor: ConstColor.blackBack,
        body: Stack(
          children: [


            // Padding(
            //   padding: const EdgeInsets.only(top: 100),
            //   child: Group368Widget(),
            // ),

            Positioned(
                top: mediaHeight * 0.03,
                right: 0,
                child: Image.asset('assets/images/circles/ellipse_4.png')),

            Positioned(
                top: mediaHeight * 0.15,
                left: 0,
                child: Image.asset('assets/images/circles/ellipse_2.png')),

            //Большой чел справа
            _activeProfileTab != 1
                ? Container()
                : Positioned(
                    // top: mediaHeight*0.21,
                    top: 55.sp,
                    right: 0,
                    child: Image.asset(
                      'assets/images/avatars/avatar_3D.png',
                      height: 575,
                    )),

            //Основное
            Padding(
              padding: EdgeInsets.only(top: mediaTop),
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _activeProfileTab != 2
                            ? Container()
                            : Padding(
                                padding:
                                    EdgeInsets.only(left: padLeft, top: 8.0),
                                child: const Text(
                                  'Профиль',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ),

                        //Верхняя часть профиля
                        _activeProfileTab != 1
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(left: padLeft),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //ава
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Container(
                                        padding: const EdgeInsets.all(1),
                                        width: 34.sp, //58
                                        height: 34.sp, //58
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/1.png')),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // child: Image.asset('assets/images/1.png', fit: BoxFit.fill,),
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Тимофей, 37',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp, //18
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 9),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(69),
                                                  color: ConstColor.halfWhite),
                                              child: Center(
                                                  child: Text(
                                                'я люблю веселиться 😁',
                                                style: TextStyle(
                                                    fontSize: 15.5.sp, //12
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                        //Выбор интерфейса
                        Padding(
                          padding: EdgeInsets.only(
                            left: padLeft,
                            top: 19.sp, //20
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                miniContainer(position: 1, text: 'Профиль'),
                                miniContainer(position: 2, text: 'Шкаф'),
                                miniContainer(position: 3, text: 'Встречи'),
                              ],
                            ),
                          ),
                        ),

                        //Нижняя часть профиля
                        _activeProfileTab != 1
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(
                                    // top: 0.043*mediaHeight,  //31
                                    top: 22.sp, //31
                                    left: padLeft),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Имя аватара',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.5.sp, //26
                                          fontWeight: FontWeight.w700),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        'Базовый уровень',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.5.sp, //14
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),

                                    //Готов к встрече
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 0.05687 * mediaHeight), //41
                                      child: Container(
                                        // width: 173,
                                        // height: 56,
                                        padding: EdgeInsets.symmetric(
                                            // vertical: mediaHeight*0.02774  //20
                                            vertical: 19.sp //20
                                            ),
                                        // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: ConstColor.salad90,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          // border: Border.all(width: _activeProfileTab == position ? 2 : 0)
                                        ),

                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.5.sp //14
                                                  ),
                                              child: Icon(
                                                Network.check_thin,
                                                size: 16.5.sp, //14
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.5.sp, //12
                                                  right: 19.sp //20
                                                  ),
                                              child: Text(
                                                'Готов к встрече',
                                                style: TextStyle(
                                                    color: ConstColor.darkSalad,
                                                    fontSize: 16.5.sp, //14
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          // top: 0.0693*mediaHeight
                                          top: aspectRatio ? 15 : 30.sp), //50
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          statContainer(
                                              context: context,
                                              title: '9.4k',
                                              subtitle: 'баллов'),
                                          statContainer(
                                              context: context,
                                              title: '23',
                                              subtitle: 'встречи'),
                                          statContainer(
                                              context: context,
                                              title: '4.5',
                                              subtitle: 'рейтинг'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                        /////////////////////////////////////

                        _activeProfileTab != 2
                            ? Container()
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 156),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 21),
                                        child: Text(
                                          'Шкаф пустой',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19.5.sp, //22
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Text(
                                        'Посетите магазин, чтобы купить новые\nпредметы для своего персонажа',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp, //16
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 59),
                                        child: InkWell(
                                          onTap: (() {
                                            // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const RecoveryEmailPage()));
                                          }),
                                          child: Container(
                                            // width: MediaQuery.of(context).size.width*0.8,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 36, vertical: 17),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(52),
                                            ),
                                            child: Text(
                                              'Посетить магазин',
                                              style: TextStyle(
                                                  fontSize: 17.sp, //16
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // Stack(
        //   children: [
        //
        //     //круг сверху
        //     Positioned(
        //         top: -mediaRadius*0.05,
        //         right: -mediaRadius*0.22,
        //         child:
        //         blurCircle(
        //           radius: mediaRadius,
        //           sigma: 0,
        //         )
        //     ),
        //
        //     //круг внизу
        //     Positioned(
        //         top: mediaHeight*0.43,
        //         left: -mediaRadius*0.85,
        //         child:
        //         blurCircle(
        //           radius: mediaRadius,
        //           sigma: mediaRadius * 0.33,
        //           // sigma: 0,
        //         )
        //     ),
        //
        //     //Большой чел справа
        //     _activeProfileTab !=1? Container():
        //     Positioned(
        //         // top: mediaHeight*0.21,
        //         top: 55.sp,
        //         right: 0,
        //         child: Image.asset('assets/images/2.png',
        //           height: 575,
        //         )
        //     ),
        //
        //     //Основное
        //     Padding(
        //       padding: EdgeInsets.only(top: mediaTop),
        //       child: SizedBox(
        //         height: double.infinity,
        //         child: SingleChildScrollView(
        //           child: Padding(
        //             padding: const EdgeInsets.only(top: 10),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 _activeProfileTab != 2
        //                     ? Container()
        //                     : Padding(
        //                   padding: EdgeInsets.only(
        //                       left: padLeft,
        //                       top: 8.0
        //                   ),
        //                   child: const Text(
        //                     'Профиль',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 26,
        //                         fontWeight: FontWeight.bold),
        //                     textAlign: TextAlign.start,
        //                   ),
        //                 ),
        //
        //
        //                 //Верхняя часть профиля
        //                 _activeProfileTab != 1
        //                     ? Container()
        //                     :
        //                 Padding(
        //                   padding: EdgeInsets.only(
        //                       left: padLeft
        //                   ),
        //                   child: Row(
        //                     crossAxisAlignment:
        //                     CrossAxisAlignment.center,
        //                     children: [
        //
        //                       //ава
        //                       Padding(
        //                         padding:
        //                         const EdgeInsets.only(right: 20),
        //                         child: Container(
        //                           padding: const EdgeInsets.all(1),
        //                           width: 34.sp,    //58
        //                           height: 34.sp,   //58
        //                           decoration: BoxDecoration(
        //                             image: const DecorationImage(
        //                                 image: AssetImage('assets/images/1.png')
        //                             ),
        //                             borderRadius:
        //                             BorderRadius.circular(15),
        //                           ),
        //                           // child: Image.asset('assets/images/1.png', fit: BoxFit.fill,),
        //                         ),
        //                       ),
        //
        //                       Column(
        //                         crossAxisAlignment:
        //                         CrossAxisAlignment.start,
        //                         children: [
        //                           Text(
        //                             'Тимофей, 37',
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontSize: 18.sp,   //18
        //                                 fontWeight: FontWeight.w700),
        //                           ),
        //                           Padding(
        //                             padding:
        //                             const EdgeInsets.only(top: 7),
        //                             child: Container(
        //                                 padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                     BorderRadius.circular(69),
        //                                     color: ConstColor
        //                                         .halfWhite),
        //                                 child: Center(
        //                                     child: Text(
        //                                       'я люблю веселиться 😁',
        //                                       style: TextStyle(
        //                                           fontSize: 15.5.sp,   //12
        //                                           fontWeight: FontWeight.w400,
        //                                           color: Colors.white
        //                                       ),
        //                                     ))),
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //
        //                 //Выбор интерфейса
        //                 Padding(
        //                   padding: EdgeInsets.only(
        //                     left: padLeft,
        //                     top: 19.sp, //20
        //                   ),
        //                   child: SingleChildScrollView(
        //                     scrollDirection: Axis.horizontal,
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: [
        //                         miniContainer(position: 1, text: 'Профиль'),
        //                         miniContainer(position: 2, text: 'Шкаф'),
        //                         miniContainer(position: 3, text: 'Встречи'),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //
        //                 //Нижняя часть профиля
        //                 _activeProfileTab != 1
        //                     ? Container()
        //                     : Padding(
        //                   padding: EdgeInsets.only(
        //                       // top: 0.043*mediaHeight,  //31
        //                       top: 22.sp,  //31
        //                       left: padLeft
        //                   ),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Имя аватара',
        //                         style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 22.5.sp,   //26
        //                             fontWeight: FontWeight.w700),
        //                       ),
        //
        //                       Padding(
        //                         padding: const EdgeInsets.only(
        //                             top: 12),
        //                         child: Text(
        //                           'Базовый уровень',
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 16.5.sp,     //14
        //                               fontWeight: FontWeight.w400),
        //                         ),
        //                       ),
        //
        //                       //Готов к встрече
        //                       Padding(
        //                         padding: EdgeInsets.only(top: 0.05687*mediaHeight), //41
        //                         child:
        //                         Container(
        //                           // width: 173,
        //                           // height: 56,
        //                           padding: EdgeInsets.symmetric(
        //                               // vertical: mediaHeight*0.02774  //20
        //                               vertical: 19.sp  //20
        //                           ),
        //                           // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        //                           decoration: BoxDecoration(
        //                             color: ConstColor.salad90,
        //                             borderRadius: BorderRadius.circular(25),
        //                             // border: Border.all(width: _activeProfileTab == position ? 2 : 0)
        //                           ),
        //
        //                           child: Row(
        //                             mainAxisSize: MainAxisSize.min,
        //                             crossAxisAlignment: CrossAxisAlignment.center,
        //                             // mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //
        //                               Padding(
        //                                 padding: EdgeInsets.only(
        //                                     left: 16.5.sp  //14
        //                                 ),
        //                                 child: Icon(
        //                                   Network.check_thin,
        //                                   size: 16.5.sp,   //14
        //                                   color: Colors.black,),
        //                               ),
        //
        //                               Padding(
        //                                 padding: EdgeInsets.only(
        //                                     left: 15.5.sp,  //12
        //                                     right: 19.sp  //20
        //                                 ),
        //                                 child: Text(
        //                                   'Готов к встрече',
        //                                   style: TextStyle(
        //                                       color: ConstColor.darkSalad,
        //                                       fontSize: 16.5.sp,   //14
        //                                       fontWeight: FontWeight.w500
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //
        //                       Padding(
        //                         padding: EdgeInsets.only(
        //                             // top: 0.0693*mediaHeight
        //                             top: aspectRatio? 15 : 30.sp
        //                         ),  //50
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                           children: [
        //
        //                             statContainer(
        //                                 context: context,
        //                                 title: '9.4k',
        //                                 subtitle: 'баллов'
        //                             ),
        //
        //                             statContainer(
        //                                 context: context,
        //                                 title: '23', subtitle: 'встречи'),
        //
        //                             statContainer(
        //                                 context: context,
        //                                 title: '4.5', subtitle: 'рейтинг'),
        //
        //                           ],
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //
        //                 /////////////////////////////////////
        //
        //                 _activeProfileTab != 2
        //                     ? Container()
        //                     : Center(
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(top: 156),
        //                     child: Column(
        //                       // crossAxisAlignment: CrossAxisAlignment.center,
        //                       // mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         Padding(
        //                           padding: const EdgeInsets.only(bottom: 21),
        //                           child: Text(
        //                             'Шкаф пустой',
        //                             textAlign: TextAlign.center,
        //                             style: TextStyle(
        //                                 color: Colors.white,
        //                                 fontSize: 19.5.sp, //22
        //                                 fontWeight: FontWeight.w700),
        //                           ),
        //                         ),
        //
        //                         Text(
        //                           'Посетите магазин, чтобы купить новые\nпредметы для своего персонажа',
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 17.sp, //16
        //                               fontWeight: FontWeight.w400),
        //                         ),
        //
        //                         Padding(
        //                           padding: const EdgeInsets.only(top: 59),
        //                           child: InkWell(
        //                             onTap: (() {
        //                               // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const RecoveryEmailPage()));
        //                             }),
        //                             child: Container(
        //                               // width: MediaQuery.of(context).size.width*0.8,
        //                               padding: const EdgeInsets.symmetric(
        //                                   horizontal: 36,
        //                                   vertical: 17
        //                               ),
        //                               decoration: BoxDecoration(
        //                                 color: Colors.white,
        //                                 borderRadius:
        //                                 BorderRadius.circular(52),
        //                               ),
        //                               child: Text(
        //                                 'Посетить магазин',
        //                                 style: TextStyle(
        //                                     fontSize: 17.sp, //16
        //                                     color: Colors.black,
        //                                     fontWeight: FontWeight.w500),
        //                                 textAlign: TextAlign.center,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //
        //
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //
        //   ],
        // ),

        bottomNavigationBar: _activeProfileTab != 1
            ? Container()
            : Group368Widget()

            // : Container(
            //     // height: contHeight,
            //     alignment: Alignment.bottomCenter,
            //     color: Colors.transparent,
            //     child: InkWell(
            //       onTap: (() {
            //         openBottomSheetProfile();
            //       }),
            //       child:
            //       Group368Widget()
            //
            //       // Stack(
            //       //   alignment: Alignment.bottomCenter,
            //       //   children: [
            //       //
            //       //
            //       //     Positioned(
            //       //       bottom: sheetHeightMinus,
            //       //       child:  Group368Widget()
            //       //     ),
            //       //
            //       //
            //       //     // Positioned(
            //       //     //   bottom: sheetHeightMinus,
            //       //     //   child: BlurryContainer(
            //       //     //     blur: 20,
            //       //     //     child: CustomPaint(
            //       //     //       size: Size(contWidth, contHeight),
            //       //     //       painter: Test(),
            //       //     //     ),
            //       //     //   ),
            //       //     // ),
            //       //
            //       //     // Positioned(
            //       //     //     bottom: sheetHeightMinus,
            //       //     //     child: BlurryContainer(
            //       //     //       blur: 30,
            //       //     //       child: Image.asset(
            //       //     //         'assets/images/test3.png',
            //       //     //         width: contWidth,
            //       //     //         // height: contHeight,
            //       //     //         fit: BoxFit.fitWidth,
            //       //     //       ),
            //       //     //     )),
            //       //
            //       //     // Positioned(
            //       //     //   bottom: sheetHeightMinus,
            //       //     //   child: CustomPaint(
            //       //     //     // size: Size(375, 147),
            //       //     //     size: Size(contWidth, contHeight),
            //       //     //     painter: RPSCustomPainter(),
            //       //     //   ),
            //       //     // ),
            //       //
            //       //   ],
            //       // ),
            //
            //     ),
            //   )



    );


  }

  void openBottomSheetProfile() {
    showModalBottomSheet<void>(
        // elevation: 5,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) => GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.9,
                // color: Colors.grey.shade100,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: Center(
                          child: Container(
                            // alignment: Alignment.center,
                            width: 35,
                            height: 4,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      titleStatText('Уровень Базовый'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          progressParametr(
                              context: context,
                              text1: '5 встреч',
                              text2: 'Еще 25 встреч',
                              progress: 0.25,
                              isMeetingRow: true),
                          titleStatText('Статистика'),
                          progressParametr(
                              context: context,
                              text1: 'Энергии на встречи',
                              text2: '3/5'),
                          progressParametr(
                              context: context,
                              text1: 'Скорость восстановления',
                              text2: 'x1.5'),
                          progressParametr(
                              context: context,
                              text1: 'Баллы за встречи',
                              text2: '150'),
                          progressParametr(
                              context: context,
                              text1: 'Количество сообщений в день',
                              text2: '200'),
                          progressParametr(
                              context: context,
                              text1: 'Количество лайков в день',
                              text2: '50'),
                        ],
                      ),
                      titleStatText('Статус'),
                      textField('Sed aenean est eget sit eget at tellus sed.'),
                      titleStatText('Интересы'),
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
                        ],
                      ),
                      titleStatText('Обо мне'),
                      textField(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),
                      titleStatText('Сфера деятельности'),
                      textField(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
                      titleStatText('Пол'),
                      const RadioList(
                        listOptions: ['Мужчина', 'Женщина'],
                      ),
                      titleStatText('Возраст'),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              '37 лет',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.sp), //14
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Network.check_circle_outlined,
                              // Icons.check_circle,
                              color: Colors.grey.shade800,
                              size: 18.sp, //18
                            ),
                          ),
                          Text(
                            'Скрыть возраст',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp), //14
                          ),
                        ],
                      ),
                      titleStatText('Семейное положение'),
                      const RadioList(
                        listOptions: [
                          'Женат',
                          'Холост',
                          'Свободен',
                          'В поиске'
                        ],
                      ),
                      titleStatText('Цель встречи'),
                      const RadioList(
                        listOptions: ['Деловая', 'Общение', 'Свидание'],
                      ),
                      titleStatText(
                          'Готов ли знакомиться с противоположным полом'),
                      const RadioList(
                        listOptions: [
                          'Да',
                          'Нет',
                        ],
                      ),
                      titleStatText('Какие критерии?'),
                      const RadioList(
                        listOptions: [
                          'Да',
                          'Нет',
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

Widget viewProdImage(BuildContext context, {bool isHat = false}) {
  final mediaWidth = MediaQuery.of(context).size.width;
  final imageWidth = 0.624 * mediaWidth;

  return Container(
    width: mediaWidth,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: backButton(context),
        ),
        Container(
          width: imageWidth, //234
          height: 0.9359 * imageWidth, //219
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(17)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            isHat ? 'Головной убор' : 'Аватар',
            style: TextStyle(
                fontSize: 15.sp, //12
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            isHat ? '#0863246' : 'Имя аватара',
            style: TextStyle(
                fontSize: 24.sp, //32
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 38),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Категория',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16.sp, //14
                    fontWeight: FontWeight.w600),
              )),
        ),
      ],
    ),
  );
}

class RadioList extends StatefulWidget {
  final List<String> listOptions;
  const RadioList({Key? key, required this.listOptions}) : super(key: key);

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  dynamic groupValue;

  @override
  void initState() {
    groupValue = widget.listOptions.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-10, 0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 5,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.listOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity, vertical: -4),
                activeColor: Colors.grey.shade600,
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: Text(
                      widget.listOptions[index],
                      style: TextStyle(
                          fontSize: 16.8.sp, //14
                          fontWeight: FontWeight.w400),
                    )),
                value: widget.listOptions[index],
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                });
          }),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3462320, size.height * 0.1081347);
    path_0.cubicTo(size.width * 0.3149147, size.height * 0.05157810,
        size.width * 0.2799547, 0, size.width * 0.2415829, 0);
    path_0.lineTo(size.width * 0.08000000, 0);
    path_0.cubicTo(size.width * 0.03581733, 0, 0, size.height * 0.09137075, 0,
        size.height * 0.2040816);
    path_0.lineTo(0, size.height * 4.578231);
    path_0.cubicTo(
        0,
        size.height * 4.690946,
        size.width * 0.03581733,
        size.height * 4.782313,
        size.width * 0.08000000,
        size.height * 4.782313);
    path_0.lineTo(size.width * 0.9200000, size.height * 4.782313);
    path_0.cubicTo(size.width * 0.9641840, size.height * 4.782313, size.width,
        size.height * 4.690946, size.width, size.height * 4.578231);
    path_0.lineTo(size.width, size.height * 0.2040816);
    path_0.cubicTo(size.width, size.height * 0.09137075, size.width * 0.9641840,
        0, size.width * 0.9200000, 0);
    path_0.lineTo(size.width * 0.7557493, 0);
    path_0.cubicTo(
        size.width * 0.7173787,
        0,
        size.width * 0.6824187,
        size.height * 0.05157810,
        size.width * 0.6511013,
        size.height * 0.1081347);
    path_0.cubicTo(
        size.width * 0.6111200,
        size.height * 0.1803361,
        size.width * 0.5575467,
        size.height * 0.2244898,
        size.width * 0.4986667,
        size.height * 0.2244898);
    path_0.cubicTo(
        size.width * 0.4397867,
        size.height * 0.2244898,
        size.width * 0.3862133,
        size.height * 0.1803361,
        size.width * 0.3462320,
        size.height * 0.1081347);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = ConstColor.halfWhite;
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01333333;
    paint1Stroke.color = ConstColor.salad100;
    paint1Stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width * 0.4533333, size.height * 0.01700680),
        Offset(size.width * 0.5466987, size.height * 0.01700680), paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ContainerForBlur extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3462320, size.height * 0.1081347);
    path_0.cubicTo(size.width * 0.3149147, size.height * 0.05157810,
        size.width * 0.2799547, 0, size.width * 0.2415829, 0);
    path_0.lineTo(size.width * 0.08000000, 0);
    path_0.cubicTo(size.width * 0.03581733, 0, 0, size.height * 0.09137075, 0,
        size.height * 0.2040816);
    path_0.lineTo(0, size.height * 4.578231);
    path_0.cubicTo(
        0,
        size.height * 4.690946,
        size.width * 0.03581733,
        size.height * 4.782313,
        size.width * 0.08000000,
        size.height * 4.782313);
    path_0.lineTo(size.width * 0.9200000, size.height * 4.782313);
    path_0.cubicTo(size.width * 0.9641840, size.height * 4.782313, size.width,
        size.height * 4.690946, size.width, size.height * 4.578231);
    path_0.lineTo(size.width, size.height * 0.2040816);
    path_0.cubicTo(size.width, size.height * 0.09137075, size.width * 0.9641840,
        0, size.width * 0.9200000, 0);
    path_0.lineTo(size.width * 0.7557493, 0);
    path_0.cubicTo(
        size.width * 0.7173787,
        0,
        size.width * 0.6824187,
        size.height * 0.05157810,
        size.width * 0.6511013,
        size.height * 0.1081347);
    path_0.cubicTo(
        size.width * 0.6111200,
        size.height * 0.1803361,
        size.width * 0.5575467,
        size.height * 0.2244898,
        size.width * 0.4986667,
        size.height * 0.2244898);
    path_0.cubicTo(
        size.width * 0.4397867,
        size.height * 0.2244898,
        size.width * 0.3862133,
        size.height * 0.1803361,
        size.width * 0.3462320,
        size.height * 0.1081347);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class Test extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(134.818, 7.53286);
    path_0.cubicTo(128.326, 3.25591, 121.005, 0, 113.231, 0);
    path_0.lineTo(30, 0);
    path_0.cubicTo(13.4315, 0, 0, 13.4315, 0, 30);
    path_0.lineTo(0, 673);
    path_0.cubicTo(0, 689.569, 13.4315, 703, 30, 703);
    path_0.lineTo(345, 703);
    path_0.cubicTo(361.569, 703, 375, 689.569, 375, 673);
    path_0.lineTo(375, 30);
    path_0.cubicTo(375, 13.4315, 361.569, 0, 345, 0);
    path_0.lineTo(260.769, 0);
    path_0.cubicTo(252.995, 0, 245.674, 3.25591, 239.182, 7.53285);
    path_0.cubicTo(225.569, 16.5014, 207.205, 22, 187, 22);
    path_0.cubicTo(166.795, 22, 148.431, 16.5014, 134.818, 7.53286);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.red;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}







// class Group368Widget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Figma Flutter Generator Group368Widget - GROUP
//     return Container(
//         width: 375,
//         height: 787,
//
//         child: Stack(
//             children: <Widget>[
//               Positioned(
//                   top: 84,
//                   left: 0,
//                   child: Container(
//                       width: 375,
//                       height: 703,
//                       decoration: BoxDecoration(
//                         borderRadius : BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30),
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30),
//                         ),
//                         color : Color.fromRGBO(255, 255, 255, 1),
//                       )
//                   )
//               ),Positioned(
//                   top: 0,
//                   left: 111,
//                   child: Container(
//                       width: 152,
//                       height: 106,
//                       decoration: BoxDecoration(
//                         color : Color.fromRGBO(217, 217, 217, 1),
//                         borderRadius : BorderRadius.all(Radius.elliptical(152, 106)),
//                       )
//                   )
//               ),
//             ]
//         )
//     );
//   }
// }




class Group368Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group368Widget - GROUP
    return Container(
        width: 375,
        height: 300,

        child: Stack(
          alignment: Alignment.center,
            children: <Widget>[

              Positioned(
                  top: 84,
                  // left: 0,
                  child: Container(
                      width: 375,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.circular(30),
                        color : Colors.red,
                      )
                  )
              ),

              Positioned(
                  top: 0,
                  // left: 111,
                  child: Container(
                      width: 152,
                      height: 106,
                      decoration: BoxDecoration(
                        color : Colors.blue,
                        borderRadius : BorderRadius.all(Radius.elliptical(152, 106)),
                      )
                  )
              ),

              Positioned(
                  top: 91,
                  // left: 167.5,
                  child:
                  Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        color : ConstColor.salad100,
                        borderRadius : BorderRadius.circular(20),
                      )
                  )

              ),


            ]
        )
    );
  }
}
