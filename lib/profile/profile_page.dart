import 'package:flutter/material.dart';
import 'package:network_app/components/choose_status.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/components/choose_interests.dart';
import 'package:network_app/store/store_page.dart';
import 'package:network_app/store/view_category_avatar_page.dart';
import 'package:network_app/store/view_category_hats.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  final bool isCupboard;
  const ProfilePage({Key? key, this.isCupboard= false}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _activeTab = 1;

  @override
  void initState() {

    if(widget.isCupboard){
      _activeTab = 2;
    }

    super.initState();
  }

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeTab = position;
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
                      color: _activeTab == position
                          ? ConstColor.salad100
                          : Colors.white,
                      fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 16),
                child: _activeTab == position
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: ConstColor.salad100,
                        size: 19.sp, //20
                      )
                    : Icon(
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

  void changeTab(int position) {
    setState(() {
      _activeTab = position;
    });
  }

  final _avatarScrollContr = ScrollController();
  final _hatScrollContr = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    // final double sheetHeight = mediaHeight * 0.15;  //147
    // final mediaRadius = mediaWidth*0.45;

    final double contWidth = mediaWidth; //375
    // final double contWidth = 84.sp;   //375
    final double contHeight = contWidth * 0.392;


    final double padLeft = 17.5.sp; //16

    // final _aspectRatio = mediaWidth>400 && mediaHeight<690;
    final aspectRatio = mediaWidth / mediaHeight >= 0.6;

    return Scaffold(
        extendBody: true,
        // backgroundColor: ConstColor.blackBack,
        body: Stack(
          children: [
            _activeTab != 1
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
                                miniContainer(
                                  text: 'Профиль',
                                  position: 1
                                ),

                                miniContainer(
                                  text: 'Шкаф',
                                  position: 2
                                ),

                                miniContainer(
                                  text: 'Друзья',
                                  position: 3
                                ),

                                // ChangeTabContainer(
                                //   position: 1,
                                //   text: 'Профиль',
                                //   activeTabInit: _activeTab,
                                //   func: () {
                                //     changeTab(1);
                                //   },
                                // ),
                                // ChangeTabContainer(
                                //   position: 2,
                                //   text: 'Шкаф',
                                //   activeTabInit: _activeTab,
                                //   func: () {
                                //     changeTab(2);
                                //   },
                                // ),
                                // ChangeTabContainer(
                                //   position: 3,
                                //   text: 'Друзья',
                                //   activeTabInit: _activeTab,
                                //   func: () {
                                //     changeTab(3);
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),

                        //Нижняя часть профиля
                        _activeTab != 1
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
                                                NetworkIcons.check_thin,
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

                        _activeTab != 2
                            ? Container()
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 16, right: 16),
                                  child:
    widget.isCupboard?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // //Магазин
        // const Padding(
        //   padding: EdgeInsets.only(top: 10),
        //   child: Text(
        //     'Магазин',
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 30,
        //         fontWeight: FontWeight.w700),
        //     textAlign: TextAlign.start,
        //   ),
        // ),

        // //Выбор интерфейса
        // Padding(
        //   padding: const EdgeInsets.only(top: 19),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       miniContainer(position: 1, text: 'Магазин'),
        //       miniContainer(position: 2, text: 'Лотерея'),
        //     ],
        //   ),
        // ),

        //Аватары
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
           'Аватары',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.5.sp,   //22
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (context) =>
                            const ViewCategoryAvatarPage()));
                  },
                  icon: const Icon(
                    NetworkIcons.arrow_long_right,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
          ),
        ),

        //Карусель аватаров
        SingleChildScrollView(
          controller: _avatarScrollContr,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              for(var i=0; i<6; i ++)
                avatarContainer(
                  strCategory: i%2==0? 'Редкий' : 'Обычный',
                  context: context,
                  isBoxes: _activeTab == 2,
                ),

            ],
          ),
        ),

        //Головные уборы
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
             'Головные уборы',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.5.sp,   //22
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (context) =>
                            const ViewCategoryHatsPage()));
                  },
                  icon: const Icon(
                    NetworkIcons.arrow_long_right,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
          ),
        ),

        //Карусель головных уборов
        Padding(
          padding: const EdgeInsets.only(bottom: 85),
          child: SingleChildScrollView(
            controller: _hatScrollContr,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for(var i=0; i<6; i ++)
                  hatContainer(
                    strCategory: i%2==0? 'Обычный' : 'Редкий',
                    context: context,
                  ),
              ],
            ),
          ),
        ),
      ],
    )
        :
                                  Column(
                                    children: [
                                      const EnterInfoContainer(
                                          padTop: 42,
                                          text1: 'Шкаф ',
                                          text2: 'пустой',
                                          description:
                                              'Посетите магазин, чтобы купить новые\nпредметы для своего персонажа'),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 59),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: buttonStyleCustom(
                                                  padH: 0,
                                                  padV: 22,
                                                  radius: 20),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute<void>(
                                                        builder: (context) =>
                                                            const StorePage()));
                                              },
                                              child: const Text(
                                                'Посетить магазин',
                                                style: TextStyle(
                                                    fontSize: 18, //18
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
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
        bottomNavigationBar: Container(
          height: contHeight,
          alignment: Alignment.bottomCenter,
          color: Colors.transparent,
          child: GestureDetector(
              onTap: () {
                openBottomSheetProfile();
              },
              onVerticalDragUpdate: (details) {
                int sensitivity = 8;
                if (details.delta.dy < -sensitivity) {
                  openBottomSheetProfile();
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomPaint(
                    size: Size(
                        mediaWidth,
                        (mediaWidth * 0.07733333333333334)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
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
        ));
  }


  void openBottomSheetProfile() {

    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) => const BottomSheetMain());
  }
}


class BottomSheetMain extends StatefulWidget {
  const BottomSheetMain({Key? key}) : super(key: key);

  @override
  State<BottomSheetMain> createState() => _BottomSheetMainState();
}

class _BottomSheetMainState extends State<BottomSheetMain> {
  // bool isEditStatus = false;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    // final mediaTop = MediaQuery.of(context).viewPadding.top;
    // final _height = mediaHeight - mediaTop;
    final height = mediaHeight*0.95;


    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.transparent,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                // physics: NeverScrollableScrollPhysics(),
                children: [

                  CustomPaint(
                    size: Size(
                        mediaWidth,
                        (mediaWidth * 0.07733333333333334)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: BottomSheetMinPaint(color: Colors.black.withOpacity(0.5)),
                  ),


                  BlurryContainer(
                    borderRadius: BorderRadius.zero,
                    blur: 50,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        const StatColumn(ifProfileSheet: true,),

                        titleStatText('Статус'),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  builder: (context) => const ChooseStatusPage()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  // color: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Я люблю веселиться',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.5.sp, //14
                                        fontWeight: FontWeight.w400),
                                  ),

                                  const Padding(
                                   padding:  EdgeInsets.only(left: 8.0),
                                   child:
                                   Icon(
                                     NetworkIcons.edit,
                                     size: 22,
                                     color: ConstColor.salad100,
                                   )
                                 )

                                ],
                              ),
                            ),
                          ),
                        ),

                        titleStatText('Интересы'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            children: [
                              hobbitsContainer('Большой теннис'),
                              hobbitsContainer('Бассейн'),
                              hobbitsContainer('Управление'),
                              hobbitsContainer('Маркетинг'),

                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                    color: ConstColor.salad100,
                                    borderRadius: BorderRadius.circular(7)),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute<void>(
                                        builder: (context) => const ChooseInterestsPage()));
                                  },
                                  icon: const Icon(Icons.add),
                                )
                              ),

                            ],
                          ),
                        ),
                        titleStatText('Обо мне'),
                        textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),

                        titleStatText('Сфера деятельности'),
                        // textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            children: [
                              hobbitsContainer('Маркетинг'),
                              hobbitsContainer('IT-сфера'),
                              hobbitsContainer('Финансы'),

                              Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: ConstColor.salad100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: (){},
                                    icon: const Icon(Icons.add),
                                  )
                              ),

                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: BuildRichTextTwo(
                            text1: 'Вы можете указать ',
                            text2: '3 сферы деятельности',
                            fontSize: 10,
                            fontWeight1: FontWeight.w400,
                            fontWeight2: FontWeight.w400,
                          ),
                        ),

                        titleStatText('Пол'),
                        const RadioList(
                          listOptions: ['Мужчина', 'Женщина'],
                        ),

                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:
                            CustomCheckListTile(title: 'Скрыть пол',)
                        ),

                        titleStatText('Возраст'),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: ConstColor.salad100,
                                borderRadius:
                                BorderRadius.circular(15)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '37 лет',
                                  style: TextStyle(
                                      color: ConstColor.textBlack,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp), //14
                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(
                                      left: 17, right: 3),
                                  child: Icon(
                                    NetworkIcons.pencil,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child:
                            CustomCheckListTile(title: 'Скрыть возраст',)
                        ),

                        titleStatText('Семейное положение'),
                        const RadioList(
                          listOptions: [
                            'Женат',
                            'Свободен',
                            'В поиске'
                          ],
                        ),

                        const CustomCheckListTile(title: 'Скрыть семейное положение',),

                        titleStatText('Цель встречи'),
                        const RadioList(
                          listOptions: [
                            'Деловая',
                            'Общение',
                            'Свидание'
                          ],
                        ),

                        const CustomCheckListTile(title: 'Скрыть цель встречи',),

                        titleStatText(
                            'Готов ли знакомиться с противоположным полом'),
                        const RadioList(
                          listOptions: [
                            'Да',
                            'Нет',
                          ],
                        ),

                        const CustomCheckListTile(title: 'Скрыть',),

                        const SizedBox(height: 80,)

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          //     width: mediaWidth,
          //     child: ElevatedButton(
          //         style: buttonStyleCustom(
          //             color: Colors.white,
          //             padH: 0,
          //             padV: 0,
          //             radius: 20),
          //
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //         },
          //         child: const Padding(
          //           padding: EdgeInsets.symmetric(
          //               vertical: 22),
          //           child: Text(
          //             'Сохранить',
          //             style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize: 18, //16
          //                 fontWeight: FontWeight.w500),
          //           ),
          //         )),
          //   ),
          // ),

          CustomPaint(
            size: Size(
                mediaWidth,
                (mediaWidth * 0.07733333333333334)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: BottomSheetMinPaint(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
