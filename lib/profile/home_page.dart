import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:network_app/profile/profile_page.dart';
import 'package:network_app/store/stoe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.blue),
          const ProfilePage(),
          Container(color: Colors.purple),
          Container(color: Colors.greenAccent.shade700),
          const StorePage(),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      backgroundColor: Colors.grey.shade400,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: BottomBar(
            // backgroundColor: Colors.grey.shade900,
            backgroundColor: Colors.transparent,
            selectedIndex: _currentPage,
            onTap: (int index) {
              _pageController.jumpToPage(index);
              setState(() => _currentPage = index);
            },
            items: <BottomBarItem>[
              barItem(
                icon: Icons.people_outline,
                text: 'Встречи'
              ),

              barItem(
                  icon: Icons.person_outline,
                  text: 'Профиль'
              ),

              barItem(
                  icon: Icons.account_balance_wallet_outlined,
                  text: 'Инвентарь'
              ),

              barItem(
                  icon: Icons.chat_bubble_outline,
                  text: 'Чат'
              ),

              barItem(
                  icon: Icons.shopping_bag_outlined,
                  text: 'Магазин'
              ),

            ],
          ),
        ),
      ),
    );
  }

}

BottomBarItem barItem({required IconData icon, required String text}) => BottomBarItem(
    icon: Icon(icon, color: Colors.black,),
    title: Text(text, style: const TextStyle(color: Colors.black, fontSize: 12),),
    activeColor: Colors.white,
    inactiveIcon: Icon(icon, color: Colors.white,),
    backgroundColorOpacity: 0.6
);