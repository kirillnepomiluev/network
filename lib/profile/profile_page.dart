import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/store/store_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;


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
          blur: 20,
          color: ConstColor.white10,
          borderRadius: BorderRadius.circular(20),
          // height: 56,
          padding: EdgeInsets.symmetric(
              // vertical: mediaHeight*0.02635, //19
              vertical: 18.5.sp, //19
              // horizontal: 12 //18
              ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // _activeProfileTab == position
              //     ? Icon(
              //         Network.person,
              //         size: 18.5.sp, //18
              //         color: Colors.white,
              //       )
              //     : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      color:
                      _activeProfileTab == position
                          ? ConstColor.salad100
                          : Colors.white,

                      fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 16),
                child:
                _activeProfileTab == position
                ?
                Icon(
                  Icons.keyboard_arrow_down,
                  color: ConstColor.salad100,
                  size: 19.sp, //20
                )
                :     Icon(
                  Icons.keyboard_arrow_right,
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

                        //Верхняя часть профиля
                        Padding(
                                padding: EdgeInsets.only(top: 10, left: padLeft),
                                child: profileAvatarRow(),
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
                                      'Tima',
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
                                          color: ConstColor.salad100,
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 16,
                                    right: 16
                                  ),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      const EnterInfoContainer(
                                        padTop: 42,
                                        text1: 'Шкаф ',
                                        text2: 'пустой',
                                        description:  'Посетите магазин, чтобы купить новые\nпредметы для своего персонажа'
                                      ),



                                      Padding(
                                        padding: const EdgeInsets.only(top: 59),
                                        child:
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: buttonStyleCustom(
                                                  padH: 0,
                                                  padV: 22,
                                                  radius: 20
                                              ),
                                              onPressed: () {

                                                  Navigator.of(context).push(MaterialPageRoute<void>(
                                                      builder: (context) => const StorePage()));

                                              },
                                              child: Text(
                                                'Посетить магазин',
                                                style: TextStyle(
                                                    fontSize: 18, //18
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black
                                                ),
                                              )),
                                        ),

                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 59),
                                      //   child: InkWell(
                                      //     onTap: (() {
                                      //       // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const RecoveryEmailPage()));
                                      //     }),
                                      //     child: Container(
                                      //       // width: MediaQuery.of(context).size.width*0.8,
                                      //       padding: const EdgeInsets.symmetric(
                                      //           horizontal: 36, vertical: 17),
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.white,
                                      //         borderRadius:
                                      //             BorderRadius.circular(52),
                                      //       ),
                                      //       child: Text(
                                      //         'Посетить магазин',
                                      //         style: TextStyle(
                                      //             fontSize: 17.sp, //16
                                      //             color: Colors.black,
                                      //             fontWeight: FontWeight.w500),
                                      //         textAlign: TextAlign.center,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),


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
        Container(
                height: contHeight,
                alignment: Alignment.bottomCenter,
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    openBottomSheetProfile();
                  },
                  onVerticalDragUpdate: (details) {
                    int sensitivity = 8;
                      if(details.delta.dy < -sensitivity){
                      openBottomSheetProfile();
                    }
                  },
                  child:

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomPaint(
                        size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: BottomSheetMinPaint(),
                      ),
                      BlurryContainer(
                        blur: 20,
                        width: mediaWidth,
                        height: 75,
                        child: Container(),
                      )
                    ],
                  )

                  // CustomPaint(
                  //   size: Size(375, 120),
                  //   painter: RPSCustomPainter(),
                  // )


                  // Stack(
                  //   alignment: Alignment.bottomCenter,
                  //   children: [
                  //
                  //     Positioned(
                  //       bottom: sheetHeightMinus,
                  //       child: CustomPaint(
                  //         size: Size(contWidth, contHeight),
                  //         painter: RPSCustomPainter(),
                  //       ),
                  //     ),
                  //
                  //   ],
                  // ),

                ),
              )



    );


  }

  Widget profileAvatarRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      //ава
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(right: 20),
              child:

              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: ConstColor.salad100,
                  foregroundImage: AssetImage(
                      'assets/images/avatars/avatar_0.png'
                  ),
                ),
              )
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
                        vertical: 6,
                        horizontal: 9),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        color: ConstColor.white10),
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


      const Padding(
        padding:  EdgeInsets.only(right: 16),
        child: NotificationIcon(),
      ),

    ],
  );



  void openBottomSheetProfile() {

    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    // final _height = mediaHeight*0.8;
    final _height = mediaHeight-mediaTop;

    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) => GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child:

              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    // blur: 30,
                    color: Colors.transparent,
                    // decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius:
                    //         const BorderRadius.vertical(top: Radius.circular(30))),
                    // padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                    height: _height,
                    child: SingleChildScrollView(
                      child: Column(
                        // physics: NeverScrollableScrollPhysics(),
                        children: [

                          CustomPaint(
                            size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: BottomSheetMinPaint(),
                          ),

                          BlurryContainer(
                            borderRadius: BorderRadius.zero,
                            blur: 30,
                            // decoration: BoxDecoration(
                                color: ConstColor.white10,
                                // borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                              // ),
                            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                // Padding(
                                //   padding: const EdgeInsets.only(top: 0, bottom: 0),
                                //   child: Center(
                                //     child: Container(
                                //       // alignment: Alignment.center,
                                //       width: 35,
                                //       height: 4,
                                //       decoration: BoxDecoration(
                                //           color: Colors.grey.shade400,
                                //           borderRadius: BorderRadius.circular(15)),
                                //     ),
                                //   ),
                                // ),

                                const StatColumn(),


                                titleStatText('Статус'),
                                textField('Sed aenean est eget sit eget at tellus sed.'),

                                titleStatText('Интересы'),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Wrap(
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
                                ),
                                titleStatText('Обо мне'),
                                textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),

                                titleStatText('Сфера деятельности'),
                                textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),

                                titleStatText('Пол'),
                                const RadioList(
                                  listOptions: ['Мужчина', 'Женщина'],
                                ),

                                titleStatText('Возраст'),

                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: ConstColor.salad100,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Text(
                                              '37 лет',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17.sp), //14
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 17,
                                              right: 3
                                              ),
                                              child: Icon(
                                                Network.pencil,
                                                size: 16,
                                              ),
                                            )

                                          ],
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Скрыть возраст',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17.sp), //14
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 1),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Network.check_circle_outlined,
                                            // Icons.check_circle,
                                            color: ConstColor.salad100,
                                            size: 18.sp, //18
                                          ),
                                          // iconSize: 18.sp, //18
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                titleStatText('Семейное положение'),
                                const RadioList(
                                  listOptions: [
                                    'Женат',
                                    'Свободен',
                                    'В поиске'
                                  ],
                                ),
                                titleStatText('Цель встречи'),
                                const RadioList(
                                  listOptions: [
                                    'Деловая',
                                    'Общение',
                                    'Свидание'
                                  ],
                                ),
                                titleStatText(
                                    'Готов ли знакомиться с противоположным полом'),
                                const RadioList(
                                  listOptions: [
                                    'Да',
                                    'Нет',
                                  ],
                                ),
                                // titleStatText('Какие критерии?'),
                                // const RadioList(
                                //   listOptions: [
                                //     'Да',
                                //     'Нет',
                                //   ],
                                // ),

                                Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 30),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style:
                                        buttonStyleCustom(
                                            color: Colors.white,
                                            padH: 0,
                                            padV: 0,
                                            radius: 20
                                        ),
                                        // ButtonStyle(
                                        //
                                        //   backgroundColor:
                                        //   MaterialStateProperty.all(Colors.white),
                                        //   shape: MaterialStateProperty.all(
                                        //     RoundedRectangleBorder(
                                        //       borderRadius: BorderRadius.circular(20),
                                        //     ),
                                        //   ),
                                        // ),

                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 22),
                                          child: Text(
                                            'Сохранить',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,   //16
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  CustomPaint(
                    size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: BottomSheetMinPaint(color: Colors.transparent),
                  ),

                ],
              ),
            )
    );
  }

}









