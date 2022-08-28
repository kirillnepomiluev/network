import 'package:flutter/material.dart';
import 'package:network_app/meetings/invitations_page.dart';
import 'package:network_app/profile/home_page.dart';
import 'package:network_app/profile/view_partner_profile_page.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({Key? key}) : super(key: key);

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {

  int _activeMeetingTab = 1;

  Widget miniContainer({required int position, required String text,}) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(
      onTap: ((){

        setState(() {
            _activeMeetingTab = position;
        });

      }),
      child: Container(
        decoration: BoxDecoration(
            color: _activeMeetingTab==position? Colors.grey.shade500 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            // border: isMeeting? null : Border.all(width: _activeProfileTab==position? 2 : 0)
        ),
        height: 35,
        // width: 100,
        child: Row(children: [

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(text, style: TextStyle(fontSize: 10),),
          ),

          position !=3 ? Container():
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.arrow_drop_down
                // Icons.arrow_right_outlined
            ),
          )

        ],),
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                InkWell(
                  onTap: ((){
                    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewPartnerProfilePage()));
                  }),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [

                          Text('Джоли, 28',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              )
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.verified, color: Colors.white, size: 16,),
                          ),

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('Уровень "Базовый"', style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.bold),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text('ищу партнера для бизнеса', style: TextStyle(fontSize: 10),),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
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

                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 7,
                          //     offset: Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],

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
                              IconButton(onPressed: (){}, icon: const Icon(Icons.email_outlined, color: Colors.white,), iconSize: 18,)
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


              ],
            ),
          ),
        ),
        extendBody: true,
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child:
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Верхняя часть Для вас:
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              // color: Colors.black87,
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: (){
                                  // setState(() {
                                    // _activeProfileTab = 1;
                                  // });
                                },
                                icon: const Icon(Icons.person_outline, size: 20,),
                              ),
                            ),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  // color: Colors.black87,
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const InvitationsPage()));
                                    },
                                    icon: const Icon(Icons.notifications_outlined, size: 20,),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child:
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 10,
                                        bottom: 10
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    child:
                                    Row(
                                      children: const [

                                        Text('02:04:15',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold
                                          ),),

                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Icon(Icons.incomplete_circle, size: 16,),
                                        )
                                      ],
                                    )),
                              ),
                            ],)
                        ],),

                      //Выбор интерфейса
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child:
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                miniContainer(position: 1, text: 'Для вас', ),
                                miniContainer(position: 2, text: 'По близости', ),
                                miniContainer(position: 3, text: 'Деловая встреча',),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Нижняя часть
                InkWell(
                  onTap: ((){
                    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewPartnerProfilePage()));
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    child:

                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            // alignment: Alignment.topLeft,
                            // width: 73,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.circle, color: Colors.greenAccent, size: 8,),
                                Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text('Онлайн', style: TextStyle(fontSize: 10, color: Colors.white),),
                                )
                              ],),),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),

        ),
      );
  }


}