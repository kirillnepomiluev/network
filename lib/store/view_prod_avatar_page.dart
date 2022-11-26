import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/profile/profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewProdAvatarPage extends StatefulWidget {
  final String title;
  final String imageURL;
  const ViewProdAvatarPage({Key? key, required this.title, required this.imageURL}) : super(key: key);

  @override
  State<ViewProdAvatarPage> createState() => _ViewProdAvatarPageState();
}

class _ViewProdAvatarPageState extends State<ViewProdAvatarPage> {


  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      // backgroundColor: ConstColor.blackBack,
      bottomNavigationBar: BlurryContainer(
        blur: 50,
        width: MediaQuery.of(context).size.width,
        height: 105,
        color: ConstColor.black1A.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: EdgeInsets.only(
                left: 37,
                  right: 0.08 * mediaWidth)
              , //30
              child: Text(
                '1.6 SOL',
                style: TextStyle(
                    color: ConstColor.salad100,
                    fontSize: 18.sp, //16
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  onPressed: () {
                    openSuccessSheet(context: context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15
                    ),
                    child: Text(
                      'Купить сейчас',
                      style: TextStyle(
                          fontSize: 18.sp, //16
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  )),
            )

          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewProdImage(),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 31),
                child: const StatColumn(ifProfileSheet: false),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget viewProdImage() {
    final mediaWidth = MediaQuery.of(context).size.width;
    // final imageWidth = 0.624 * mediaWidth;

    return Container(
      width: mediaWidth,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ConstColor.white10,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          BackButtonCustom(),

          Container(
            height: 270,
            child: Image.asset(
        widget.imageURL,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
            widget.title,
            style: TextStyle(
                      color: ConstColor.salad100,
                      fontSize: 26, //14
                      fontWeight: FontWeight.w600
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    '#0863246',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24, //12
                      // color: ConstColor.textWhite,
                    ),
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 20),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: ConstColor.white10,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Редкий',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, //14
                      fontWeight: FontWeight.w400
                  ),
                )),
          ),

        ],
      ),
    );
  }

}





void openSuccessSheet({required BuildContext context,}) {

  final mediaTop = MediaQuery.of(context).viewPadding.top;
  final mediaHeight = MediaQuery.of(context).size.height;
  final mediaWidth = MediaQuery.of(context).size.width;
  final _height = mediaHeight*0.9;

  showModalBottomSheet<void>(
    barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (BuildContext context) => BlurryContainer(
        blur: 60,
        color: Colors.black.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Icon(
                  Network.check_circle_outlined,
                  size: 100,
                  color: ConstColor.salad100,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: BuildRichTextTwo(
                    text1: 'Оплата прошла ',
                    text2: 'успешно',
                    // fontSize: 20,
                  fontWeight1: FontWeight.w400,
                  fontWeight2: FontWeight.w700,
                ),
              ),


              const Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text('Новый головной убор вы можете\nнайти в своем шкафу',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(
                          color: Colors.white,
                          padH: 0, padV: 22, radius: 20),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
                            builder: (context) => const HomePage(initIndex: 1, isCupboard: true,)));
                      },
                      child: Text(
                        'Перейти в шкаф',
                        style: TextStyle(
                            fontSize: 18.5.sp, //18
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      )),
                ),
              ),


            ],
          ),
        ),
      )
  );
}