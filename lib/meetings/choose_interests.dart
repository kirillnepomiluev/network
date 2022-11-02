import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/meetings/invitations_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/meetings/meetings_page.dart';
import 'package:network_app/meetings/notifications_page.dart';
import 'package:network_app/meetings/timer_page.dart';
import 'package:network_app/profile/view_partner_profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ChooseInterestsPage extends StatefulWidget {
  const ChooseInterestsPage({Key? key}) : super(key: key);

  @override
  State<ChooseInterestsPage> createState() => _ChooseInterestsPageState();
}

class _ChooseInterestsPageState extends State<ChooseInterestsPage> {

  final _controller = TextEditingController();

  Widget _textEditor() => TextField(
    maxLines: 1,
    controller: _controller,
    textInputAction: TextInputAction.done,
    textAlign: TextAlign.start,
    autofocus: false,
    style: TextStyle(
      fontSize: getResSize(14),
      // color: ConstColor.textWhite
    ),
    decoration: InputDecoration(
      counterText: '',
      // focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(width: 0, color: Colors.white70),
      //     borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
      // ),
      // enabledBorder:

      // OutlineInputBorder(
      //     borderSide: BorderSide(width: 0, color: Colors.white70),
      //     borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
      //   // borderRadius: BorderRadius.circular(15)
      // ),
      // filled: true,
      // fillColor: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton:
        SizedBox(
          width: 0.472*mediaWidth,  //177
          height: 0.076*mediaHeight,               //55
          child: ElevatedButton(
              style: buttonStyleCustom(
                  padH: 0,
                  padV: 0,
                  radius: 17
              ),
              onPressed: () {},
              child: Text(
                'Найти',
                style:
                TextStyle(
                    fontSize: 18.sp,     //16
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
              )),
        ),
      extendBody: true,
      // backgroundColor: ConstColor.blackBack,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //appBar
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        BackButtonCustom(),
                        Center(child: Text('Выберете интересы',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.5.sp,   //18
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ))
                      ],
                    ),
                  ),

                  //Поиск
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 18),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 43,
                      decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: EdgeInsets.only(
                                left: 5,
                                right: 15
                            ),
                            child:
                            Icon(
                              Network.search,
                              size: getResSize(14),
                              color: Colors.white,
                            ),
                          ),

                          Expanded(child: _textEditor()),
                        ],
                      ),
                    ),
                  ),


                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    direction: Axis.horizontal,
                    children: [

                      for (final item in Constants.hobbiesList)
                        HobbySelected(title: item,),

                    ],
                  ),


                  // Padding(
                  //   padding: const EdgeInsets.only(top: 45, bottom: 100),
                  //   child:
                  //
                  //   SizedBox(
                  //     width: 0.472*mediaWidth,  //177
                  //     height: 0.076*mediaHeight,               //55
                  //     child: ElevatedButton(
                  //         style: buttonStyleCustom(
                  //             padH: 0,
                  //             padV: 0,
                  //             radius: 17
                  //         ),
                  //         onPressed: () {},
                  //         child: Text(
                  //           'Найти',
                  //           style:
                  //           TextStyle(
                  //               fontSize: 18.sp,     //16
                  //               fontWeight: FontWeight.w600,
                  //               color: Colors.white
                  //           ),
                  //         )),
                  //   ),
                  //
                  //
                  //   // ElevatedButton(
                  //   //     style: ButtonStyle(
                  //   //       padding: MaterialStateProperty.all(
                  //   //           const EdgeInsets.symmetric(vertical: 18, horizontal: 64)),
                  //   //       backgroundColor:
                  //   //       MaterialStateProperty.all(Colors.black),
                  //   //       shape: MaterialStateProperty.all(
                  //   //         RoundedRectangleBorder(
                  //   //           borderRadius: BorderRadius.circular(17),
                  //   //         ),
                  //   //       ),
                  //   //     ),
                  //   //     onPressed: () {},
                  //   //     child: Text(
                  //   //       'Найти',
                  //   //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  //   //     )),
                  //
                  // ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
