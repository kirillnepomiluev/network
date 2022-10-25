import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/store/view_prod_avatar_page.dart';
import 'package:network_app/store/view_prod_hat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'dart:ui' as ui;

class ViewCategoryHatsPage extends StatefulWidget {
  const ViewCategoryHatsPage({Key? key}) : super(key: key);

  @override
  State<ViewCategoryHatsPage> createState() => _ViewCategoryHatsPageState();
}

class _ViewCategoryHatsPageState extends State<ViewCategoryHatsPage> {
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

    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ConstColor.blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      BackButtonCustom(),
                      Center(child: Text('Головные уборы',
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

                Wrap(
                  spacing: 0.024*mediaWidth, //9
                  runSpacing: 0.024*mediaWidth,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [

                    for (var i=0; i<6; i++)
                      hatContainer(
                        strCategory: i==0 || i==3? 'Редкий' : 'Обычный',
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

  return Padding(
      padding: EdgeInsets.only(right:  isView? 0 : 15),
      child: InkWell(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const ViewProdAvatarPage(
                  title: 'Шляпа ведьмы',
                  imageURL: 'assets/images/avatars/hat_1.png'
              )));
        }),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ConstColor.white10,
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
                    color: Colors.white,
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
                        image: AssetImage(
                            'assets/images/avatars/hat_${strCategory=='Обычный'? '2': '1'}.png'
                        )
                    ),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: Text(
                  '1.6 SOL',
                  style: TextStyle(
                      color: ConstColor.salad100,
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
                      color: ConstColor.whiteText
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
