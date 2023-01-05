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
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatefulWidget {
  final bool isCupboard;
  final int initIndex;
  const HomeView({Key? key, required this.initIndex, this.isCupboard = false}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentPage = 0;
  var _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _currentPage = widget.initIndex;
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
        padding: const EdgeInsets.symmetric(
            horizontal: 15,
          vertical: 8
            ),
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
              _barItem(icon: NetworkIcons.people, text: 'Встречи'),
              _barItem(icon: NetworkIcons.person, text: 'Профиль'),
              _barItem(icon: NetworkIcons.wallet, text: 'Кошелек'),
              _barItem(icon: NetworkIcons.cart, text: 'Магазин'),
              _barItem(icon: NetworkIcons.chat, text: 'Чат'),
            ],
          ),
        ),
      ),
    );
  }

  BottomBarItem _barItem({required IconData icon, required String text}) {
    final double iconSize = 18.sp; //21

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
              fontSize: 15.sp, //12
            fontWeight: FontWeight.w500
              ),
        ),
        activeColor: AppColors.salad100,
        inactiveIcon: Icon(
          size: iconSize,
          icon,
          color: Colors.white,
        ),
        backgroundColorOpacity: 1
    );
  }
}
