import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_view.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_view.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_view.dart';
import 'package:network_app/ui/pages/home_pages/home_store/home_store_view.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_view.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.initIndex = 0, this.isCupboard = false})
      : super(key: key);
  final bool isCupboard;
  final int initIndex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentPage = 0;
  var _pageController = PageController();

  @override
  void initState() {
    _currentPage = widget.initIndex;
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  final double widthOne = 375;
  final double widthTwo = 360;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contPadH = mediaWidth < widthOne ? 10 : 15; //15
    final double contPadV = mediaWidth < widthOne ? 6 : 8; //8

    final double itemPadH = mediaWidth < widthOne ? 15 : 20;
    final double itemPadV = mediaWidth < widthOne ? 14 : 20;

    final double iconSize = mediaWidth < widthOne ? 12 : 14; //14
    final double fontSize = mediaWidth < widthOne ? 10 : 12; //12

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children: [
          const HomeMeetingView(),
          HomeProfileView(isCupboardInit: widget.isCupboard),
          const HomeWalletView(),
          const HomeStoreView(),
          const HomeMessagesView(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent, //за рамками навигатора
        padding: EdgeInsets.symmetric(horizontal: contPadH, vertical: contPadV),
        child: BlurryContainer(
          padding: EdgeInsets.zero,
          blur: 20,
          color: Colors.white.withOpacity(0.15), //цвет рамки c округлением
          borderRadius: BorderRadius.circular(20),
          child: BottomBar(
            border: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
            itemPadding: EdgeInsets.symmetric(
              horizontal: itemPadH,
              vertical: itemPadV,
            ),
            backgroundColor: Colors.transparent,
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              _barItem(
                  icon: NetworkIcons.people,
                  text: 'Встречи',
                  fontSize: fontSize,
                  iconSize: iconSize,),
              _barItem(
                  icon: NetworkIcons.person,
                  text: 'Профиль',
                  fontSize: fontSize,
                  iconSize: iconSize,),
              _barItem(
                  icon: NetworkIcons.wallet,
                  text: 'Кошелек',
                  fontSize: fontSize,
                  iconSize: iconSize,),
              _barItem(
                  icon: NetworkIcons.cart,
                  text: 'Магазин',
                  fontSize: fontSize,
                  iconSize: iconSize,),
              _barItem(
                  icon: NetworkIcons.chat,
                  text: 'Чат',
                  fontSize: fontSize,
                  iconSize: iconSize,),
            ],
          ),
        ),
      ),
    );
  }

  BottomBarItem _barItem(
      {required IconData icon,
      required String text,
      required double iconSize,
      required double fontSize,}) {
    return BottomBarItem(
        icon: Icon(
          icon,
          size: iconSize,
          color: AppColors.darkSalad,
        ),
        title: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,),
        ),
        activeColor: AppColors.salad,
        inactiveIcon: Icon(
          size: iconSize,
          icon,
          color: Colors.white,
        ),
        backgroundColorOpacity: 1,);
  }
}
