import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/store/view_prod_hat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'dart:ui' as ui;

class ViewCategoryHatsPage extends StatefulWidget {
  const ViewCategoryHatsPage({Key? key}) : super(key: key);

  @override
  State<ViewCategoryHatsPage> createState() => _ViewCategoryHatsPageState();
}

class _ViewCategoryHatsPageState extends State<ViewCategoryHatsPage> {
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

    final mediaWidth = MediaQuery.of(context).size.width;

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
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: backButton(context),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Головные уборы',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(Constants.strLoremIpsum,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ),

                //Выбор интерфейса
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 24, bottom: 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        miniContainer(position: 1, text: 'Цена'),
                        miniContainer(position: 2, text: 'Категория'),
                        miniContainer(position: 3, text: 'Сортировка'),
                      ],
                    ),
                  ),
                ),

                Wrap(
                  spacing: 0.024*mediaWidth, //9
                  runSpacing: 0.024*mediaWidth,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [

                    for (var i=0; i<6; i++)
                      hatContainer(
                        isView: true,
                        context: context,
                      ),

                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget hatContainer({
  bool isView = false,
  required BuildContext context,
  String strCategory = 'Обычный'
}) {

  final mediaWidth = MediaQuery.of(context).size.width;
  final double contWidth = isView
      ? 0.445*mediaWidth          //167
      : 0.37*mediaWidth;   //138.82
  final double imageHeight = isView? contWidth*0.65 : contWidth;
  // final double imageHeight = contWidth; //131


  return Padding(
      padding: EdgeInsets.only(right:  isView? 0 : 15),
      child: InkWell(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const ViewProdHatPage()));
        }),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isView? Colors.white : ConstColor.halfWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          // height: contHeight,
          width: contWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 27,
                ),
                child: Text(
                  strCategory,
                  style: TextStyle(
                    color: isView? Colors.black : Colors.white,
                    fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),

              Container(
                height: imageHeight,  // contHeight- 120.1,
                decoration: BoxDecoration(
                  // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/${strCategory=='Обычный'? '4': '3'}.png')
                    ),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: Text(
                  '1.6 SOL',
                  style: TextStyle(
                      color: isView? Colors.black : ConstColor.salad100,
                      fontSize: 18.5.sp, //16
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,),
                child: Text(
                  '#0863246',
                  style: TextStyle(
                      fontSize: 15.5.sp, //12
                      fontWeight: FontWeight.w400,
                      color: ConstColor.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
