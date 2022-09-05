import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/store/view_category_avatar_page.dart';
import 'package:network_app/store/view_category_hats.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _activeStoreTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) =>
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: (() {
            setState(() {
              _activeStoreTab = position;
            });
          }),
          child: Container(
            // width: 140,
            height: 56,
            // padding: EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: ConstColor.halfWhite,
              borderRadius: BorderRadius.circular(20),
              // border: Border.all(width: _activeProfileTab == position ? 2 : 0)
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _activeStoreTab == position
                    ? const Icon(
                        Network.person,
                        size: 20,
                        color: Colors.white,
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Icon(
                    _activeStoreTab == position
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  final _avatarScrollContr = ScrollController();
  final _hatScrollContr = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: ConstColor.halfDarkSalad,
          ),
          Positioned(
            top: -210,
            right: -260,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  ConstColor.salad100.withOpacity(0.7),
                  ConstColor.salad100.withOpacity(0.65),
                  ConstColor.salad100.withOpacity(0.5),
                  ConstColor.salad100.withOpacity(0.3),
                  ConstColor.salad100.withOpacity(0.1),
                  ConstColor.salad100.withOpacity(0),
                ], radius: 0.35),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: -350,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  ConstColor.salad100.withOpacity(0.5),
                  ConstColor.salad100.withOpacity(0.3),
                  ConstColor.salad100.withOpacity(0),
                  ConstColor.salad100.withOpacity(0),
                ], radius: 0.7),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Магазин',
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 26, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),

                    //Выбор интерфейса
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        children: [
                          miniContainer(position: 1, text: 'Магазин'),
                          miniContainer(position: 2, text: 'Лотерея'),
                          // miniContainer(position: 3, text: 'Встречи'),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _activeStoreTab == 1 ? 'Аватары' : 'Боксы аватаров',
                            style: const TextStyle(
                              color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (context) =>
                                            const ViewCategoryAvatarPage()));

                                // const double moveWidth = 400;
                                // _avatarScrollContr.animateTo(
                                //     moveWidth,
                                //     curve: Curves.easeOut,
                                //     duration: const Duration(seconds: 1)
                                // );
                              },
                              icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30,))
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      controller: _avatarScrollContr,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          avatarContainer(
                            strCategory: 'Редкий',
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),
                          avatarContainer(
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),
                          avatarContainer(
                            strCategory: 'Редкий',
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),
                          avatarContainer(
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),
                          avatarContainer(
                            strCategory: 'Редкий',
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),
                          avatarContainer(
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _activeStoreTab == 1
                                ? 'Головные уборы'
                                : 'Боксы одежды',
                            style: const TextStyle(
                              color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (context) =>
                                            const ViewCategoryHatsPage()));

                                // const double moveWidth = 320;
                                // _hatScrollContr.animateTo(
                                //     moveWidth,
                                //     curve: Curves.easeOut,
                                //     duration: const Duration(seconds: 1)
                                // );
                              },
                              icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30,))
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 85),
                      child: SingleChildScrollView(
                        controller: _hatScrollContr,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            hatContainer(
                              strCategory: 'Редкий',
                              context: context,
                            ),
                            hatContainer(
                              context: context,
                            ),
                            hatContainer(
                              strCategory: 'Редкий',
                              context: context,
                            ),
                            hatContainer(
                              context: context,
                            ),
                            hatContainer(
                              strCategory: 'Редкий',
                              context: context,
                            ),
                            hatContainer(
                              context: context,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: 310,
                    //   child: ListView.builder(
                    //     // padding: const EdgeInsets.only(left: 5, top: 25),
                    //       scrollDirection: Axis.horizontal,
                    //       shrinkWrap: true,
                    //       // controller: myController,
                    //       // physics: const BouncingScrollPhysics(),
                    //       itemCount: 6,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return
                    //           avatarContainer();
                    //       }),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
