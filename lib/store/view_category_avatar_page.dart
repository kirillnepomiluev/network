import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/store/view_prod_avatar_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'dart:ui' as ui;

class ViewCategoryAvatarPage extends StatefulWidget {
  const ViewCategoryAvatarPage({Key? key}) : super(key: key);

  @override
  State<ViewCategoryAvatarPage> createState() => _ViewCategoryAvatarPageState();
}

class _ViewCategoryAvatarPageState extends State<ViewCategoryAvatarPage> {
  int _active = 1;

  Widget miniContainer({required int position, required String text}) =>
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: (() {
            setState(() {
              _active=position;
            });
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
                color: ConstColor.white10,
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(width: 1.5, color: Colors.grey.shade500)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 3),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16.5.sp,   //14
                        color: _active==position? ConstColor.salad100 : ConstColor.whiteText,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Icon(
                  _active==position? Icons.keyboard_arrow_down_sharp: Icons.keyboard_arrow_right,
                  size: 20,   //14
                  color: _active==position? ConstColor.salad100 : ConstColor.whiteText,
                )
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      BackButtonCustom(),
                      Center(child: Text('Аватары',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.5.sp,   //18
                            fontWeight: FontWeight.w600,
                            color: ConstColor.whiteText
                        ),
                      ))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 23,
                      horizontal: 18
                    ),
                    decoration: BoxDecoration(
                      color: ConstColor.white10,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text(Constants.strLoremIpsum,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: ConstColor.whiteText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),

                //Выбор интерфейса
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        miniContainer(position: 1, text: 'Цена'),
                        miniContainer(position: 2, text: 'Категория'),
                        miniContainer(position: 3, text: 'Уровень'),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Column(
                    children: [

                      // avatarContainer(
                      //   strCategory: i%2==0? 'Редкий' : 'Обычный',
                      //   context: context,
                      //   isBoxes: _activeStoreTab == 2,
                      // ),

                      avatarContainer(
                          strCategory: 'Редкий',
                      context: context,
                          isView: true,
                      ),

                      avatarContainer(
                        strCategory: 'Обычный',
                          context: context,
                          isView: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}


Widget avatarContainer(
    {required BuildContext context,
      bool isView = false,
      bool isBoxes = false,
      String strCategory = 'Обычный'
    }) {

  final mediaWidth = MediaQuery.of(context).size.width;
  final double contWidth = isView? mediaWidth : 0.58*mediaWidth;   //217.57
  final double imageHeight = isView? contWidth*0.65 : contWidth;


  return Padding(
    padding: EdgeInsets.only(right: isView ? 0 : 15, bottom: isView ? 20 : 0),
    child: InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => const ViewProdAvatarPage(
              title: 'Костюм "Выходной"',
              imageURL: 'assets/images/3.png',
            )));
      }),
      child: Container(
        padding: isView? const EdgeInsets.all(30) :
        const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 9),

        decoration: BoxDecoration(
          color: ConstColor.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        width: contWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            isBoxes
                ? Container()
                : Padding(
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  strCategory,
                  style: TextStyle(
                      color: ConstColor.whiteText,
                      fontSize: 16.5.sp,  //14

                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: isBoxes? 20 : 0),
              child: Container(
                height: imageHeight,
                child: Image.asset(
                  'assets/images/${strCategory=='Обычный'? '4': '3'}.png',
                  fit: BoxFit.contain,
                ),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    // image: DecorationImage(
                    //     image: AssetImage(
                    //       'assets/images/${strCategory=='Обычный'? '4': '3'}.png',
                    //     )
                    // ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),

            isBoxes
                ? Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Бокс для уровня ',
                    style: TextStyle(
                        fontSize: 14.sp, //11
                        color: ConstColor.whiteText,
                    ),
                  ),
                  Text(
                    'Базовый',
                    style: TextStyle(
                        fontSize: 14.sp, //11
                        color: ConstColor.whiteText,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
                : Padding(
              padding: EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Костюм "Выходной"',
                            style: TextStyle(
                                color: ConstColor.salad100,
                                fontSize: 16.5.sp, //14
                                fontWeight: FontWeight.w600
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              '#0863246',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp, //12
                                  color: ConstColor.whiteText,
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),

                  isView
                      ? Container()
                      : Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Text(
                      '1.6 SOL',
                      style: TextStyle(
                          color: ConstColor.salad100,
                          fontSize: 17.5.sp,   //16
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: isView? 23 : 6, bottom: isView? 0 : 12),
                    child: Wrap(
                      spacing: 10, //80
                      direction: Axis.horizontal,
                      // alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          'Уровень 6  Баллы +150',
                          style: TextStyle(
                              fontSize: 15.5.sp, //12
                              color: ConstColor.whiteText,
                            fontWeight: FontWeight.w400
                          ),
                        ),

                        const Icon(
                          Network.rhombus,
                          color: ConstColor.salad100,
                          size: 15,
                        ),

                        isView == false
                            ? Container()
                            : Padding(
                          padding: EdgeInsets.only(left: mediaWidth*0.1466), //55
                          child: Text(
                            '1.6 SOL',
                            style: TextStyle(
                                color: ConstColor.salad100,
                                fontSize: 17.sp,   //16
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

}
