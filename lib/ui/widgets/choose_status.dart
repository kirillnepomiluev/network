import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_status/input_status.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ChooseStatusPage extends StatefulWidget {
  final bool isAuth;
  const ChooseStatusPage({Key? key, this.isAuth = false}) : super(key: key);

  @override
  State<ChooseStatusPage> createState() => _ChooseStatusPageState();
}

class _ChooseStatusPageState extends State<ChooseStatusPage> {

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

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton:
      widget.isAuth? null :
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
              'Добавить',
              style:
              TextStyle(
                  fontSize: 18.sp,     //16
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            )),
      ),
      bottomNavigationBar: widget.isAuth==false? null:
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
                    builder: (context) => const InputStatusPage()));
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

                  widget.isAuth?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButtonCustom(),
                      Container(
                          decoration: BoxDecoration(
                            color: ConstColor.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 18
                          ),
                          child:
                          Row(
                            children: const [
                              Text('Пропустить'),
                              Icon(Icons.close_rounded, color: ConstColor.salad100,)
                            ],
                          )
                      ),
                    ],)
                      :
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const BackButtonCustom(),
                        Center(child: Text('Выберете статус',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.5.sp,   //18
                              fontWeight: FontWeight.w600,
                          ),
                        ))
                      ],
                    ),
                  ),

                  if(widget.isAuth)
                  const EnterInfoContainer(
                    text1: 'Выберете ',
                    text2: 'статус',
                    description: 'Статус будет отображаться в вашем профиле',
                    padTop: 30,
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
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (context) => const InputStatusPage()));
                          },
                          child: const Text(
                            'Ввести свой статус',
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
                  //               builder: (context) => const ChooseStatusPage(isAuth: true,)));
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
