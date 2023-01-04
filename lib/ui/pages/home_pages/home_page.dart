import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/meetings_main_view.dart';
import 'package:network_app/ui/pages/home_pages/messages_main/messages_main_view.dart';
import 'package:network_app/ui/pages/home_pages/profile_main/profile_main_view.dart';
import 'package:network_app/ui/pages/home_pages/store_main/store_main_view.dart';
import 'package:network_app/ui/pages/home_pages/wallet_main/walltet_main_view.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        children: [
          const MeetingsMainPage(),
          ProfileMainView(isCupboardInit: widget.isCupboard),
          const WalletMainPage(),
          const StoreMainView(),
          const MessagesMainView(),
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
