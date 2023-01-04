import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class SearchPage extends StatefulWidget {
  final bool isAuth;
  const SearchPage({Key? key, this.isAuth=false}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  int _activeTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeTab = position;
          });
        }),
        child: Container(
          decoration: BoxDecoration(
            color:   _activeTab == position?  AppColors.salad100 : AppColors.white10,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 16, //19
              horizontal: 20
          ),
          child:
          Text(
            text,
            style: TextStyle(
                color:
                _activeTab == position
                    ? AppColors.textBlack
                    : AppColors.textWhite,
                fontSize: UtilsResponsive.getResSize(12), //12
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  final _controller = TextEditingController();

  Widget _textEditor() => TextField(
    maxLines: 1,
    controller: _controller,
    textInputAction: TextInputAction.done,
    textAlign: TextAlign.start,
    autofocus: false,
    style: TextStyle(
      fontSize: UtilsResponsive.getResSize(14),
      // color: ConstColor.textWhite
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
              'Искать',
              style:
              TextStyle(
                  fontSize: 18.sp,     //16
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            )),
      ),
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
                        const AppBackButton(),
                        Center(child: Text('Поиск',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
                        child:
                        RichTextTwo(text1: 'Выберете ', text2: 'интересы', fontSize: 20.sp, fontWeight1: FontWeight.w500, fontWeight2: FontWeight.w500,),
                      ),
                    ),


                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(children: [

                      miniContainer(
                        position: 1,
                        text: 'По интересам',
                      ),

                      miniContainer(
                        position: 2,
                        text: 'По категориям встречи',
                      ),

                    ],),
                  ),




                  //Поиск
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 18),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 43,
                      decoration: BoxDecoration(
                          color: AppColors.white10,
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
                              size: UtilsResponsive.getResSize(14),
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
                        OptionsContainer(title: item,),

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
