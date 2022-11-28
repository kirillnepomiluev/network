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
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  final bool isCupboard;
  final int initIndex;
  const HomePage({Key? key, required this.initIndex, this.isCupboard = false}) : super(key: key);

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
          ProfilePage(isCupboard: widget.isCupboard),
          const WalletPage(),
          const StorePage(),
          const MessagesPage(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent, //за рамками навигатора
        padding: const EdgeInsets.symmetric(
            horizontal: 15,
          vertical: 8
            ),
        // padding: const EdgeInsets.only(bottom: 5),
        child: BlurryContainer(
          padding: EdgeInsets.zero,
          blur: 20,
          // decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15), //цвет рамки c округлением
            borderRadius: BorderRadius.circular(20),
          // ),
          child: BottomBar(
            // height: 54,
            border: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side:  BorderSide(width: 3),
            ),
            padding: EdgeInsets.zero,
            itemPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20 //16
                ),
            backgroundColor: Colors.transparent,
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              barItem(icon: NetworkIcons.people, text: 'Встречи'),
              barItem(icon: NetworkIcons.person, text: 'Профиль'),
              barItem(icon: NetworkIcons.wallet, text: 'Кошелек'),
              barItem(icon: NetworkIcons.cart, text: 'Магазин'),
              barItem(icon: NetworkIcons.chat, text: 'Чат'),
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
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp, //12
            fontWeight: FontWeight.w500
              ),
        ),
        activeColor: ConstColor.salad100,
        inactiveIcon: Icon(
          size: iconSize,
          icon,
          color: Colors.white,
        ),
        backgroundColorOpacity: 1
    );
  }
}
