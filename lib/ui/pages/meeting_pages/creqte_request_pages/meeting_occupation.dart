import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/pages/meeting_pages/creqte_request_pages/meeting_interest.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ChooseMeetingOccupation extends StatefulWidget {
  const ChooseMeetingOccupation({Key? key,}) : super(key: key);

  @override
  State<ChooseMeetingOccupation> createState() => _ChooseMeetingOccupationState();
}

class _ChooseMeetingOccupationState extends State<ChooseMeetingOccupation> {

  final _controller = TextEditingController();

  Widget _textEditor() => TextField(
    maxLines: 1,
    controller: _controller,
    textInputAction: TextInputAction.done,
    textAlign: TextAlign.start,
    autofocus: false,
    style: TextStyle(
      fontSize: getResSize(14),
    ),
    decoration: const InputDecoration(
      counterText: '',
    ),
  );

  final int _missedCount = 3;

  List<String> choosedOptions = [];

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
                    builder: (context) => const MeetInterestsChoose()));
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

                  const EnterInfoContainer(
                    text1: 'Выберете ',
                    text2: 'сферу деятельности',
                    description: 'Сфера деятельности будет отображаться в вашем профиле',
                    padTop: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Вы можете выбрать ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp //10
                          ),
                        ),
                        Text(
                          _missedCount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ConstColor.salad100,
                              fontSize: 14.sp //10
                          ),
                        ),
                        Text(
                          ' варианта',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp //10
                          ),
                        ),
                      ],
                    ),
                  ),


                  if(choosedOptions.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Wrap(
                        spacing: 14,
                        runSpacing: 14,
                        direction: Axis.horizontal,
                        children: [

                          for (final item in choosedOptions)
                            Container(
                                padding: const EdgeInsets.all(14), //14
                                decoration: BoxDecoration(
                                  color: ConstColor.white10,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: IconButton(onPressed: (){
                                        setState(() {
                                          choosedOptions.remove(item);
                                        });
                                      },
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          iconSize: 20,
                                          icon: const Icon(Icons.close_rounded, color: ConstColor.salad100,)),
                                    )
                                  ],)
                            ),

                        ],
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      // width: double.infinity,
                      child: ElevatedButton(
                          style: buttonStyleCustom(
                              color: Colors.white,
                              padH: 31, padV: 16, radius: 13),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute<void>(
                            //     builder: (context) => const MeetInterestsChoose()));
                          },
                          child: const Text(
                            'Ввести свой вариант',
                            style: TextStyle(
                                fontSize: 12, //12
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          )),
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
                        HobbySelected(title: item,
                          func: (){
                            if(choosedOptions.length<3){
                              setState(() {
                                choosedOptions.add(item);
                              });
                            }

                          },
                        ),

                    ],
                  ),

                  const SizedBox(height: 100,)



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}
