import 'package:flutter/material.dart';
import 'package:network_app/chat/chat_page.dart';
import 'package:network_app/profile/home_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 25),
      //   child: Container(
      //       decoration: const BoxDecoration(
      //           color: Colors.black, shape: BoxShape.circle),
      //       width: 65,
      //       height: 65,
      //       child: IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.tune_outlined,
      //           color: Colors.white,
      //         ),
      //         iconSize: 28,
      //       )),
      // ),
      backgroundColor: Colors.grey.shade400,

      // appBar: AppBar(
      //     toolbarHeight: 65,
      //     backgroundColor: Colors.grey.shade400,
      //     elevation: 0,
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       buttonBack(context),
      //
      //       Text('Сообщения', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
      //
      //       Container(
      //         // alignment: Alignment.topLeft,
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
      //             icon: const Icon(Icons.search, color: Colors.black, size: 25,)),
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 80),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonBack(context),
                    const Text(
                      'Сообщения',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      // alignment: Alignment.topLeft,
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              // Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            )),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            'Приглашения',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 20),
                          child: SingleChildScrollView(
                            // physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                            miniAvatar(),
                            miniAvatar(),
                            miniAvatar(),
                            miniAvatar(),
                            miniAvatar(),
                            miniAvatar(),
                            miniAvatar(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: miniAvatar(),
                            ),
                          ],),),
                        )

                      ],
                    ),
                  ),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 20, bottom: 20),
                //   child: Text('Приглашения', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                // ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      messageContainer(isOnline: true),
                      messageContainer(isOnline: false),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      messageContainer(isOnline: true),
                      messageContainer(isOnline: false),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      messageContainer(isOnline: true),
                      messageContainer(isOnline: false),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget miniAvatar() =>  Padding(
    padding: const EdgeInsets.only(left: 15,),
    child: InkWell(
      onTap: ((){
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ChatPage()));
      }),
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle),
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                iconSize: 20,
              )),

          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text('Джоли', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),),
          )

        ],
      ),
    ),
  );

  Widget messageContainer({required bool isOnline}) => InkWell(
    onTap: ((){
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ChatPage()));
    }),
        // padding: const EdgeInsets.only(bottom: 0),
        child:

        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 140,
                height: 150,
                // width: MediaQuery.of(context).size.width*0.35,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child:
                      Text('Джоли',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        'Запланированная встреча',
                        style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Text(
                              '12:48',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            width: 12,
                            height: 9,
                            child: Stack(
                              children: const [
                                Positioned(
                                    left: 4,
                                    child: Icon(Icons.check, size: 8,)),
                                Positioned(
                                    left: 0,
                                    child: Icon(Icons.check, size: 8,)),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Я предлагаю встретиться в каком-нибудь красивом...', style: TextStyle(fontSize: 10),),
                    )

                  ],
                ),
              ),
            ),


            SizedBox(
              height: 45,
              width: 45,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle),
                        width: 45,
                        height: 45,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          iconSize: 20,
                        )),
                  ),

                  Positioned(
                    right: 1,
                      bottom: 4,
                      child: Icon(Icons.circle, size: 12, color: isOnline? Colors.black : Colors.grey.shade400,))

                ],
              ),
            ),


          ],
        ),
      );
}
