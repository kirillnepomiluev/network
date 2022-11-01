import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/meetings/choose_interests.dart';
import 'package:network_app/meetings/invitations_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/meetings/notifications_page.dart';
import 'package:network_app/meetings/timer_page.dart';
import 'package:network_app/profile/view_partner_profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({Key? key}) : super(key: key);

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  int _activeTab = 1;

  void changeTab(int position){
    setState(() {
      _activeTab = position;
    });
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

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      color:
                      _activeTab == position
                          ? ConstColor.salad100
                          : Colors.white,

                      fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 5, right: 16),
                  child:
                  position==3
                      ?
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: _activeTab == position? ConstColor.salad100 : Colors.white,
                    size: 19.sp, //20
                  )
                      :
                  Container()


              )

            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 28
          ),
          // padding: EdgeInsets.only(
          //     left: 15,
          //     right: 15,
          //     bottom: mediaHeight>570? mediaHeight*0.0416 : 5  //30
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              InkWell(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const ViewPartnerProfilePage()));
                }),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text('Джоли, 28',
                            style: TextStyle(
                                fontSize: 22.5.sp,   //26
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.verified,
                            color: Colors.white,
                            size: 18.sp,   //16
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Уровень "Базовый"',
                        style: TextStyle(
                            fontSize: 16.5.sp,   //14
                            color: ConstColor.textWhite,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 13
                        ),
                        decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'ищу партнера для бизнеса',
                          style: TextStyle(
                              color: ConstColor.textWhite,
                              fontSize: 15.5.sp, //12
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: mediaHeight*0.036), //26
                      child: rhombusText()
                    ),

                  ],
                ),
              ),

              MeetRow(func: (){
                Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (context) =>
                        const TimerPage()));
              }),

            ],
          ),
        ),
      ),
      backgroundColor: ConstColor.blackBack,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop), //25
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Верхняя часть Для вас:
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _iconsBar(),

                  //Выбор интерфейса
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // ChangeTabContainer(
                            //   position: 1,
                            //   text: 'Для вас',
                            //   activeTabInit: _activeTab,
                            //   func: (){
                            //     changeTab(1);
                            //   },
                            // ),
                            //
                            // ChangeTabContainer(
                            //   position: 2,
                            //   text: 'По близости',
                            //   activeTabInit: _activeTab,
                            //   func: (){
                            //     changeTab(2);
                            //   },
                            // ),
                            //
                            // ChangeTabContainer(
                            //   position: 3,
                            //   text: 'Деловая встреча',
                            //   activeTabInit: _activeTab,
                            //   func: (){
                            //     changeTab(3);
                            //   },
                            // ),

                            miniContainer(
                              position: 1,
                              text: 'Для вас',
                            ),

                            miniContainer(
                              position: 2,
                              text: 'По близости',
                            ),

                            miniContainer(
                              position: 3,
                              text: 'Деловая встреча',
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Нижняя часть
            Expanded(
              child: InkWell(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const ViewPartnerProfilePage()));
                }),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    // borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: Stack(
                    children: [

                      Positioned(
                          top: 15,
                          right: 15,
                          child: Image.asset(
                            'assets/images/avatars/avatar_3D.png',
                            height: 681,  //575
                          )),

                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Container(
                              // width: 91,
                              // height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                              // alignment: Alignment.topLeft,
                              // width: 73,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  const Icon(
                                    Icons.circle,
                                    color: ConstColor.salad100,
                                    size: 10,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Онлайн',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.5.sp, //12
                                          color: Colors.white
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  ConstColor.blackBack
                                ]
                            )
                        ),
                      )

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _iconsBar() {
    final mediaWidth = MediaQuery.of(context).size.width;
    const double contSize = 43;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Padding(
            padding: const EdgeInsets.only(left: 7),
            child:
            IconContainer(
              icon:  Network.search,
              func: (){

                Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (context) =>
                        const ChooseInterestsPage()));

                // setState(() {
                //   _activeTab = 0;
                // });
              },
              iconSize:  16.sp,   //17
              iconColor: Colors.white,
            )
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            IconContainer(
              icon:  Network.notification,
              func: (){
                      Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (context) =>
                              const NotificationsPage()));
              },
              iconSize:  16.sp,   //17
              iconColor: Colors.white,
            ),

            // Container(
            //   width: contSize,
            //   height: contSize,
            //   decoration: BoxDecoration(
            //     color: Colors.white70,
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: IconButton(
            //     onPressed: () {
            //
            //       Navigator.of(context).push(
            //           MaterialPageRoute<void>(
            //               builder: (context) =>
            //               const NotificationsPage()));
            //
            //     },
            //     icon: Icon(
            //       Network.notification,
            //       size: 18.sp,   //18
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (context) =>
                          const InvitationsPage()));
                },
                child: Container(
                    width: mediaWidth*0.29,  //109
                    height: contSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ConstColor.salad100
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          '02:04:15',
                          style: TextStyle(
                              fontSize: 15.5.sp, //12
                              fontWeight: FontWeight.bold),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.incomplete_circle,
                            size: 18.5.sp,  //16
                          ),
                        )

                      ],
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }

}



class HobbySelected extends StatefulWidget {
  final String title;
  const HobbySelected({Key? key, required this.title}) : super(key: key);

  @override
  State<HobbySelected> createState() => _HobbySelectedState();
}

class _HobbySelectedState extends State<HobbySelected> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    final mediaWitdh = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() {
        setState(() {
          isSelected = !isSelected;
        });
      }),
      child: Container(
        padding: EdgeInsets.all(mediaWitdh*0.0373), //14
        decoration: BoxDecoration(
          color: isSelected
              ? ConstColor.salad100
              : ConstColor.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
        Text(
          widget.title,
          style: TextStyle(
            color:
            isSelected
                ? Colors.black
                : ConstColor.textWhite,
              fontSize: 15.5.sp, //12
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}
