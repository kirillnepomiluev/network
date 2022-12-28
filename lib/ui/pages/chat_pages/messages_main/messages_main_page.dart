import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/chat_pages/chat/chat_page.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesMainPage extends StatefulWidget {
  const MessagesMainPage({Key? key}) : super(key: key);

  @override
  State<MessagesMainPage> createState() => _MessagesMainPageState();
}

class _MessagesMainPageState extends State<MessagesMainPage> {
  @override
  Widget build(BuildContext context) {

    // final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaTop = MediaQuery.of(context).viewPadding.top;
//43


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    BackButtonCustom( func: (){}),

                    Text(
                      'Сообщения',
                      style: TextStyle(
                          // color: Colors.black,
                          fontSize: 19.5.sp,   //20
                          fontWeight: FontWeight.w600),
                    ),

                    IconContainer(
                      icon:  NetworkIcons.search,
                      iconSize:  16.sp,   //17
                    )

                    // Container(
                    //   width: contSize,
                    //   height: contSize,
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.shade300,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Center(
                    //     child: IconButton(
                    //         onPressed: () {
                    //           // Navigator.of(context).pop();
                    //         },
                    //         icon: Icon(
                    //           Network.search,
                    //           color: Colors.black,
                    //           size: 16.5.sp,   //18
                    //         )),
                    //   ),
                    // ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          'Приглашения',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                              fontSize: 16.5.sp  //14
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            for (var i=0; i<photoList.length; i++)
                              Padding(
                                padding: EdgeInsets.only(right: i==7? 15 : 0),
                                child: miniAvatar(photoMap: photoList[i]),
                              )

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
                padding: const EdgeInsets.only(bottom: 80),
                child: Wrap(
                  spacing: 0.04*mediaWidth, //15
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [

                    for (var i=0; i<photoList.length; i++)
                      messageContainer(photoMap: photoList[i]),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       messageContainer(isOnline: true),
              //       messageContainer(isOnline: false),
              //     ],
              //   ),
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       messageContainer(isOnline: true),
              //       messageContainer(isOnline: false),
              //     ],
              //   ),
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       messageContainer(isOnline: true),
              //       messageContainer(isOnline: false),
              //     ],
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }


  List<Map<String, dynamic>> photoList = [
    <String, dynamic>{
      'name' :   'Джоли',
      'status' :   'Запланирована встреча',
      'url' :   'assets/images/avatars/avatar_0.png',
      'online' : false,
    },

    <String, dynamic>{
      'name' : 'Станислав',
      'status' : 'Встреча проведена',
      'url' :  'assets/images/avatars/avatar_2.png',
      'online' : true,
    },

    <String, dynamic>{
      'name' : 'Меган',
      'status' : 'Приглашение на встречу',
      'url' :  'assets/images/avatars/avatar_1.png',
      'online' : false,
    },

    <String, dynamic>{
      'name' : 'Игорь',
      'status' :  'Запланирована встреча',
      'url' :  'assets/images/avatars/avatar_2.png',
      'online' : true,
    },

    <String, dynamic>{
      'name' :   'Джоли',
      'status' :   'Запланирована встреча',
      'url' :   'assets/images/avatars/avatar_0.png',
      'online' : false,
    },

    <String, dynamic>{
      'name' :   'Джоли',
      'status' :   'Запланирована встреча',
      'url' :   'assets/images/avatars/avatar_1.png',
      'online' : false,
    },

  ];

  Widget miniAvatar({required Map<String, dynamic> photoMap}) {

    const contWidth = 45.00;

    return Padding(
    padding: const EdgeInsets.only(left: 15,),
    child: InkWell(
      onTap: ((){
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ChatPage()));
      }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            width: contWidth,
            height: contWidth,
            child: Stack(
              children: [

                CustomCircleAvatar(
                  imageUrl: photoMap['url'] as String,
                  contSize: contWidth,
                ),

                // SizedBox(
                //   width: contWidth,
                //   height: contWidth,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     foregroundImage: AssetImage(
                //         photoMap['url'] as String
                //     ),
                //   ),
                // ),

                photoMap['online']==false? Container():
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.circle,
                    size: 12,
                    color: AppColors.salad100,),
                )

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(photoMap['name'] as String, style: TextStyle(
                fontSize: 14.sp,   //10
                // color: Colors.black,
                fontWeight: FontWeight.w400
            ),),
          )

        ],
      ),
    ),
  );
  }


  Widget messageContainer({required Map<String, dynamic> photoMap}) {

    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = 0.1626*mediaWidth; //43

    return InkWell(
    onTap: ((){
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ChatPage()));
    }),
        child:
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: mediaWidth*0.432,
                // height: 170,
                // width: MediaQuery.of(context).size.width*0.35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child:
                      Text(photoMap['name'] as String,
                          style: TextStyle(
                              fontSize: 17.5.sp, //16
                              // color: Colors.black,
                              fontWeight: FontWeight.w700
                          )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        photoMap['status'] as String,
                        style: TextStyle(
                            fontSize: 14.sp, //10
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16,),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              '12:48',
                              style: TextStyle(
                                  fontSize: 14.sp, //10
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          const Icon(
                            NetworkIcons.check_double,
                            size: 12,
                          color: AppColors.textGray,
                          )

                          // SizedBox(
                          //   width: 12,
                          //   height: 9,
                          //   child: Stack(
                          //     children: const [
                          //       Positioned(
                          //           left: 4,
                          //           child: Icon(Network.check_double, size: 8,)
                          //       ),
                          //       Positioned(
                          //           left: 0,
                          //           child: Icon(Icons.check, size: 8,)),
                          //     ],
                          //   ),
                          // ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 26),
                      child: Text('Я предлагаю встретиться в каком-нибудь красивом...', style: TextStyle(
                          fontSize: 15.5.sp,    //12,
                        fontWeight: FontWeight.w400
                      ),),
                    )

                  ],
                ),
              ),
            ),


            SizedBox(
              height: contSize,
              width: contSize,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child:
                      CustomCircleAvatar(
                        imageUrl: photoMap['url'] as String,
                        contSize: contSize,
                      )
                    // SizedBox(
                    //   width: contSize,
                    //   height: contSize,
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.white,
                    //     foregroundImage: AssetImage(
                    //         photoMap['url'] as String
                    //     ),
                    //   ),
                    // ),

                    // Container(
                    //     decoration: BoxDecoration(
                    //         color: Colors.grey.shade300,
                    //         shape: BoxShape.circle),
                    //     width: contSize,
                    //     height: contSize,
                    //     child: Icon(
                    //       Network.person,
                    //       color: Colors.black,
                    //       size: 19.sp,
                    //     ),
                    // ),

                  ),


                  photoMap['name'] == 'Станислав'? Container():
                  const Positioned(
                    right: 7,
                      bottom: 0,
                      child: Icon(
                        Icons.circle,
                        size: 14,   //14
                        color: AppColors.salad100,
                      )
                  )
                ],
              ),
            ),


          ],
        ),
      );
  }
}
