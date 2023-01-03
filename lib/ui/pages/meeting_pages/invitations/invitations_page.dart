import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/pages/meeting_pages/matching/matching_page.dart';
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
                ? AppColors.salad100
                : AppColors.white10,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: _activeTab == position
                    ? AppColors.textBlack
                    : AppColors.textWhite,
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
                NetworkIcons.tune,
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
              const Padding(
                padding: EdgeInsets.only(top: 10),
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

              viewInviteContainer(strName: 'Джоли 28'),
              viewInviteContainer(strName: 'Игорь, 34', avatarNumb: 1, showVerified: false),
              viewInviteContainer(strName: 'Джоли 28'),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewInviteContainer({String strName='', int avatarNumb = 0, bool showVerified = true}) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 0.056 * mediaWidth, //21
            vertical: 0.056 * mediaWidth * 1.238 //26
            ),
        decoration: BoxDecoration(
          color: AppColors.white10,
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
                    color: AppColors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Деловая встреча',
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
                          color: AppColors.grey3,
                        ),
                      )
                    :
                Flexible(
                            child:
                                // showVerified?
                                // Container(
                                //     width: mediaWidth*0.29,  //109
                                //     height: contSize,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(15),
                                //         color: ConstColor.white10
                                //     ),
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //
                                //         Text(
                                //           '02:04:15',
                                //           style: TextStyle(
                                //               fontSize: 15.5.sp, //12
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //
                                //         const Padding(
                                //           padding:  EdgeInsets.only(left: 5),
                                //           child: Icon(
                                //             Icons.timer_outlined,
                                //             color: Colors.white,
                                //             size: 16,  //16
                                //           ),
                                //         )
                                //
                                //       ],
                                //     )
                                // )
                                // :

                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: showVerified? 17 : 13
                              ),
                              decoration: BoxDecoration(
                                color: showVerified? AppColors.white10 : AppColors.salad100,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:

                                  showVerified?
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text(
                                        '02:04:15',
                                        style: TextStyle(
                                            fontSize: 15.5.sp, //12
                                            fontWeight: FontWeight.bold),
                                      ),

                                      const Padding(
                                        padding:  EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.timer_outlined,
                                          color: Colors.white,
                                          size: 16,  //16
                                        ),
                                      )

                                    ],
                                  )
                                  :

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    'Готов к встрече',
                                    style: TextStyle(
                                        color: AppColors.textBlack,
                                        fontSize: 15.5.sp, //12
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.75),
                                    child:
                                    Icon(
                                      NetworkIcons.check,
                                      size: 15.sp, //11
                                      // color: ConstColor.salad100,
                                    ),
                                    // Container(
                                    //   decoration: const BoxDecoration(
                                    //       color: Colors.black,
                                    //       shape: BoxShape.circle
                                    //   ),
                                    //   width: 0.046 * mediaWidth, //17.25
                                    //   height: 0.046 * mediaWidth,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(top: 1.5),
                                    //     child: Icon(
                                    //       NetworkIcons.check,
                                    //       size: 11.sp, //11
                                    //       color: ConstColor.salad100,
                                    //     ),
                                    //   ), //Icons.turn
                                    // ),

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
                      color: AppColors.salad100,
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
                    '+150 токенов',
                    style: TextStyle(
                        fontSize: 16.5.sp, //14
                        color: AppColors.salad100,
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
                      AppCircleAvatar(
                        imageUrl: 'assets/images/avatars/avatar_$avatarNumb.png',
                        contSize: 83,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.salad100,
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
                                  color: AppColors.salad100,
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
                  InkWell(
                    onTap: (){
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const MatchingPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37),
                          color: Colors.transparent,
                          border: Border.all(color: AppColors.salad100)
                        ),
                        width: mediaWidth * 0.176, //66
                        height: mediaWidth * 0.176 * 1.394, //92
                        child:
                        Icon(
                          NetworkIcons.arrow_long_right,
                          color: AppColors.salad100,
                          size: 16.sp,
                        ),

                        // IconButton(
                        //   padding: EdgeInsets.zero,
                        //   constraints: BoxConstraints(),
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute<void>(
                        //         builder: (context) => const MatchingPage()));
                        //   },
                        //   icon: const Icon(
                        //     NetworkIcons.arrow_long_right,
                        //     color: ConstColor.salad100,
                        //   ),
                        //   iconSize: 16.sp, //24
                        // )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
