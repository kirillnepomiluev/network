import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/pages/meeting_pages/creqte_request_pages/choose_meeting_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class MeetInterestsChoose extends StatefulWidget {
  const MeetInterestsChoose({Key? key,}) : super(key: key);

  @override
  State<MeetInterestsChoose> createState() => _MeetInterestsChooseState();
}

class _MeetInterestsChooseState extends State<MeetInterestsChoose> {

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
    decoration: const InputDecoration(
      counterText: '',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: buttonStyleCustom(
                  color: Colors.white,
                  padH: 0, padV: 22, radius: 20),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => const ChooseMeetingDate()));
              },
              child: Text(
                'Продолжить',
                style: TextStyle(
                    fontSize: 18.5.sp, //18
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              )),
        ),
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const BackButtonCustom(),
                        Center(child: Text('Создание личного запроса',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.5.sp,   //18
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                      ],
                    ),
                  ),


                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
                        child:
                        BuildRichTextTwo(text1: 'Выберете ', text2: 'интересы', fontSize: 20.sp, fontWeight1: FontWeight.w500, fontWeight2: FontWeight.w500,),
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
                            padding: const EdgeInsets.only(
                                left: 5,
                                right: 15
                            ),
                            child:
                            Icon(
                              NetworkIcons.search,
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

                  const SizedBox(height: 100,)

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //         style: buttonStyleCustom(
                  //             color: Colors.white,
                  //             padH: 0, padV: 22, radius: 20),
                  //         onPressed: () {
                  //           Navigator.of(context).push(MaterialPageRoute<void>(
                  //               builder: (context) => const ChooseStatusPage()));
                  //         },
                  //         child: Text(
                  //           'Продолжить',
                  //           style: TextStyle(
                  //               fontSize: 18.5.sp, //18
                  //               fontWeight: FontWeight.w500,
                  //               color: Colors.black
                  //           ),
                  //         )),
                  //   ),
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
