import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int _active = 1;

  Widget miniContainer({required int position, required String text}) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(

      onTap: ((){
        setState(() {
          _active=position;
        });
      }),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: _active==position? 2 : 0)
        ),
        height: 40,
        // width: 100,
        child: Row(children: [

          Container(
            width: 40,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _active==position? Colors.grey.shade800 : Colors.grey.shade500,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(text, style: const TextStyle(fontSize: 12),),
          ),

          Icon(_active==position? Icons.arrow_drop_down: Icons.arrow_right_outlined)

        ],),
      ),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body:
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          // color: Colors.black87,
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text('Тимофей, 37', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),

                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                      child:
                      Container(
                            padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white70
                            ),
                            child:
                            const Text('я люблю веселиться 😁', style: TextStyle(fontSize: 11),)),
                      ),
                    ],)
                  ],),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child:

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // shrinkWrap: true,
                      // scrollDirection: Axis.horizontal,
                      children: [

                        miniContainer(position: 1, text: 'Профиль'),
                        miniContainer(position: 2, text: 'Шкаф'),
                        // miniContainer(position: 3, text: 'Встречи'),

                      ],
                    ),

                    // SingleChildScrollView(
                    //   physics: BouncingScrollPhysics(),
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     // shrinkWrap: true,
                    //     // scrollDirection: Axis.horizontal,
                    //     children: [
                    //
                    //       miniContainer(position: 1, text: 'Профиль'),
                    //       miniContainer(position: 2, text: 'Шкаф'),
                    //       // miniContainer(position: 3, text: 'Встречи'),
                    //
                    //     ],
                    //   ),
                    // ),

                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text('Имя аватара', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Text('Уровень "Базовый"', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 35),
                    child:
                      Container(
                        padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              shape: BoxShape.circle),
                          child: const Icon(Icons.check, size: 15, color: Colors.white,))
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 10),
                    child: Text('Готов к встрече', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                  ),

                ],
              ),
            ),
          ),
        ),


        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.transparent,
        //   elevation: 0,
        //   child:
        //   InkWell(
        //     onTap: ((){}),
        //     child: Container(
        //       margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        //       // width: MediaQuery.of(context).size.width*0.8,
        //       padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        //       decoration: BoxDecoration(
        //         color: Colors.grey.shade800,
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child:
        //       const Text('Принять', style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
        //
        //     ),
        //   ),
        // )
    );
  }

}