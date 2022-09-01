import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/profile/home_page.dart';
import 'dart:ui' as ui;
import 'package:blurrycontainer/blurrycontainer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

Widget blurContainer({double sigma = 10, double width=double.infinity, double height = double.infinity, required Widget child}) => SizedBox(
  width: width,
  height: height,
  child: Stack(children: [
    child,
    BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
      ),
      child: Container(
      ),
    ),
  ],),
);



Widget blurCircle({double sigma = 55, double radius = 271}) => SizedBox(
  width: radius,
  height: radius,
  child: Stack(children: [
    Container(
      decoration: const BoxDecoration(
        color: ConstColor.salad100,
        shape: BoxShape.circle,
      ),
      child: const Center(child: Text('фывфывф', style: TextStyle(color: Colors.black),)),
    ),

    BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
      ),
      child: Container(
      ),
    ),

  ],),
);



class _ProfilePageState extends State<ProfilePage> {
  int _activeProfileTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) =>
      Padding(
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
            // width: 140,
            height: 56,
            // padding: EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            // decoration: BoxDecoration(
            //     color: ConstColor.halfWhite,
            //     borderRadius: BorderRadius.circular(20),
            //     // border: Border.all(width: _activeProfileTab == position ? 2 : 0)
            //   ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                _activeProfileTab==position?
                    const Icon(Network.person, size: 20, color: Colors.white,)
                : Container(),

                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                        fontSize: 14,
                      fontWeight: FontWeight.w500

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Icon(_activeProfileTab == position
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );


  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWitdh = MediaQuery.of(context).size.width;
    print('mediaWitdh - $mediaWitdh  mediaHeight - $mediaHeight');

    final double sheetHeight = mediaHeight * 0.15;  //147
    final mediaRadius = MediaQuery.of(context).size.width*0.45;

    return Scaffold(
        extendBody: true,
        backgroundColor: ConstColor.blackBack,
        body: Stack(
          children: [
            // Container(
            //   color: ConstColor.darkSalad.withOpacity(0.4),
            //   // color: Colors.black.withOpacity(0.9),
            // ),

            Positioned(
            top: -mediaRadius*0.05,
            right: -mediaRadius*0.22,
              child:
              blurCircle(
                radius: mediaRadius,
                sigma: 0,
              )
            ),

            Positioned(
                top: mediaHeight*0.43,
                left: -mediaRadius*0.85,
                child:
                blurCircle(
                  radius: mediaRadius,
                  sigma: mediaRadius * 0.33,
                  // sigma: 0,
                )
            ),

            _activeProfileTab !=1? Container():
            Positioned(
              top: 175,
              // top: mediaHeight*0.2,
                right: 0,
                child: Image.asset('assets/images/2.png')
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _activeProfileTab != 2
                            ? Container()
                            : const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
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
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Container(
                                          padding: const EdgeInsets.all(1),
                                          width: 58,
                                          height: 58,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage('assets/images/1.png')
                                            ),
                                            // image: Image.asset('assets/images/1.png'),
                                            // color: Colors.white70,
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
                                          const Text(
                                            'Тимофей, 37',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 7),
                                            child: Container(
                                                height: 21,
                                                width: 157,
                                                // padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            69),
                                                    color: ConstColor
                                                        .halfWhite),
                                                child: const Center(
                                                    child: Text(
                                                  'я люблю веселиться 😁',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                        //Выбор интерфейса
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Имя аватара',
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Text(
                                        'Базовый уровень',
                                        style: TextStyle(
                                          color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),

                                    Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child:

                                        Container(
                                          width: 173,
                                          height: 56,
                                          // padding: EdgeInsets.all(5),
                                          // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: ConstColor.salad90,
                                            borderRadius: BorderRadius.circular(25),
                                            // border: Border.all(width: _activeProfileTab == position ? 2 : 0)
                                          ),

                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [

                                              Icon(Icons.check, size: 22, color: Colors.black,),

                                              Padding(
                                                padding: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Готов к встрече',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top: mediaHeight*0.075),  //100
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          statContainer(
                                            width: mediaWitdh*0.25, //107
                                              height: mediaWitdh*0.25*1.5, //162
                                              fontSize: mediaWitdh*0.25<100 ? 22 : 28, //28
                                              title: '9.4k',
                                              subtitle: 'баллов'
                                          ),

                                          statContainer(
                                              width: mediaWitdh*0.25, //107
                                              height: mediaWitdh*0.25*1.5, //162
                                              fontSize: mediaWitdh*0.25<100 ? 22 : 28, //28
                                              title: '23', subtitle: 'встречи'),
                                          statContainer(
                                              width: mediaWitdh*0.25, //107
                                              height: mediaWitdh*0.25*1.5, //162
                                              fontSize: mediaWitdh*0.25<100 ? 22 : 28, //28
                                              title: '4.5', subtitle: 'рейтинг'),
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
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 21),
                                        child: Text(
                                          'Шкаф пустой',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      const Text(
                                        'Посетите магазин, чтобы купить новые\nпредметы для своего персонажа',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
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
                                                horizontal: 36,
                                              vertical: 17
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(52),
                                            ),
                                            child: const Text(
                                              'Посетить магазин',
                                              style: TextStyle(
                                                  fontSize: 16,
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

        bottomNavigationBar:

        SizedBox(
          height: sheetHeight,
          child:
          _activeProfileTab !=1? Container():
          InkWell(
            onTap: (() {
              openBottomSheetProfile();
            }),
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              child:
              CustomPaint(
                size: Size(375, sheetHeight),
                painter: RPSCustomPainter(),
              ),

                // CustomPaint(
                //   size: Size(mediaWitdh, (mediaWitdh*0.392).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                //   painter: RPSCustomPainter(),
                // )

          //     Stack(
          //       alignment: Alignment.center,
          //       children: [
          //
          //         CustomPaint(
          //           size: Size(375, sheetHeight),
          //           painter: RPSCustomPainter(),
          //         ),
          //
          //         Row(
          //           children: [
          //
          //             Expanded(
          //               child: Container(
          //                 height: sheetHeight,
          //                 decoration: BoxDecoration(
          //                     color: ConstColor.halfWhite,
          //                     borderRadius:
          //                     const BorderRadius.only(
          //                         topLeft: Radius.circular(30),
          //                         // topRight: Radius.circular(25)
          //                     )
          //                 ),
          //               ),
          //             ),
          //
          //
          //             Container(
          //               // alignment: Alignment.bottomCenter,
          //               width: 70,
          //               height: sheetHeight,
          //               decoration: BoxDecoration(
          //                   color: ConstColor.halfWhite,
          //                   // color: Colors.red,
          //                   borderRadius:
          //                   const BorderRadius.only(
          //                     topRight: Radius.circular(45)
          //                   )
          //               ),
          //             ),
          //
          //
          //             Expanded(
          //               child: Container(
          //                 // width: MediaQuery.of(context).size.width,
          //                 height: sheetHeight,
          //                 decoration: BoxDecoration(
          //                     color: ConstColor.halfWhite,
          //                     //   color: Colors.red,
          //                     borderRadius:
          //                     // BorderRadius.vertical(top: Radius.circular(35))
          //                     const BorderRadius.only(
          //                         // topLeft: Radius.circular(25),
          //                         topRight: Radius.circular(30)
          //                     )
          //                 ),
          //               ),
          //             ),
          //
          //
          //           ],
          //         ),
          //
          //
          //
          //       ],
          //     ),

            ),
          ),
        )
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
                            child: const Text(
                              '37 лет',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const Text(
                            'Скрыть возраст',
                            style: TextStyle(fontSize: 14),
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
          // padding: const EdgeInsets.only(left: 5, top: 25),
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
                    child: Text(widget.listOptions[index])),
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
    path_0.moveTo(size.width*0.3462320,size.height*0.1081347);
    path_0.cubicTo(size.width*0.3149147,size.height*0.05157810,size.width*0.2799547,0,size.width*0.2415829,0);
    path_0.lineTo(size.width*0.08000000,0);
    path_0.cubicTo(size.width*0.03581733,0,0,size.height*0.09137075,0,size.height*0.2040816);
    path_0.lineTo(0,size.height*4.578231);
    path_0.cubicTo(0,size.height*4.690946,size.width*0.03581733,size.height*4.782313,size.width*0.08000000,size.height*4.782313);
    path_0.lineTo(size.width*0.9200000,size.height*4.782313);
    path_0.cubicTo(size.width*0.9641840,size.height*4.782313,size.width,size.height*4.690946,size.width,size.height*4.578231);
    path_0.lineTo(size.width,size.height*0.2040816);
    path_0.cubicTo(size.width,size.height*0.09137075,size.width*0.9641840,0,size.width*0.9200000,0);
    path_0.lineTo(size.width*0.7557493,0);
    path_0.cubicTo(size.width*0.7173787,0,size.width*0.6824187,size.height*0.05157810,size.width*0.6511013,size.height*0.1081347);
    path_0.cubicTo(size.width*0.6111200,size.height*0.1803361,size.width*0.5575467,size.height*0.2244898,size.width*0.4986667,size.height*0.2244898);
    path_0.cubicTo(size.width*0.4397867,size.height*0.2244898,size.width*0.3862133,size.height*0.1803361,size.width*0.3462320,size.height*0.1081347);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = ConstColor.halfWhite;
    canvas.drawPath(path_0,paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.01333333;
    paint_1_stroke.color= ConstColor.halfWhite;
    paint_1_stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width*0.4533333,size.height*0.01700680),Offset(size.width*0.5466987,size.height*0.01700680),paint_1_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}