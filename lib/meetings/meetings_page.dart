import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
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
  int _activeMeetingTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {

    final mediaWidth = MediaQuery.of(context).size.width;
    final double pad = 0.0373*mediaWidth;  //14

    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: (() {
            setState(() {
              _activeMeetingTab = position;
            });
          }),
          child: Container(
            decoration: BoxDecoration(
              color: _activeMeetingTab == position
                  ? ConstColor.grey
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              // border: isMeeting? null : Border.all(width: _activeProfileTab==position? 2 : 0)
            ),
            // height: 35,
            // width: 100,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: position==3?
                  EdgeInsets.only(left: pad, bottom: pad, top: pad, right: 0)
                      : EdgeInsets.all(pad),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 15.5.sp, //12
                        fontWeight: FontWeight.w600),
                  ),
                ),
                position != 3
                    ? Container()
                    : const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.arrow_drop_down
                            // Icons.arrow_right_outlined
                            ),
                      )
              ],
            ),
          ),
        ),
      );
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      _activeMeetingTab==0?
          serchBody():
      mainBody();
  }

  Widget serchBody() {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
    onWillPop: () async {
      setState(() {
        _activeMeetingTab=1;
      });
      return false;
    },
    child: Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //appBar
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        BackButtonCustom(func: (){
                          setState(() {
                            _activeMeetingTab=1;
                          });
                        }),
                        Center(child: Text('Выберете интересы',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.5.sp,   //18
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ))
                      ],
                    ),
                  ),

                  //Поиск
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 18),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 43,
                    decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Network.search, size: 14, color: Colors.black,),
                          ),

                          Expanded(child: _textEditor()),
                        ],
                      ),
                    ),
                  ),


                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    direction: Axis.horizontal,
                    children: [

                      for (final item in Constants.hobbiesList)
                        HobbySelected(title: item,),

                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 100),
                    child:

                    SizedBox(
                      width: 0.472*mediaWidth,  //177
                      height: 0.076*mediaHeight,               //55
                      child: ElevatedButton(
                          style: buttonStyleCustom(
                              padH: 0,
                              padV: 0,
                              radius: 17
                          ),
                          onPressed: () {},
                          child: Text(
                            'Найти',
                            style:
                            TextStyle(
                                fontSize: 18.sp,     //16
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          )),
                    ),


                    // ElevatedButton(
                    //     style: ButtonStyle(
                    //       padding: MaterialStateProperty.all(
                    //           const EdgeInsets.symmetric(vertical: 18, horizontal: 64)),
                    //       backgroundColor:
                    //       MaterialStateProperty.all(Colors.black),
                    //       shape: MaterialStateProperty.all(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(17),
                    //         ),
                    //       ),
                    //     ),
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Найти',
                    //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    //     )),



                  ),


                ],
              ),
            ),
          ),
        ),
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
        Row(
          children: [
            Container(
              width: contSize,
              height: contSize,
              decoration: BoxDecoration(
                // color: Colors.black87,
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  // setState(() {
                  // _activeProfileTab = 1;
                  // });
                },
                icon: Icon(
                  Network.person,
                  size: 17.sp,   //18
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Container(
                width: contSize,
                height: contSize,
                decoration: BoxDecoration(
                  // color: Colors.black87,
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _activeMeetingTab = 0;
                    });
                  },
                  icon: Icon(
                    Network.search,
                    size: 16.sp,   //17
                  ),
                ),
              ),
            ),

          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: contSize,
              height: contSize,
              decoration: BoxDecoration(
                // color: Colors.black87,
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (context) =>
                          const NotificationsPage()));
                },
                icon: Icon(
                  Network.notification,
                  size: 18.sp,   //18
                ),
              ),
            ),
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
                    // padding: const EdgeInsets.only(
                    //     left: 17,
                    //     right: 17,
                    //     top: 10,
                    //     bottom: 10
                    // ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
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

  Widget mainBody() {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    extendBody: true,
    bottomNavigationBar: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: 15,
            right: 15,
            // bottom: 44
            bottom: mediaHeight>570? mediaHeight*0.0416 : 5  //30
        ),
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
                          color: ConstColor.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 9),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(69),
                      ),
                      child: Text(
                        'ищу партнера для бизнеса',
                        style: TextStyle(
                            fontSize: 15.5.sp, //12
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: mediaHeight*0.036), //26
                    child: Text(
                      '+150 баллов',
                      style: TextStyle(
                          fontSize: 16.5.sp, //14
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),

                ],
              ),
            ),

            meetRow(context),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.grey.shade400,
    body: Padding(
      padding: EdgeInsets.only(top: mediaTop), //25
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Верхняя часть Для вас:
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           width: 40,
                //           height: 40,
                //           decoration: BoxDecoration(
                //             // color: Colors.black87,
                //             color: Colors.white70,
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           child: Center(
                //             child: IconButton(
                //               onPressed: () {
                //                 // setState(() {
                //                 // _activeProfileTab = 1;
                //                 // });
                //               },
                //               icon: const Icon(
                //                 Network.person,
                //                 size: 18,
                //               ),
                //             ),
                //           ),
                //         ),
                //
                //         Padding(
                //           padding: const EdgeInsets.only(left: 7),
                //           child: Container(
                //             width: 40,
                //             height: 40,
                //             decoration: BoxDecoration(
                //               // color: Colors.black87,
                //               color: Colors.white70,
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             child: Center(
                //               child: IconButton(
                //                 onPressed: () {
                //                   setState(() {
                //                     _activeMeetingTab = 0;
                //                   });
                //                 },
                //                 icon: const Icon(
                //                   Network.search,
                //                   size: 14,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //
                //       ],
                //     ),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Container(
                //           width: 43,
                //           height: 43,
                //           decoration: BoxDecoration(
                //             // color: Colors.black87,
                //             color: Colors.white70,
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           child: Center(
                //             child: IconButton(
                //               onPressed: () {
                //                 Navigator.of(context).push(
                //                     MaterialPageRoute<void>(
                //                         builder: (context) =>
                //                         const InvitationsPage()));
                //               },
                //               icon: const Icon(
                //                 Network.notification,
                //                 size: 18,
                //               ),
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 7),
                //           child: Container(
                //               width: 110.57,
                //               height: 39.57,
                //               padding: const EdgeInsets.only(
                //                   left: 17,
                //                   right: 17,
                //                   top: 10,
                //                   bottom: 10
                //               ),
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(15),
                //                   color: Colors.white),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: const [
                //                   Text(
                //                     '02:04:15',
                //                     style: TextStyle(
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.bold),
                //                   ),
                //                   Padding(
                //                     padding: EdgeInsets.only(left: 5),
                //                     child: Icon(
                //                       Icons.incomplete_circle,
                //                       size: 16,
                //                     ),
                //                   )
                //                 ],
                //               )),
                //         ),
                //       ],
                //     )
                //   ],
                // ),

                //Верхние икнокм
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
                padding: const EdgeInsets.all(15),
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 0),
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
                              // color: Colors.greenAccent,
                              color: Color(0xFF09D253),
                              size: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Онлайн',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.5.sp, //12
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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


  Widget _textEditor() => SizedBox(
    // height: 43,
    // width: double.infinity,
    child: TextField(

      // onChanged: (value){
      // },
      maxLines: 1,
      controller: _controller,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      autofocus: false,
      decoration: const InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white70),
            borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
        ),
        enabledBorder:

        OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white70),
            borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
          // borderRadius: BorderRadius.circular(15)
        ),

      ),
    ),
  );

}



Widget meetRow(BuildContext context) {
  final mediaWitdh = MediaQuery.of(context).size.width;
  final double contSize = mediaWitdh*0.128;   //48
  final double iconSize = 19.sp;     //25
  final double iconElSize = 18.5.sp;   //20

  return Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [

    Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15)
          // shape: BoxShape.circle
        ),
        width: contSize,
        height: contSize,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close_outlined,
            color: Colors.white,
          ),
          iconSize: iconSize,
        )),

    InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (context) =>
                const TimerPage()));
      },
      child: Container(
        // height: 54,
        // width: 209,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],

        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  // shape: BoxShape.circle
                ),
                width: contSize,
                height: contSize,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Network.electric,
                    color: Colors.white,
                  ),
                  iconSize: iconElSize,
                )),

            Padding(
              padding: EdgeInsets.only(
                  left: mediaWitdh*0.0453, //17
                  right: 8
              ),
              child: Text('Встретиться',
                  style: TextStyle(
                      fontSize: 15.sp,     //12
                      fontWeight: FontWeight.w500)),
            ),

            //иконка >>
            Padding(
              padding: EdgeInsets.only(right: mediaWitdh*0.056), //21
              child: SizedBox(
                width: 20,
                height: 20,
                child: Stack(
                  children: const [
                    Positioned(
                        left: 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                          color: ConstColor.grey,
                        )),
                    Positioned(
                        left: 6,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                        )),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ),



    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
          // shape: BoxShape.circle
        ),
        width: contSize,
        height: contSize,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            // Icons.star_border_outlined,
            Network.star,
            color: Colors.white,
          ),
          iconSize: iconSize,
        )),
  ],
);
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
              ? ConstColor.grey
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 15.5.sp, //12
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
