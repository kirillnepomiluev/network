import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/matching_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InvitationsPage extends StatefulWidget {
  const InvitationsPage({Key? key}) : super(key: key);

  @override
  State<InvitationsPage> createState() => _InvitationsPageState();
}

class _InvitationsPageState extends State<InvitationsPage> {
  int _activeTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeTab = position;
          });
        }),
        child: Container(
          padding: EdgeInsets.all(0.0373 * mediaWidth), //14
          decoration: BoxDecoration(
            color: _activeTab == position
                ? ConstColor.salad100
                : ConstColor.white10,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: _activeTab == position
                    ? ConstColor.textBlack
                    : ConstColor.textWhite,
                fontSize: 15.5.sp, //12
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = 0.184 * mediaWidth; //69

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // backgroundColor: ConstColor.blackBack,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 0.0666 * mediaWidth), //25
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
            width: contSize,
            height: contSize,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Network.tune,
                color: Colors.black,
              ),
              iconSize: 19.sp, //20
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BackButtonCustom(),
              ),

              //Выбор интерфейса
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    miniContainer(
                      position: 1,
                      text: 'Пригашения',
                    ),
                    miniContainer(
                      position: 2,
                      text: 'Партнеры',
                    ),
                  ],
                ),
              ),

              viewInviteContainer(strType: 'Деловая встреча', strName: 'Джоли 28'),
              viewInviteContainer(strType: 'Деловая встреча', strName: 'Игорь, 34', avatarNumb: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewInviteContainer({required String strType, String strName='', int avatarNumb = 4, bool showVerified = false}) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 0.056 * mediaWidth, //21
            vertical: 0.056 * mediaWidth * 1.238 //26
            ),
        decoration: BoxDecoration(
          color: ConstColor.white10,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Тип
                Container(
                  height: mediaWidth * 0.1013, //38,
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0453 * mediaWidth //17
                          ),
                  decoration: BoxDecoration(
                    color: ConstColor.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      strType,
                      style: TextStyle(
                          // color: ConstColor.textWhite,
                          fontSize: 15.5.sp, //12
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),

                _activeTab == 1
                    ? Text(
                        '2 ч назад',
                        style: TextStyle(
                          fontSize: 16.5.sp, //14
                          fontWeight: FontWeight.w400,
                          color: ConstColor.textGray,
                        ),
                      )
                    :
                Flexible(
                            child: Container(
                              width: 0.408 * mediaWidth, //153
                              height: mediaWidth * 0.1013, //38,
                              decoration: BoxDecoration(
                                color: ConstColor.salad100,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    'Готов к встрече',
                                    style: TextStyle(
                                        // color: ConstColor.textWhite,
                                        fontSize: 15.5.sp, //12
                                        fontWeight: FontWeight.w600),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.75),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle
                                      ),
                                      width: 0.046 * mediaWidth, //17.25
                                      height: 0.046 * mediaWidth,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 1.5),
                                        child: Icon(
                                          Network.check,
                                          size: 11.sp, //11
                                          color: ConstColor.salad100,
                                        ),
                                      ), //Icons.turn
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(strName,
                      style: TextStyle(
                          fontSize: 18.5.sp, //18
                          // color: ConstColor.textWhite,
                          fontWeight: FontWeight.w600)
                  ),

                  showVerified==false? Container():
                  Padding(
                    padding: const EdgeInsets.only(left: 5.75),
                    child: Icon(
                      Icons.verified,
                      color: ConstColor.salad100,
                      size: 18.sp, //17
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Уровень "Базовый"',
                    style: TextStyle(
                        fontSize: 16.5.sp, //14
                        // color: ConstColor.textWhite,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '+150 баллов',
                    style: TextStyle(
                        fontSize: 16.5.sp, //14
                        color: ConstColor.salad100,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            //Аватар и направление
            Padding(
              padding: EdgeInsets.only(
                top: 0.0773 * mediaWidth, //29
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [

                      SizedBox(
                        width: mediaWidth * 0.2213, //83
                        height: mediaWidth * 0.2213, //83
                        child: CircleAvatar(
                          // backgroundColor: showOnline? Colors.white : Colors.black,
                          foregroundImage: AssetImage(
                              'assets/images/avatars/avatar_$avatarNumb.png'
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: ConstColor.salad100,
                                  shape: BoxShape.circle
                              ),
                              width: 0.048 * mediaWidth, //18
                              height: 0.048 * mediaWidth,
                              child: Icon(
                                Icons.call_made,
                                size: 15.sp, //11
                                color: Colors.black,
                              ), //Icons.turn
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '250 м',
                                style: TextStyle(
                                  color: ConstColor.salad100,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.5.sp //20
                                    ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        color: Colors.transparent,
                        border: Border.all(color: ConstColor.salad100)
                      ),
                      width: mediaWidth * 0.176, //66
                      height: mediaWidth * 0.176 * 1.394, //92
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const MatchingPage()));
                        },
                        icon: const Icon(
                          Network.arrow_right_long,
                          color: ConstColor.salad100,
                        ),
                        iconSize: 20.sp, //24
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
