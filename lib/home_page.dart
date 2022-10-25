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

