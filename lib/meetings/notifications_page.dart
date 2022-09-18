import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _activeInvitationTab = 1;

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
            _activeInvitationTab = position;
          });
        }),
        child: Container(
          padding: EdgeInsets.all(0.0373 * mediaWidth), //14
          decoration: BoxDecoration(
            color: _activeInvitationTab == position
                ? ConstColor.grey
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
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
    final double contSize = 0.11466 * mediaWidth; //43

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: EdgeInsets.only(
            top: mediaTop,
            left: 17.sp, //16
            right: 17.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(context, func: () {}),
                    Text(
                      'Уведомления',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.5.sp, //20
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: contSize,
                      height: contSize,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Network.check_double,
                            color: Colors.black,
                            size: 18.5.sp, //19
                          )),
                    ),
                  ],
                ),
              ),

              notificationCont(
                  showOnline: true,
                  title1: 'Джоли ',
                  title2: 'пригласила вас на ',
                  title3: 'встречу',
                  strTime: '2 ч назад',
                  iconType: 1
              ),

              notificationCont(
                  showOnline: true,
                  title1: 'Джоли ',
                  title2: 'добавила вас в ',
                  title3: 'избранное',
                  strTime: '2 ч назад',
                  iconType: 2
              ),

              notificationCont(
                  showOnline: false,
                  title1: 'Джоли ',
                  title2: 'хочет добавить вас в ',
                  title3: 'друзья',
                  strTime: '1 д назад',
                  iconType: 2
              ),

              notificationCont(
                  showOnline: false,
                  title1: '',
                  title2: 'На вас подали ',
                  title3: 'жалобу',
                  strTime: '1 д назад',
                  iconType: 0
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget notificationCont({
    required bool showOnline,
    required String title1,
    required String title2,
    required String title3,
    required String strTime,
    required int iconType,
  }) {
    // final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            showOnline == false
                ? Container()
                : Positioned(
                    left: 15.5.sp, //12
                    top: 15.5.sp,
                    child: Icon(
                      Icons.circle,
                      size: 13.sp, //8
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 18.sp, //17
                  vertical: 16.2.sp //14
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16.5.sp //15
                        ),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            shape: BoxShape.circle),
                        // width: mediaWidth * 0.12, //45
                        width: 30.sp,
                        height: 30.sp,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            iconType==0? Network.warning:
                            Network.person,
                            color: Colors.black,
                          ),
                          iconSize: 17.sp, //15
                        )),
                  ),
                  Expanded(
                    child: Column(
                      // direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRichText(
                            // 'Джоли ', 'пригласила вас на ', 'встречу'
                          title1, title2, title3
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.sp //5
                              ),
                          child: Text(
                            strTime,
                            style: TextStyle(
                                fontSize: 14.sp, //10
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.5.sp),
                    child: Container(
                      width: 22.sp, //24
                      height: 22.sp,
                      decoration: BoxDecoration(
                          color: iconType==0? Colors.transparent : Colors.black,
                          shape: BoxShape.circle
                          // borderRadius: BorderRadius.circular(15),
                          ),
                      child:
                      iconType==0? Container():
                      Icon(
                        iconType==1
                            ? Network.electric
                        : Network.star,
                        color: Colors.white,
                        size: 14.sp, //12
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRichText(String text1, String text2, String text3) => RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.5.sp, //12
              // fontSize: MediaQuery.of(context).size.width < 300 ? 10 : 15,
              fontFamily: 'Roboto'),
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            TextSpan(
                text: text2,
                style: const TextStyle(fontWeight: FontWeight.w400)),
            TextSpan(
                text: text3,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        // minFontSize: 14,
      );
}
