import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:network_app/chat/messages_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/meetings_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/profile/profile_page.dart';
import 'package:network_app/store/store_page.dart';
import 'package:network_app/wallet/walltet_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  final int initIndex;
  const HomePage({Key? key, required this.initIndex}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  var _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _currentPage = widget.initIndex;
    _pageController = PageController(initialPage: _currentPage);
    // _pageController.;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.green,
      body: PageView(
        controller: _pageController,
        children: const [
          MeetingsPage(),
          ProfilePage(),
          WalletPage(),
          MessagesPage(),
          StorePage(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent, //за рамками навигатора
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.black, //цвет рамки c округлением
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: BottomBar(
            height: 60,
            border: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              // side:  BorderSide(width: 3),
            ),
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: mediaWidth * 0.0266 //20
                ),
            itemPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: mediaWidth * 0.0426 //16
                ),
            backgroundColor: Colors.transparent,
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              barItem(icon: Network.people, text: 'Встречи'),
              barItem(icon: Network.person, text: 'Профиль'),
              barItem(icon: Network.wallet, text: 'Кошелек'),
              barItem(icon: Network.chat, text: 'Чат'),
              barItem(icon: Network.cart, text: 'Магазин'),
            ],
          ),
        ),
      ),
    );
  }

  BottomBarItem barItem({required IconData icon, required String text}) {
    final double iconSize = 18.sp; //21

    return BottomBarItem(
        icon: Icon(
          icon,
          size: iconSize,
          color: ConstColor.darkSalad,
        ),
        title: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 15.sp //12
              ),
        ),
        activeColor: ConstColor.salad100,
        inactiveIcon: Icon(
          size: iconSize,
          icon,
          color: ConstColor.salad100,
        ),
        backgroundColorOpacity: 1);
  }
}

Widget blurCircle({double sigma = 55, double radius = 271}) => SizedBox(
      width: radius,
      height: radius,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ConstColor.salad100,
              shape: BoxShape.circle,
            ),
            child: const Center(
                child: Text(
              'фывфывф',
              style: TextStyle(color: Colors.black),
            )),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: sigma,
              sigmaY: sigma,
            ),
            child: Container(),
          ),
        ],
      ),
    );

Widget statContainer({
  required BuildContext context,
  required String title,
  required String subtitle,
}) {
  final double contWidth = 45.sp; //107
  // final double contHeight =  mediaHeight*0.2853;

  return BlurryContainer(
    // padding: EdgeInsets.symmetric(vertical: 52, horizontal: 21),
    blur: 20,
    width: contWidth, //107
    // height: contWidth*1.514,  //162
    height: 55.sp, //162
    color: ConstColor.white05,
    borderRadius: BorderRadius.circular(30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title == ''
            ? Container()
            : Text(
                title,
                style: TextStyle(
                    fontSize: 23.sp, //28
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: TextStyle(
                fontSize: 17.5.sp, //16
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

// Widget statContainer(
//         {
//           required BuildContext context,
//           required String title,
//         required String subtitle,
//         }) {
//
//   // final mediaHeight = MediaQuery.of(context).size.height;
//   final mediaWidth = MediaQuery.of(context).size.width;
//
//   final double contWidth =  mediaWidth*0.2853;
//   // final double contHeight =  mediaHeight*0.2853;
//
//   return BlurryContainer(
//     // padding: EdgeInsets.symmetric(vertical: 52, horizontal: 21),
//     blur: 10,
//     width: contWidth,   //107
//     height: contWidth*1.514,  //162
//     color: ConstColor.halfWhite,
//     borderRadius: BorderRadius.circular(73),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         title == ''
//             ? Container()
//             : Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 23.sp,    //28
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//         Padding(
//           padding: const EdgeInsets.only(top: 5),
//           child: Text(
//             subtitle,
//             style: TextStyle(
//                 fontSize: 17.5.sp, //16
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         )
//       ],
//     ),
//   );
// }

Widget titleStatText(String text) => Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19.sp //20
            ),
      ),
    );

Widget progressParametr(
    {required String text1,
    required IconData icon,
    required String text2,
    bool isMeetingRow = false,
    double progress = 0,
    required BuildContext context}) {
  final double fontSize = 16; //16

  return Padding(
    padding: const EdgeInsets.only(top: 22.5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: (() {
              opeinInfoSheet(title: text1, context: context);
            }),
            child: isMeetingRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text1,
                        style: TextStyle(
                          color: ConstColor.greyText,
                          fontSize: getResSize(14),
                        ),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                          color: ConstColor.greyText,
                          fontSize: getResSize(14),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildRichTextTwo(
                        text1: text1,
                        text2: text2,
                        fontSize: fontSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Icon(
                          Network.info,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    ],
                  )),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(width: 1, color: ConstColor.salad100)),
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  barRadius: const Radius.circular(11),
                  lineHeight: 40, //40
                  percent: progress,
                  backgroundColor: Colors.transparent,
                  progressColor: ConstColor.salad100,
                ),
              ),
              Positioned(
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: ConstColor.salad100,
                      borderRadius: BorderRadius.circular(7)),
                  width: 24,
                  height: 22,
                  child: Icon(
                    icon,
                    size: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget hobbitsContainer(String text, {bool isDark = true}) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
          // color: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
                fontSize: 16.5.sp, //14
                fontWeight: FontWeight.w400
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(Icons.close_rounded,
            size: 22,
            color: ConstColor.salad100,
            ),
          )

        ],
      ),
    );

Widget textField(String hintText, {bool isEnable = true}) => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        enabled: isEnable,
        maxLines: null,
        style: TextStyle(
            fontSize: 18, //18
            fontWeight: FontWeight.w400,
            color: Colors.white
        ),
        initialValue: hintText,
        autofocus: false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          // filled: true,
          // fillColor: Colors.white,
        ),
      ),
    );

void opeinInfoSheet({required BuildContext context, required String title}) {
  showModalBottomSheet<void>(
      // elevation: 5,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (BuildContext context) => Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
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
                  titleStatText(title),
                  const Text(Constants.strLoremIpsum)
                ],
              ),
            ),
          ));
}

ButtonStyle buttonStyleCustom({
  double padH = 61,
  double padV = 17,
  double radius = 52,
  Color color = Colors.white,
}) =>
    ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: padV, horizontal: padH)),
      backgroundColor: MaterialStateProperty.all(color),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );

class BuildRichTextTwo extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  FontWeight fontWeight1;
  FontWeight fontWeight2;
  BuildRichTextTwo({
    Key? key,
    required this.text1,
    required this.text2,
    required this.fontSize,
    this.fontWeight1 = FontWeight.w400,
    this.fontWeight2 = FontWeight.w700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize, // 20.sp, //24
          fontWeight: fontWeight1,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
          ),
          TextSpan(
              text: text2,
              style: TextStyle(
                fontWeight: fontWeight2,
                color: ConstColor.salad100,
              )),
        ],
      ),
      // minFontSize: 14,
    );
  }
}
