import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/profile/home_page.dart';


class ViewPartnerProfilePage extends StatefulWidget {
  const ViewPartnerProfilePage({Key? key}) : super(key: key);

  @override
  State<ViewPartnerProfilePage> createState() => _ViewPartnerProfilePageState();
}

class _ViewPartnerProfilePageState extends State<ViewPartnerProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shape: Border(
      //       bottom: BorderSide(
      //           color: Colors.grey.shade100,
      //           width: 0
      //       )),
      //   toolbarHeight: 65,
      //   backgroundColor: Colors.grey.shade100,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Container(
      //         width: 55,
      //         height: 55,
      //         decoration: BoxDecoration(
      //           color: Colors.grey.shade300,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Center(child:
      //         IconButton(
      //             onPressed: (){
      //               Navigator.of(context).pop();
      //             },
      //             icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
      //         ),
      //       ),
      //
      //
      //       Container(
      //         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      //         decoration: BoxDecoration(
      //           color: Colors.grey.shade500,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //
      //         child: Center(child:
      //         Text('Деловая встреча', style: TextStyle(color: Colors.white, fontSize: 10),)
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.grey.shade400,

      // bottomNavigationBar:
      // Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: 80,
      //   decoration: BoxDecoration(
      //     color: Colors.grey.shade300,
      //     // borderRadius: BorderRadius.vertical(top: Radius.circular(35))
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 20, right: 20),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         const Padding(
      //           padding: EdgeInsets.only(right: 30),
      //           child: Text('1.6 SOL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      //         ),
      //         Expanded(
      //           child: ElevatedButton(
      //               style: ButtonStyle(
      //                 padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
      //                 backgroundColor: MaterialStateProperty.all(Colors.black),
      //                 shape: MaterialStateProperty.all(
      //                   RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(15),
      //                   ),
      //                 ),
      //               ),
      //               onPressed: (){}, child: const Text('Купить сейчас', style: TextStyle(fontSize: 16),)),
      //         )
      //
      //
      //       ],
      //     ),
      //   ),
      //
      // ),


      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              viewAvatarContainer(),

              _statColumn()

            ],
          ),
        ),
      ),
    );
  }



  Widget viewAvatarContainer() => Padding(
    padding: const EdgeInsets.only(bottom: 0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child:
                IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
                ),
              ),


              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Center(child:
                Text('Деловая встреча', style: TextStyle(color: Colors.white, fontSize: 10),)
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [

                Text('Джоли, 28',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                ),

                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.verified, color: Colors.black, size: 16,),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('Уровень "Базовый"', style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.bold),),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Text('250 м в направлении',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child:
                  // Icon(Icons.arrow_circle_right, color: Colors.black, size: 20,),

                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                    width: 17,
                    height: 17,
                    child:
                    const Icon(Icons.call_received, size: 11, color: Colors.white,), //Icons.turn
                  ),

                ),
              ],
            ),
          ),

          // const Padding(
          //   padding: EdgeInsets.only(top: 30),
          //   child:
          //   Text('Аватар', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
          // ),


          // const Padding(
          //   padding: EdgeInsets.only(top: 10),
          //   child:
          //   Text('Имя аватара', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child:
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Text('Открыть карту', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),)),
          ),


          Padding(
            padding: const EdgeInsets.only(bottom: 20,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                    width: 40,
                    height: 40,
                    child:
                    IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined, color: Colors.white,), iconSize: 18,)
                ),


                Container(
                  width: 175,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          width: 38,
                          height: 38,
                          child:
                          IconButton(onPressed: (){}, icon: const Icon(
                            Network.electric,
                            color: Colors.white,), iconSize: 18,)
                      ),

                      const Text('Встретиться', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),

                      // Icon(Icons.keyboard_arrow_right, size: 15, color: Colors.grey.shade500,),
                      // Icon(Icons.keyboard_arrow_right, size: 16, color: Colors.grey.shade800,),

                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(Icons.keyboard_double_arrow_right, size: 16, color: Colors.grey.shade800,),
                      ),

                    ],)
                  ,),


                Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                    width: 40,
                    height: 40,
                    child:
                    IconButton(onPressed: (){}, icon: const Icon(Icons.star_border_outlined, color: Colors.white,), iconSize: 18,)
                ),

              ],
            ),
          )

        ],),
    ),
  );


  Widget _statColumn() => Container(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 15),
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

        titleStatText('Статус'),
        textField('Sed aenean est eget sit eget at tellus sed.', isEnable: false),

        titleStatText('Базовые данные'),
        textField('Женщина, 37 лет, свободна, цель встречи: деловая.', isEnable: false),


        titleStatText('Интересы'),
        Wrap(
          spacing: 8,
          runSpacing: 10,
          direction: Axis.horizontal,
          children: [
            hobbitsContainer('Большой теннис'),
            hobbitsContainer('Маркетинг'),
            hobbitsContainer('Управление'),
            hobbitsContainer('Маркетинг'),
            hobbitsContainer('Большой теннис'),

          ],),

        titleStatText('Обо мне'),
        textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),

        titleStatText('Сфера деятельности'),
        textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),

      ],),

  );

}
