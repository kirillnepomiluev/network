import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/store/view_category_avatar_page.dart';
import 'package:network_app/store/view_category_hats.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  }) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeStoreTab = position;
          });
        }),
        child: BlurryContainer(
          blur: 10,
          color: ConstColor.halfWhite,
          borderRadius: BorderRadius.circular(20),
          // height: 56,
          padding: EdgeInsets.symmetric(
              vertical: mediaHeight * 0.02635, //19
              horizontal: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _activeStoreTab == position
                  ? Icon(
                Network.person,
                size: 18.5.sp, //18
                color: Colors.white,
              )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5.sp, //14
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
  }

  final _avatarScrollContr = ScrollController();
  final _hatScrollContr = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaRadius = mediaWidth * 0.45;

    return Scaffold(
      backgroundColor: ConstColor.blackBack,
      body: Stack(
        children: [
          //круг сверху
          Positioned(
              top: -mediaRadius * 0.05,
              right: -mediaRadius * 0.22,
              child: blurCircle(
                radius: mediaRadius,
                sigma: 0,
              )),

          //круг внизу
          Positioned(
              top: mediaHeight * 0.43,
              left: -mediaRadius * 0.85,
              child: blurCircle(
                radius: mediaRadius,
                sigma: mediaRadius * 0.33,
                // sigma: 0,
              )),

          Padding(
            padding: EdgeInsets.only(
              top: mediaTop,
              left: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Магазин
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Магазин',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  //Выбор интерфейса
                  Padding(
                    padding: const EdgeInsets.only(top: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        miniContainer(position: 1, text: 'Магазин'),
                        miniContainer(position: 2, text: 'Лотерея'),
                      ],
                    ),
                  ),

                  //Аватары
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _activeStoreTab == 1 ? 'Аватары' : 'Боксы аватаров',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.5.sp,   //22
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) =>
                                      const ViewCategoryAvatarPage()));

                              // _avatarScrollContr.animateTo(
                              //     moveWidth,
                              //     curve: Curves.easeOut,
                              //     duration: const Duration(seconds: 1)
                              // );
                            },
                            icon: const Icon(
                              Network.arrow_right_long,
                              color: Colors.white,
                              size: 18,
                            ))
                      ],
                    ),
                  ),

                  //Карусель аватаров
                  SingleChildScrollView(
                    controller: _avatarScrollContr,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        for(var i=0; i<6; i ++)
                          avatarContainer(
                            strCategory: i%2==0? 'Редкий' : 'Обычный',
                            context: context,
                            isBoxes: _activeStoreTab == 2,
                          ),

                      ],
                    ),
                  ),

                  //Головные уборы
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _activeStoreTab == 1
                              ? 'Головные уборы'
                              : 'Боксы одежды',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.5.sp,   //22
                              fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) =>
                                      const ViewCategoryHatsPage()));
                            },
                            icon: const Icon(
                              Network.arrow_right_long,
                              color: Colors.white,
                              size: 18,
                            ))
                      ],
                    ),
                  ),

                  //Карусель головных уборов
                  Padding(
                    padding: const EdgeInsets.only(bottom: 85),
                    child: SingleChildScrollView(
                      controller: _hatScrollContr,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for(var i=0; i<6; i ++)
                            hatContainer(
                              strCategory: i%2==0? 'Обычный' : 'Редкий',
                              context: context,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}