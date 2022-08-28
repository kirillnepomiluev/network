import 'package:flutter/material.dart';
import 'package:network_app/profile/home_page.dart';


class ViewProdAvatarPage extends StatefulWidget {
  const ViewProdAvatarPage({Key? key}) : super(key: key);

  @override
  State<ViewProdAvatarPage> createState() => _ViewProdAvatarPageState();
}

class _ViewProdAvatarPageState extends State<ViewProdAvatarPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     shape: const Border(
    //     bottom: BorderSide(
    //     color: Colors.white,
    //     width: 0
    // )),
    //     toolbarHeight: 65,
    //     backgroundColor: Colors.white,
    //     elevation: 0,
    //     automaticallyImplyLeading: false,
    //     title: Container(
    //       width: 55,
    //       height: 55,
    //       decoration: BoxDecoration(
    //         color: Colors.grey.shade200,
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //       child: Center(child:
    //       IconButton(
    //           onPressed: (){
    //             Navigator.of(context).pop();
    //           },
    //           icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
    //       ),
    //     ),
    //   ),
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text('1.6 SOL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: (){}, child: const Text('Купить сейчас', style: TextStyle(fontSize: 16),)),
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
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewAvatarContainer(),

                    _statColumn()

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget viewAvatarContainer() => Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(10),
    // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 100),
    // padding: EdgeInsets.all(30),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: buttonBack(context),
        ),

        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10)
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 30),
          child:
          Text('Аватар', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 10),
          child:
          Text('Имя аватара', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 25),
          child:
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Text('Категория', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),)),
        ),

      ],),
  );


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