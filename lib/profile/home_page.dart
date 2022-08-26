import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/profile/profile_page.dart';
import 'package:network_app/store/store_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
      extendBody: true,
      backgroundColor: Colors.grey.shade400,
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
      bottomNavigationBar:

      // _currentPage==1?
      // Stack(
      //   alignment: Alignment.bottomCenter,
      //   children: [
      //     InkWell(
      //       onTap: ((){
      //         openBottomSheetProfile();
      //       }),
      //       child: Container(
      //         height: 120,
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.vertical(top: Radius.circular(35))
      //         ),
      //       ),
      //     ),
      //
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //         color: Colors.grey.shade900,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         child: BottomBar(
      //           // height: 65,
      //           // backgroundColor: Colors.grey.shade900,
      //           backgroundColor: Colors.transparent,
      //           selectedIndex: _currentPage,
      //           onTap: (int index) {
      //             _pageController.jumpToPage(index);
      //             setState(() => _currentPage = index);
      //           },
      //           items: <BottomBarItem>[
      //             barItem(
      //                 icon: Icons.people_outline,
      //                 text: 'Встречи'
      //             ),
      //
      //             barItem(
      //                 icon: Icons.person_outline,
      //                 text: 'Профиль'
      //             ),
      //
      //             barItem(
      //                 icon: Icons.account_balance_wallet_outlined,
      //                 text: 'Инвентарь'
      //             ),
      //
      //             barItem(
      //                 icon: Icons.chat_bubble_outline,
      //                 text: 'Чат'
      //             ),
      //
      //             barItem(
      //                 icon: Icons.shopping_bag_outlined,
      //                 text: 'Магазин'
      //             ),
      //
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // )
      //     :
      Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: BottomBar(
            // height: 65,
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


  BottomBarItem barItem({required IconData icon, required String text}) => BottomBarItem(
      icon: Icon(icon, color: Colors.black,),
      title: Text(text, style: const TextStyle(color: Colors.black, fontSize: 12),),
      activeColor: Colors.white,
      inactiveIcon: Icon(icon, color: Colors.white,),
      backgroundColorOpacity: 0.6
  );


}



Widget statContainer({required String title, required String subtitle}) => Padding(
  padding: const EdgeInsets.only(right: 10),
  child: Container(
    height: 140,
    width: 95,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50)
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title==''? Container():
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),

        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(subtitle, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
        )

      ],),
  ),
);



Widget titleStatText(String text) => Padding(
  padding: const EdgeInsets.only(top: 20, bottom: 10),
  child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
);

Widget progressParametr({required String text1, required String text2, bool isMeetingRow = false, double progress = 0, required BuildContext context}) => Padding(
  padding: const EdgeInsets.only(top: 10),
  child: Column(children: [
    InkWell(
      onTap: ((){
        opeinInfoSheet(title: text1, context: context);
      }),
      child: Row(
        mainAxisAlignment: isMeetingRow? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          Text(text1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, ),),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(text2, style: TextStyle(fontSize: 16, fontWeight: isMeetingRow? FontWeight.normal: FontWeight.bold,),),
          ),
        ],),
    ),

    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        barRadius: const Radius.circular(15),
        // width: 140.0,
        lineHeight: 25,
        percent: progress,
        backgroundColor: Colors.grey.shade300,
        progressColor: Colors.grey.shade800,
      ),
    ),
  ],),
);



void opeinInfoSheet({required BuildContext context, required String title}){

  showModalBottomSheet<void>(
    // elevation: 5,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(25)
          )
      ),
      context: context,
      builder: (BuildContext context) =>
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30)
                )
            ),
            // height: MediaQuery.of(context).size.height * 0.9,
            // color: Colors.grey.shade100,
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
            child:
            SingleChildScrollView(
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
                            borderRadius: BorderRadius.circular(15)
                        ),),
                    ),
                  ),

                  titleStatText(title),

                  const Text(Constants.strLoremIpsum)


                ],),
            ),)
  );
}
