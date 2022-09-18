import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/store/view_prod_avatar_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'dart:ui' as ui;

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
                    style: TextStyle(
                        fontSize: 16.5.sp,   //14
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 16.5.sp,   //14
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
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 34),
                  child: backButton(context),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 13),
                  child: Text(
                    'Аватары',
                    style: TextStyle(
                        fontSize: 24.sp,   //30
                        fontWeight: FontWeight.w700
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),

                const Text(Constants.strLoremIpsum,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
                      ),

                      avatarContainer(
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
            builder: (context) => const ViewProdAvatarPage()));
      }),
      child: Container(
        // height: isBoxes? 220 : null,
        // padding: EdgeInsets.all(isView ? 30 : 15),
        padding: isView? const EdgeInsets.all(35) :
        const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 9),

        decoration: BoxDecoration(
          color: isView? Colors.white : ConstColor.halfWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        // height: contHeight,
        width: contWidth,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            isBoxes
                ? Container()
                : Padding(
              padding: EdgeInsets.only(
                bottom: isView? 20 : 5,
              ),
              child: Text(
                strCategory,
                style: TextStyle(
                    color: isView? Colors.black : Colors.white,
                    fontSize: 16.5.sp,  //14

                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: isBoxes? 20 : 0),
              child: Container(
                // height: isView? 254.4 : 220,
                height: imageHeight,

                decoration: BoxDecoration(
                  // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/${strCategory=='Обычный'? '4': '3'}.png')
                    ),
                    // color: Colors.red,
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
                        color: Colors.grey.shade600),
                  ),
                  Text(
                    'Базовый',
                    style: TextStyle(
                        fontSize: 14.sp, //11
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
                : Padding(
              padding: EdgeInsets.only(top: isView? 27 : 12),
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
                                    fontSize: 16.5.sp, //14
                                    fontWeight: FontWeight.w400),
                              ),
                              isView == false
                                  ? Container()
                                  : Padding(
                                padding: EdgeInsets.only(left: mediaWidth*0.1466), //55
                                child: Text(
                                  '1.6 SOL',
                                  style: TextStyle(
                                      color: isView? Colors.black : ConstColor.salad100,
                                      fontSize: 17.sp,   //16
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              '#0863246',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp, //12
                                  color: ConstColor.grey),
                            ),
                          ),

                        ],
                      ),

                      isView? Container():
                      Container(
                        width: 0.1013*mediaWidth,   //38
                        height: 0.1013*mediaWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: ConstColor.halfWhite
                        ),
                        child: IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewProdAvatarPage()));
                        },
                          icon: Icon(Icons.keyboard_arrow_right,
                            size: 18.sp,   //20
                            color: Colors.white,),
                        ),
                      )
                    ],
                  ),

                  isView
                      ? Container()
                      : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '1.6 SOL',
                      style: TextStyle(
                          color: isView? Colors.black : ConstColor.salad100,
                          fontSize: 17.5.sp,   //16
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Wrap(
                      spacing: isView ? 0.2133*mediaWidth : 10, //80
                      direction: Axis.horizontal,
                      // alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          'Уровень 6',
                          style: TextStyle(
                              fontSize: 15.5.sp, //12
                              color: ConstColor.grey),
                        ),
                        Text(
                          isView ? '+150 баллов' : 'Баллы +150',
                          style: TextStyle(
                              fontSize: 15.5.sp, //12
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

}
