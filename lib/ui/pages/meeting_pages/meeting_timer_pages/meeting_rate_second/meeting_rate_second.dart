import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingRateSecondView extends StatefulWidget {
  const MeetingRateSecondView({Key? key}) : super(key: key);

  @override
  State<MeetingRateSecondView> createState() => _MeetingRateSecondViewState();
}

class _MeetingRateSecondViewState extends State<MeetingRateSecondView> {
  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        showInterruptDialog(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey.shade400,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                    AppBackButton(
                        func: (){
                          showInterruptDialog(context);
                        }),

                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.061*mediaHeight     //44
                    ),
                    child:

                    const RichTextTwo(
                      text1: 'Дайте оценку\n',
                      text2: 'каждой категории',
                      fontWeight1: FontWeight.w500,
                      fontWeight2: FontWeight.w500,
                      color1: AppColors.salad100,
                      color2: AppColors.textWhite,
                      textAlign: TextAlign.center,
                    )

                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0818*mediaHeight   //59
                    ),
                    child:
                      sliderContainer(title: 'Понравилось ли вам общение?', )
                  ),


                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child:
                      sliderContainer(title: 'Возникла ли симпатия?')
                  ),

                  Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 27),
                      child:
                      sliderContainer(title: 'Интересна ли сфера деятельности?')
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 10,
                        bottom: 36
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.router.push(HomeViewRoute(initIndex: 0));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 22   //17
                            ),
                            child: Text(
                              'Оценить',
                              style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontSize: 17.5.sp,   //16
                                  fontWeight: FontWeight.w500

                              ),
                            ),
                          )),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget sliderContainer({required String title}) => Container(
      // width: 342,
      // height: 166,
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 17.5.sp, //16
                fontWeight: FontWeight.w400,
                // color: Colors.black
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: const [

                SliderCustom(
                  sLiderValue: 0,
                  min: 0,
                  max: 5,
                  showLabelsRow: true,
                  stepSize: 50,
                ),

                // SliderCustom(
                //   sLiderValue: 0,
                //   min: 0,
                //   max: 5,
                //   showLabel: true,
                //   stepSize: 0.1,
                // ),

                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: AddCommentRow(color: AppColors.grey),
                )

              ],
            ),
          )
        ],
      ),
    );



class AddCommentRow extends StatefulWidget {
  final Color color;
  const AddCommentRow({Key? key, required this.color}) : super(key: key);

  @override
  State<AddCommentRow> createState() => _AddCommentRowState();
}

class _AddCommentRowState extends State<AddCommentRow> {
  bool showTextField = false;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    showTextField
        ? _textEditor()
        : commentRow();
  }

  Widget commentRow() => Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: InkWell(
      onTap: (){
        setState(() {
          showTextField = !showTextField;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.1415),
            child: Icon(
              Icons.chat_bubble_outline,
              size: 20.sp, //22
              color: AppColors.salad100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 21, bottom: 2),
            child: Text(
              'Добавить комментарий',
              style: TextStyle(
                  fontSize: 16.5.sp, //14
                  fontWeight: FontWeight.w400,
                  // color: widget.color
              ),
            ),
          )
        ],
      ),
    ),
  );



  Widget _textEditor() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        // height: 40,
        child: TextField(
          controller: _controller,
          onSubmitted: (value){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.start,
          autofocus: false,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.only(left: 10),
            counterText: '',
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10)
            ),
            enabledBorder:
            OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: AppColors.salad100),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              borderRadius: BorderRadius.circular(20)
            ),
            // filled: true,
            // fillColor: Colors.white,
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
            style:
            buttonStyleCustom(padH: 60, padV: 22, radius: 20, color: AppColors.salad100),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              _controller.clear();
            },
            child: const Text(
              'Отправить',
              style:
              TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack
              ),
            )),
      )

    ],
  );

}



void showInterruptDialog(BuildContext context) {
  showDialog<void>(
      context: context,
      builder: (BuildContext context) => interruptDialog(context));
}

Widget interruptDialog(BuildContext context) {

  final mediaWidth = MediaQuery.of(context).size.width;
  final padMain = 0.0746*mediaWidth; //28

  return BlurryContainer(
    blur: 15,
    child: Dialog(
      insetPadding: EdgeInsets.symmetric(
          horizontal: 0.04*mediaWidth  //30
      ),
      // insetPadding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.transparent,
      child:

      BlurryContainer(
        blur: 30,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 31,
          bottom: padMain,
        ),
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const RichTextTwo(
              text1: 'Вы уверены, что хотите\n',
              text2: 'прервать встречу',
              fontSize: 16,
              fontWeight1: FontWeight.w500,
              fontWeight2: FontWeight.w500,
              textAlign: TextAlign.center,
            ),

            const Padding(
              padding:  EdgeInsets.only(top: 37),
              child: Text(
                'Вы сможете продолжить оценку позже,\nоткрыв историю встреч',
                style: TextStyle(
                    color: AppColors.textGray,
                    fontSize: 14,   //16
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: 0.0986*mediaWidth  //37
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(AppColors.salad100),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(
                            vertical: 0.056*mediaWidth*0.428,    //9
                            horizontal: 0.0266*mediaWidth  //15
                        ),
                        child: Text(
                          'Продолжить',
                          style: TextStyle(
                              color: AppColors.textBlack,
                              fontSize: 16.5.sp, //14
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      )),


                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.064*mediaWidth  //24
                    ),
                    child: InkWell(
                      onTap: (){
                        context.router.pop();
                        context.router.pop();

                      },
                      child: Text('Прервать', style: TextStyle(
                          fontSize: 16.5.sp,   //14
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGray
                      ),),
                    ),
                  )


                ],),
            )

          ],),
      )

    ),
  );
}


class SliderCustom extends StatefulWidget {
  final double sLiderValue;
  final double min;
  final double max;
  final int? stepSize;
  final bool showLabelsRow;
  const SliderCustom({
    Key? key,
    required this.sLiderValue,
    required this.min,
    required this.max,
    this.stepSize,
    required this.showLabelsRow,
  }) : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<SliderCustom> {
  double sliderValue = 0;

  bool showLabel = false;

  @override
  void initState() {
    sliderValue = widget.sLiderValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.showLabelsRow){
      showLabel = sliderValue==widget.min || sliderValue==widget.max? false: true;
    }
    return
      Column(
        children: [

          if(widget.showLabelsRow)
          Padding(
            padding: EdgeInsets.only(
                left: sliderValue==0? 8 : 16,
                right: sliderValue==widget.max? 8 : 16,
                bottom: 9
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                      fontSize: sliderValue==0? 17.5.sp : 16.5.sp,
                      fontWeight: sliderValue==0? FontWeight.w700 : FontWeight.w400,
                      color: sliderValue==0? AppColors.salad100 : AppColors.textGray
                  ),
                ),

                Text(
                  '5',
                  style: TextStyle(
                      fontSize: sliderValue==0? 17.5.sp : 16.5.sp,
                      fontWeight: sliderValue==widget.max? FontWeight.w700 : FontWeight.w400,
                      color: sliderValue==widget.max? AppColors.salad100 : AppColors.textGray
                  ),
                ),

              ],
            ),
          ),

          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              valueIndicatorTextStyle: const TextStyle(
                  color: AppColors.salad100,
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
              trackHeight: 10,
              valueIndicatorColor: Colors.transparent, // This is what you are asking for
              inactiveTrackColor: AppColors.white10, // Custom Gray Color
              activeTrackColor: AppColors.salad100,
              thumbColor: AppColors.salad100,
              overlayColor: Colors.black.withOpacity(0.1),
              // overlayColor: Color(0x29EB1555),  // Custom Thumb overlay Color
              thumbShape:   const RoundSliderThumbShape(enabledThumbRadius: 14.0),
              // overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
                overlayShape: SliderComponentShape.noThumb
            ),
            child: Slider(
              label: sliderValue.toStringAsFixed(1),
              min: widget.min,
              max: widget.max,
              value: sliderValue,
              divisions: widget.stepSize,
              // stepSize: widget.stepSize,
              onChanged: (dynamic value) => setState(() => sliderValue = value as double),
            ),
          )

        ],
      );



    // Column(
    //   children: [
    //
    //     Padding(
    //       padding: EdgeInsets.only(
    //           left: sliderValue==0? 8 : 16,
    //           right: sliderValue==widget.max? 8 : 16,
    //           bottom: 9
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             '0',
    //             style: TextStyle(
    //                 // fontSize: sliderValue==0? 16 : 14,
    //                 fontSize: sliderValue==0? 17.5.sp : 16.5.sp,
    //                 fontWeight: sliderValue==0? FontWeight.w600 : FontWeight.w400,
    //                 color: sliderValue==0? Colors.black : ConstColor.grey
    //             ),
    //           ),
    //
    //           Text(
    //             '5',
    //             style: TextStyle(
    //                 // fontSize: sliderValue==widget.max? 16 : 14,
    //                 fontSize: sliderValue==0? 17.5.sp : 16.5.sp,
    //                 fontWeight: sliderValue==widget.max? FontWeight.w600 : FontWeight.w400,
    //                 color: sliderValue==widget.max? Colors.black : ConstColor.grey
    //             ),
    //           ),
    //
    //         ],
    //       ),
    //     ),
    //
    //     Stack(
    //       // crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //
    //         SfSliderTheme(
    //           data: SfSliderThemeData(
    //             overlayColor: Colors.black.withOpacity(0.1),
    //             inactiveTrackColor: Colors.grey,
    //             activeTrackColor: Colors.black,
    //             thumbColor: Colors.black,
    //             activeTrackHeight: 10,
    //             inactiveTrackHeight: 10,
    //             thumbRadius: 14,
    //             overlayRadius: 0,
    //           ),
    //           child: SfSlider(
    //             thumbIcon: const Icon(
    //               Icons.circle,
    //               color: Colors.grey,
    //               size: 13,
    //             ),
    //             min: widget.min,
    //             max: widget.max,
    //             value: sliderValue,
    //             stepSize: widget.stepSize,
    //             onChanged: (dynamic value) => setState(() => sliderValue = value as double),
    //           ),
    //         ),
    //
    //         showLabel==false? Container():
    //         Padding(
    //           padding: const EdgeInsets.only(top: 20),
    //           child: SfSliderTheme(
    //             data: SfSliderThemeData(
    //               overlayColor: Colors.transparent,
    //               inactiveTrackColor: Colors.transparent,
    //               activeTrackColor: Colors.transparent,
    //               thumbColor: Colors.transparent,
    //               activeTrackHeight: 1,
    //               inactiveTrackHeight: 1,
    //               thumbRadius: 1,
    //               overlayRadius: 0,
    //               tooltipBackgroundColor: Colors.transparent,
    //               tooltipTextStyle:
    //               TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 17.5.sp,   //16
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //             child: SfSlider(
    //               // tooltipShape: SfRectangularTooltipShape(),
    //               // tooltipTextFormatterCallback:
    //               //     (dynamic actualLabel, String formattedText) {
    //               //   return sliderValue.toStringAsFixed(1);
    //               // },
    //               min: widget.min,
    //               max: widget.max,
    //               value: sliderValue,
    //               stepSize: widget.stepSize,
    //               enableTooltip: showLabel,
    //               shouldAlwaysShowTooltip: showLabel,
    //               onChanged: (dynamic value) => setState(() => sliderValue = value as double),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }

}

