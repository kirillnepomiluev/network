import 'package:flutter/material.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/profile/profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ViewProdAvatarPage extends StatefulWidget {
  const ViewProdAvatarPage({Key? key}) : super(key: key);

  @override
  State<ViewProdAvatarPage> createState() => _ViewProdAvatarPageState();
}

class _ViewProdAvatarPageState extends State<ViewProdAvatarPage> {


  @override
  Widget build(BuildContext context) {

    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade400,

        bottomNavigationBar:
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              // borderRadius: BorderRadius.vertical(top: Radius.circular(35))
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04266*mediaWidth),    //16
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 0.08*mediaWidth),    //30
                  child: Text('1.6 SOL', style: TextStyle(
                      fontSize: 18.sp, //16
                      fontWeight: FontWeight.w600),),
                ),

                SizedBox(
                  width: 0.6533*mediaWidth,   //245
                  height: 0.6533*mediaWidth*0.2245,   //55
                  child: ElevatedButton(
                      style: ButtonStyle(
                        // padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 22)),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: (){}, child: Text('Купить сейчас', style: TextStyle(
                      fontSize: 18.sp,   //16
                      color: Colors.white,
                    fontWeight: FontWeight.w600

                  ),)),
                )


              ],
            ),
          ),

        ),


      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  viewProdImage(context),

                  _statColumn()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _statColumn() => Container(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
    child:
    Column(
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

        titleStatText('Уровень Базовый'),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            progressParametr(context : context,
                text1: '5 встреч',
                text2: 'Еще 25 встреч',
                progress: 0.25,
                isMeetingRow: true
            ),

            titleStatText('Статистика'),

            progressParametr(context : context,
                text1: 'Энергии на встречи',
                text2: '3/5'
            ),

            progressParametr(context : context,
                text1: 'Скорость восстановления',
                text2: 'x1.5'
            ),

            progressParametr(context : context,
                text1: 'Баллы за встречи',
                text2: '150'
            ),

            progressParametr(context : context,
                text1: 'Количество сообщений в день',
                text2: '200'
            ),

            progressParametr(context : context,
                text1: 'Количество лайков в день',
                text2: '50'
            ),
          ],
        ),

      ],),

  );

}