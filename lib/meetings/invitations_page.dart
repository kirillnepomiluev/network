import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/meetings/matching_page.dart';
import 'package:network_app/profile/home_page.dart';


class InvitationsPage extends StatefulWidget {
  const InvitationsPage({Key? key}) : super(key: key);

  @override
  State<InvitationsPage> createState() => _InvitationsPageState();
}

class _InvitationsPageState extends State<InvitationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
            ),
            width: 65,
            height: 65,
            child:
            IconButton(onPressed: (){}, icon: const Icon(Icons.tune_outlined, color: Colors.white,), iconSize: 28,)
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      body:
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                buttonBack(context),

                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text('Приглашения', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),

                viewInviteContainer(strType: 'Деловая встреча'),
                viewInviteContainer(strType: 'Общение'),
                viewInviteContainer(strType: 'Свидание'),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget viewInviteContainer({required String strType}) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Center(child:
                Text(strType, style: const TextStyle(color: Colors.white, fontSize: 10),)
                ),
              ),

              Text('2 ч назад', style: TextStyle(fontSize: 12, color: Colors.grey.shade500),)

            ],
          ),



          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [

                Text('Джоли, 28',
                    style: TextStyle(
                        fontSize: 15,
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
            padding: const EdgeInsets.only(top: 20, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              Row(children: [

                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle
                    ),
                    width: 70,
                    height: 70,
                    child:
                    IconButton(onPressed: (){}, icon: const Icon(
                      Network.person, color: Colors.black,), iconSize: 28,)
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          width: 17,
                          height: 17,
                          child:
                          const Icon(Icons.call_received, size: 11, color: Colors.white,),
                      ),

                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('250 м', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    )

                  ],),
                )

              ],),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade500,
                        // shape: BoxShape.circle
                    ),
                    width: 50,
                    height: 70,
                    child:
                    IconButton(onPressed: (){

                      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const MatchingPage()));

                    }, icon: const Icon(Icons.arrow_right_alt_rounded, color: Colors.black,), iconSize: 30,)
                ),

            ],),
          )


          //
          // Padding(
          //   padding: const EdgeInsets.only(top: 20),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: const [
          //
          //       Text('250 м в направлении',
          //           style: TextStyle(
          //               fontSize: 12,
          //               color: Colors.black,
          //               fontWeight: FontWeight.w500
          //           )
          //       ),
          //
          //       Padding(
          //         padding: EdgeInsets.only(left: 8),
          //         child: Icon(Icons.arrow_circle_right, color: Colors.black, size: 20,),
          //       ),
          //     ],
          //   ),
          // ),
          //
          // Padding(
          //   padding: const EdgeInsets.only(top: 10, bottom: 30),
          //   child:
          //   Container(
          //       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          //       decoration: BoxDecoration(
          //           color: Colors.grey.shade400,
          //           borderRadius: BorderRadius.circular(15)
          //       ),
          //       child: const Text('Открыть карту', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),)),
          // ),
          //
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20,),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Container(
          //           decoration: const BoxDecoration(
          //               color: Colors.black,
          //               shape: BoxShape.circle
          //           ),
          //           width: 40,
          //           height: 40,
          //           child:
          //           IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined, color: Colors.white,), iconSize: 18,)
          //       ),
          //
          //
          //       Container(
          //         width: 175,
          //         padding: const EdgeInsets.all(3),
          //         decoration: BoxDecoration(
          //
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.5),
          //                 spreadRadius: 2,
          //                 blurRadius: 7,
          //                 offset: Offset(0, 3), // changes position of shadow
          //               ),
          //             ],
          //
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(30)
          //         ),
          //
          //         child:
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Container(
          //                 decoration: const BoxDecoration(
          //                     color: Colors.black,
          //                     shape: BoxShape.circle
          //                 ),
          //                 width: 38,
          //                 height: 38,
          //                 child:
          //                 IconButton(onPressed: (){}, icon: const Icon(Icons.electric_bolt_sharp, color: Colors.white,), iconSize: 18,)
          //             ),
          //
          //             const Text('Встретиться', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
          //
          //             // Icon(Icons.keyboard_arrow_right, size: 15, color: Colors.grey.shade500,),
          //             // Icon(Icons.keyboard_arrow_right, size: 16, color: Colors.grey.shade800,),
          //
          //             Padding(
          //               padding: const EdgeInsets.only(right: 12),
          //               child: Icon(Icons.keyboard_double_arrow_right, size: 16, color: Colors.grey.shade800,),
          //             ),
          //
          //           ],)
          //         ,),
          //
          //
          //       Container(
          //           decoration: const BoxDecoration(
          //               color: Colors.black,
          //               shape: BoxShape.circle
          //           ),
          //           width: 40,
          //           height: 40,
          //           child:
          //           IconButton(onPressed: (){}, icon: const Icon(Icons.star_border_outlined, color: Colors.white,), iconSize: 18,)
          //       ),
          //
          //     ],
          //   ),
          // )
          //

        ],),
    ),
  );

  // Widget _statColumn() => Container(
  //   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 15),
  //   child:
  //   Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(top: 0, bottom: 0),
  //         child: Center(
  //           child: Container(
  //             // alignment: Alignment.center,
  //             width: 35,
  //             height: 4,
  //             decoration: BoxDecoration(
  //                 color: Colors.grey.shade400,
  //                 borderRadius: BorderRadius.circular(15)
  //             ),),
  //         ),
  //       ),
  //
  //       titleStatText('Статус'),
  //       textField('Sed aenean est eget sit eget at tellus sed.', isEnable: false),
  //
  //       titleStatText('Базовые данные'),
  //       textField('Женщина, 37 лет, свободна, цель встречи: деловая.', isEnable: false),
  //
  //
  //       titleStatText('Интересы'),
  //       Wrap(
  //         spacing: 8,
  //         runSpacing: 10,
  //         direction: Axis.horizontal,
  //         children: [
  //           hobbitsContainer('Большой теннис'),
  //           hobbitsContainer('Маркетинг'),
  //           hobbitsContainer('Управление'),
  //           hobbitsContainer('Маркетинг'),
  //           hobbitsContainer('Большой теннис'),
  //
  //         ],),
  //
  //       titleStatText('Обо мне'),
  //       textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),
  //
  //       titleStatText('Сфера деятельности'),
  //       textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
  //
  //     ],),
  //
  // );

}
