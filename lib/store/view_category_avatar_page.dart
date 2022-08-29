import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/profile/home_page.dart';
import 'package:network_app/store/view_prod_avatar_page.dart';
import 'dart:ui' as ui;

class ViewCategoryAvatarPage extends StatefulWidget {
  const ViewCategoryAvatarPage({Key? key}) : super(key: key);

  @override
  State<ViewCategoryAvatarPage> createState() => _ViewCategoryAvatarPageState();
}

class _ViewCategoryAvatarPageState extends State<ViewCategoryAvatarPage> {
  // int _active = 0;

  Widget miniContainer({required int position, required String text}) =>
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: (() {
            // setState(() {
            //   _active=position;
            // });
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1.5, color: Colors.grey.shade500)),
            // height: 30,
            // width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 3),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 14,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      // appBar: AppBar(
      //   toolbarHeight: 65,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   title: Container(
      //     width: 55,
      //     height: 55,
      //     decoration: BoxDecoration(
      //       color: Colors.white70,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Center(
      //       child: IconButton(
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //             // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const HomePage()));
      //           },
      //           icon: const Icon(
      //             Icons.arrow_back,
      //             color: Colors.black,
      //             size: 25,
      //           )),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: buttonBack(context),
                ),

                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Аватары',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),

                const Text(Constants.strLoremIpsum,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),

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
                      avatarContainer(
                          context: context,
                          isView: true,
                          contWidth: MediaQuery.of(context).size.width,
                          contHeight: MediaQuery.of(context).size.width*1.1
                      ),

                      avatarContainer(
                          context: context,
                          isView: true,
                          contWidth: MediaQuery.of(context).size.width,
                          contHeight: MediaQuery.of(context).size.width*1.1
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

//          filter: ui.ImageFilter.blur(
//               sigmaX: 0.1,
//               sigmaY: 0.1,
//             ),
Widget avatarContainer(
        {required BuildContext context,
        double contWidth = 217.57,
        double contHeight = 364,
        bool isView = false,
        bool isBoxes = false,
        String strCategory = 'Обычный'
        }) =>
    Padding(
      padding: EdgeInsets.only(right: isView ? 0 : 10, bottom: isView ? 20 : 0),
      child: InkWell(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const ViewProdAvatarPage()));
        }),
        child: Container(
          // height: isBoxes? 220 : null,
          // padding: EdgeInsets.all(isView ? 30 : 15),
          padding: isView? EdgeInsets.all(15) : EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: isView? Colors.white : ConstColor.halfWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          height: contHeight,
          width: contWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              isBoxes
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text(
                        strCategory,
                        style: TextStyle(
                          color: isView? Colors.black : Colors.white,
                            fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),

              Padding(
                padding: EdgeInsets.only(top: isBoxes ? 20 : 0),
                child: Container(
                  // height: isView ? contWidth * 0.7 : contWidth - 35,
                  height: contHeight-144,
                  // height: contHeight-180,
                  decoration: BoxDecoration(
                      color: Colors.red,
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
                                fontSize: 11, color: Colors.grey.shade600),
                          ),
                          Text(
                            'Базовый',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                    padding: const EdgeInsets.only(top: 5),
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
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Имя аватара',
                                        style: TextStyle(
                                          color: isView? Colors.black : Colors.white,
                                            fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                      isView == false
                                          ? Container()
                                          : Padding(
                                              padding: EdgeInsets.only(left: 50),
                                              child: Text(
                                                '1.6 SOL',
                                                style: TextStyle(
                                                  color: ConstColor.salad100,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      '#0863246',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                          fontSize: 12, color: ConstColor.grey),
                                    ),
                                  ),

                                ],
                              ),

                              isView? Container():
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: ConstColor.halfWhite
                                ),
                                child: IconButton(onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewProdAvatarPage()));
                                },
                                  icon: Icon(Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Colors.white,),
                                ),
                              )
                            ],
                          ),


                          isView
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '1.6 SOL',
                                    style: TextStyle(
                                        color: isView? Colors.black : ConstColor.salad100,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Wrap(
                              spacing: isView ? 80 : 10,
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Уровень 6',
                                  style: TextStyle(
                                      // fontSize: isView ? 11 : 10,
                                      fontSize: 12,
                                      color: ConstColor.grey),
                                ),
                                Text(
                                  isView ? '+150 баллов' : 'Баллы +150',
                                  style: TextStyle(
                                      // fontSize: isView ? 11 : 10,
                                    fontSize: 12,
                                      color: ConstColor.grey),
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
