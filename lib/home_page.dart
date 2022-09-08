import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:network_app/chat/messages_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/meetings_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/profile/profile_page.dart';
import 'package:network_app/store/store_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  final initIndex;
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
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.green,
      body: PageView(
        controller: _pageController,
        children: [
          const MeetingsPage(),
          const ProfilePage(),
          Container(color: Colors.purple),
          const MessagesPage(),
          const StorePage(),
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
            // itemPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 1),
            // itemPadding: const EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 13),
            // padding: const EdgeInsets.only(left: 3, right: 3, top: 0, bottom: 0),
            backgroundColor: Colors.transparent,
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              barItem(icon: Network.people, text: 'Встречи'),
              barItem(icon: Network.person, text: 'Профиль'),
              barItem(icon: Network.wallet, text: 'Инвентарь'),
              barItem(icon: Network.chat, text: 'Чат'),
              barItem(icon: Network.cart, text: 'Магазин'),
            ],
          ),
        ),
      ),
    );
  }

  BottomBarItem barItem(
          {required IconData icon,
          double iconSize = 21,
          required String text}) =>
      BottomBarItem(
          icon: Icon(
            icon,
            size: iconSize,
            color: Colors.black,
          ),
          title: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
          activeColor: ConstColor.salad100,
          inactiveIcon: Icon(
            size: iconSize,
            icon,
            color: Colors.white,
          ),
          backgroundColorOpacity: 1);
}

Widget statContainer(
        {required String title,
        required String subtitle,
        double width = 107,
        double height = 162,
        double fontSize = 28}) =>
    Padding(
        padding: const EdgeInsets.only(right: 10),
        child: BlurryContainer(
          blur: 10,
          height: height,
          width: width,
          // decoration: BoxDecoration(
          color: ConstColor.halfWhite,
          borderRadius: BorderRadius.circular(73),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title == ''
                  ? Container()
                  : Text(
                      title,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: fontSize - 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )

        // Stack(
        //   children: [
        //     BackdropFilter(
        //       filter: ui.ImageFilter.blur(
        //         sigmaX: 0.1,
        //         sigmaY: 0.1,
        //       ),
        //       child: Container(
        //         height: 162,
        //         width: 107,
        //         decoration: BoxDecoration(
        //             color: ConstColor.halfWhite,
        //             borderRadius: BorderRadius.circular(50)),
        //       ),
        //     ),
        //     Container(
        //       // height: 140,
        //       // width: 95,
        //       height: 162,
        //       width: 107,
        //       decoration: BoxDecoration(
        //           color: Colors.transparent,
        //           borderRadius: BorderRadius.circular(73)),
        //
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           title == ''
        //               ? Container()
        //               : Text(
        //                   title,
        //                   style: const TextStyle(
        //                       fontSize: 28,
        //                       fontWeight: FontWeight.w500,
        //                       color: Colors.white),
        //                 ),
        //           Padding(
        //             padding: const EdgeInsets.only(top: 5),
        //             child: Text(
        //               subtitle,
        //               style: const TextStyle(
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.w500,
        //                   color: Colors.white),
        //               textAlign: TextAlign.center,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        //

        );

Widget titleStatText(String text) => Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );

Widget progressParametr(
        {required String text1,
        required String text2,
        bool isMeetingRow = false,
        double progress = 0,
        required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          InkWell(
            onTap: (() {
              opeinInfoSheet(title: text1, context: context);
            }),
            child: Row(
              mainAxisAlignment: isMeetingRow
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isMeetingRow ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              barRadius: const Radius.circular(15),
              lineHeight: 25,
              percent: progress,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );

Widget hobbitsContainer(String text, {bool isDark = true}) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(22)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );

Widget textField(String hintText, {bool isEnable = true}) => TextFormField(
      enabled: isEnable,
      maxLines: null,
      style: const TextStyle(color: Colors.black),
      initialValue: hintText,
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Colors.white,
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

Widget backButton(BuildContext context, {Function? func}) => Align(
      alignment: Alignment.topLeft,
      child: Container(
        // alignment: Alignment.topLeft,
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: IconButton(
              onPressed: () {
                if (func == null) {
                  Navigator.of(context).pop();
                } else {
                  func();
                }
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              )),
        ),
      ),
    );

ButtonStyle buttonStyleCustom({
  double padH = 61,
  double padV = 17,
  double radius = 52,
  Color color = Colors.black,
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

// Widget buttomCustom(
//         {double padH = 61,
//         double padV = 17,
//         double radius = 52,
//         required Function func,
//         Color color = Colors.black,
//         required String text,
//         double textSize = 16,
//           textColor = Colors.white
//         }) =>
//     ElevatedButton(
//         style: ButtonStyle(
//           padding: MaterialStateProperty.all(
//               EdgeInsets.symmetric(vertical: padV, horizontal: padH)),
//           backgroundColor: MaterialStateProperty.all(color),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(52),
//             ),
//           ),
//         ),
//         onPressed: () {},
//         child: Text(
//           text,
//           style: TextStyle(
//               fontSize: textSize, fontWeight: FontWeight.w500, color: textColor),
//         ));
