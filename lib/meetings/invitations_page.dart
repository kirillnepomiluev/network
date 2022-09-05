import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/matching_page.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/components/network_icons.dart';


class InvitationsPage extends StatefulWidget {
  const InvitationsPage({Key? key}) : super(key: key);

  @override
  State<InvitationsPage> createState() => _InvitationsPageState();
}

class _InvitationsPageState extends State<InvitationsPage> {

  int _activeInvitationTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(
      onTap: (() {
        setState(() {
          _activeInvitationTab = position;
        });
      }),
      child: Container(
        decoration: BoxDecoration(
          color: _activeInvitationTab == position
              ? ConstColor.grey
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          // border: isMeeting? null : Border.all(width: _activeProfileTab==position? 2 : 0)
        ),
        // height: 35,
        // width: 100,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: position==3?
              const EdgeInsets.only(left: 14, bottom: 14, top: 14, right: 0)
                  : const EdgeInsets.all(14),
              child: Text(
                text,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            position != 3
                ? Container()
                : const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.arrow_drop_down
                // Icons.arrow_right_outlined
              ),
            )
          ],
        ),
      ),
    ),
  );



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
            width: 69,
            height: 69,
            child:
            IconButton(onPressed: (){}, icon: const Icon(Network.tune
              , color: Colors.white,), iconSize: 20,)
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

                backButton(context),

                // const Padding(
                //   padding: EdgeInsets.only(top: 20, bottom: 20),
                //   child: Text('Приглашения', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                // ),

                //Выбор интерфейса
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      miniContainer(
                        position: 1,
                        text: 'Пригашения',
                      ),
                      miniContainer(
                        position: 2,
                        text: 'Друзья',
                      ),

                    ],
                  ),
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
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 21),
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Center(child:
                Text(strType, style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),)
                ),
              ),


              _activeInvitationTab==2?
              Text('2 ч назад', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: ConstColor.grey3),)
                  :
              strType=='Деловая встреча'?
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  children: [
                    Text('Готов к встрече', style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),),

                    Padding(
                      padding: const EdgeInsets.only(left: 5.75),
                      child: Icon(Icons.check_circle, size: 16, color: Colors.black,),
                    )
                  ],
                ),
              )
                  :
              Container(
                  width: 110.57,
                  height: 39.57,
                  padding: const EdgeInsets.only(
                      left: 17,
                      right: 17,
                      top: 10,
                      bottom: 10
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '02:04:15',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.incomplete_circle,
                          size: 16,
                        ),
                      )
                    ],
                  )),


            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [

                Text('Джоли, 28',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    )
                ),

                Padding(
                  padding: EdgeInsets.only(left: 5.75),
                  child: Icon(Icons.verified, color: Colors.black, size: 16,),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Уровень "Базовый"', style: TextStyle(
                    fontSize: 14, color: ConstColor.grey3, fontWeight: FontWeight.w400),),

                Text('+150 баллов', style: TextStyle(
                    fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 29,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              Row(children: [

                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle
                    ),
                    width: 83,
                    height: 83,
                    child:
                    IconButton(onPressed: (){}, icon: const Icon(
                      Network.person, color: Colors.black,), iconSize: 28,)
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          width: 20,
                          height: 20,
                          child:
                          const Icon(Icons.call_received, size: 12, color: Colors.white,),
                      ),

                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('250 м', style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),),
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
                    width: 66,
                    height: 92,
                    child:
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(onPressed: (){

                        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const MatchingPage()));

                      },
                        icon: const Icon(
                          Network.arrow_right_long, color: Colors.black,),
                        iconSize: 14,),
                    )
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
