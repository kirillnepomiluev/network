import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class RateFinalPage extends StatefulWidget {
  const RateFinalPage({Key? key}) : super(key: key);

  @override
  State<RateFinalPage> createState() => _RateFinalPageState();
}

class _RateFinalPageState extends State<RateFinalPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // showInterruptDialog(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   toolbarHeight: 65,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   title: Padding(
          //     padding: const EdgeInsets.only(top: 10),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         backButton(context,
          //         //     func: (){
          //         //   showInterruptDialog(context);
          //         // }
          //         ),
          //         Container(
          //           // alignment: Alignment.topLeft,
          //           width: 55,
          //           height: 55,
          //           decoration: BoxDecoration(
          //             color: Colors.grey.shade300,
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //           child: Center(
          //             child: IconButton(
          //                 onPressed: () {
          //                   showInterruptDialog(context);
          //                 },
          //                 icon: const Icon(
          //                   Icons.close_outlined,
          //                   color: Colors.black,
          //                   size: 25,
          //                 )),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          backgroundColor: Colors.grey.shade400,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          backButton(context,
                            //     func: (){
                            //   showInterruptDialog(context);
                            // }
                          ),
                          Container(
                            // alignment: Alignment.topLeft,
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    showInterruptDialog(context);
                                  },
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: Colors.black,
                                    size: 25,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 44),
                      child: Text(
                        'Дайте оценку\nкаждой категории',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 59),
                      child:
                        sliderContainer(title: 'Понравилось ли вам общение?')
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
                      padding: const EdgeInsets.only(top: 27, bottom: 36),
                      child: ElevatedButton(
                          style:
                          buttonStyleCustom(padH: 100),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (context) => const HomePage(initIndex: 0)));
                          },
                          child: Text(
                            'Оценить',
                            style:
                            TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          )),
                    )
                  ],
                ),
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
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [

                SliderCustom(
                  sLiderValue: 0,
                  min: 0,
                  max: 5,
                  showLabel: true,
                  stepSize: 0.1,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: AddCommentRow(color: ConstColor.grey),
                )

              ],
            ),
          )
        ],
      ),
    );



class AddCommentRow extends StatefulWidget {
  final color;
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
              size: 22,
              color: widget.color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21, bottom: 2),
            child: Text(
              'Добавить комментарий',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: widget.color),
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
        height: 40,
        // width: double.infinity,
        child: TextField(

          // validator: (val){
          //
          //   if (val!.isEmpty) {
          //     return "Пусто";
          //   }
          //
          //   return null;
          //
          // },
          // onChanged: (value){
          // },
          // maxLines: 3,
          controller: _controller,
          onSubmitted: (value){

            FocusManager.instance.primaryFocus?.unfocus();

            // if(value.isNotEmpty){
            //   sendFunction();
            // }

          },
          textInputAction: TextInputAction.done,

          // onFieldSubmitted: (value){
          //   print('submitted - $value');
          //
          //   // SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
          //   FocusManager.instance.primaryFocus?.unfocus();
          //
          // },
          textAlign: TextAlign.start,
          // maxLines: 2,
          // maxLength: 1,
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            counterText: '',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10)
            ),
            enabledBorder:

            OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              borderRadius: BorderRadius.circular(10)
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),


      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
            style:
            buttonStyleCustom(padH: 37, padV: 9, radius: 10),
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              _controller.clear();
            },
            child: Text(
              'Отправить',
              style:
              TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
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
  return Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 16),
    backgroundColor: Colors.transparent,
    child: Container(
      width: 328,
      // height: 236,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(
                Icons.close_outlined,
                size: 21,
              ),
            ),
          ),
          Text(
            'Вы уверены, что хотите прервать\nоценку встречи?',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              'Вы сможете продолжить оценку позже,\nоткрыв историю встреч',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 37, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 9, horizontal: 21)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      // 'Создать чат',
                      'Продолжить',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const HomePage(initIndex: 0)));

                      // Navigator.of(context).pop();
                      // Navigator.of(context).pop();
                    },
                    child: Text(
                      'Прервать',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class SliderCustom extends StatefulWidget {
  final double sLiderValue;
  final int min;
  final int max;
  final double? stepSize;
  final bool showLabel;
  const SliderCustom({
    Key? key,
    required this.sLiderValue,
    required this.min,
    required this.max,
    this.stepSize,
    required this.showLabel,
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

    showLabel = widget.showLabel;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.showLabel){
      showLabel = sliderValue==0 || sliderValue==widget.max? false: true;
    }

    return
      Column(
        children: [

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
                      fontSize: sliderValue==0? 16 : 14,
                      fontWeight: sliderValue==0? FontWeight.w600 : FontWeight.w400,
                      color: sliderValue==0? Colors.black : ConstColor.grey
                  ),
                ),

                Text(
                  '5',
                  style: TextStyle(
                      fontSize: sliderValue==widget.max? 16 : 14,
                      fontWeight: sliderValue==widget.max? FontWeight.w600 : FontWeight.w400,
                      color: sliderValue==widget.max? Colors.black : ConstColor.grey
                  ),
                ),

              ],
            ),
          ),

          Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SfSliderTheme(
                data: SfSliderThemeData(
                  overlayColor: Colors.black.withOpacity(0.1),
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: Colors.black,
                  thumbColor: Colors.black,
                  activeTrackHeight: 10,
                  inactiveTrackHeight: 10,
                  thumbRadius: 14,
                  overlayRadius: 0,
                ),
                child: SfSlider(
                  thumbIcon: Icon(
                    Icons.circle,
                    color: Colors.grey,
                    size: 13,
                  ),
                  min: widget.min,
                  max: widget.max,
                  value: sliderValue,
                  stepSize: widget.stepSize,
                  onChanged: (value) => setState(() => this.sliderValue = value),
                ),
              ),

              showLabel==false? Container():
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SfSliderTheme(
                  data: SfSliderThemeData(
                    overlayColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    activeTrackColor: Colors.transparent,
                    thumbColor: Colors.transparent,
                    activeTrackHeight: 1,
                    inactiveTrackHeight: 1,
                    thumbRadius: 1,
                    overlayRadius: 0,
                    tooltipBackgroundColor: Colors.transparent,
                    tooltipTextStyle:
                    TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: SfSlider(
                    // tooltipShape: SfRectangularTooltipShape(),
                    // tooltipTextFormatterCallback:
                    //     (dynamic actualLabel, String formattedText) {
                    //   return sliderValue.toStringAsFixed(1);
                    // },
                    min: widget.min,
                    max: widget.max,
                    value: sliderValue,
                    stepSize: widget.stepSize,
                    enableTooltip: showLabel,
                    shouldAlwaysShowTooltip: showLabel,
                    onChanged: (value) => setState(() => this.sliderValue = value),
                  ),
                ),
              ),
            ],
          ),
        ],
      );

    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //
    //     SfSliderTheme(
    //       data: SfSliderThemeData(
    //         overlayColor: Colors.black.withOpacity(0.1),
    //         inactiveTrackColor: Colors.grey,
    //         activeTrackColor: Colors.black,
    //         thumbColor: Colors.black,
    //         activeTrackHeight: 10,
    //         inactiveTrackHeight: 10,
    //         thumbRadius: 14,
    //         overlayRadius: 0,
    //         tooltipBackgroundColor: Colors.transparent,
    //         tooltipTextStyle:
    //         TextStyle(
    //           color: Colors.black,
    //           fontSize: 16,
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //       child: SfSlider(
    //         // tooltipShape: SfRectangularTooltipShape(),
    //         // tooltipTextFormatterCallback:
    //         //     (dynamic actualLabel, String formattedText) {
    //         //   return sliderValue.toStringAsFixed(1);
    //         // },
    //         thumbIcon: Icon(
    //           Icons.circle,
    //           color: Colors.grey,
    //           size: 13,
    //         ),
    //         min: widget.min,
    //         max: widget.max,
    //         value: sliderValue,
    //         stepSize: widget.stepSize,
    //         enableTooltip: widget.showLabel,
    //         shouldAlwaysShowTooltip: widget.showLabel,
    //         onChanged: (value) => setState(() => this.sliderValue = value),
    //       ),
    //     ),
    //
    //     SfSliderTheme(
    //       data: SfSliderThemeData(
    //         overlayColor: Colors.black.withOpacity(0.1),
    //         inactiveTrackColor: Colors.grey,
    //         activeTrackColor: Colors.black,
    //         thumbColor: Colors.black,
    //         activeTrackHeight: 10,
    //         inactiveTrackHeight: 10,
    //         thumbRadius: 14,
    //         overlayRadius: 0,
    //         tooltipBackgroundColor: Colors.transparent,
    //         tooltipTextStyle:
    //         TextStyle(
    //           color: Colors.black,
    //           fontSize: 16,
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //       child: SfSlider(
    //         // tooltipShape: SfRectangularTooltipShape(),
    //         // tooltipTextFormatterCallback:
    //         //     (dynamic actualLabel, String formattedText) {
    //         //   return sliderValue.toStringAsFixed(1);
    //         // },
    //         thumbIcon: Icon(
    //           Icons.circle,
    //           color: Colors.grey,
    //           size: 13,
    //         ),
    //         min: widget.min,
    //         max: widget.max,
    //         value: sliderValue,
    //         stepSize: widget.stepSize,
    //         enableTooltip: widget.showLabel,
    //         shouldAlwaysShowTooltip: widget.showLabel,
    //         onChanged: (value) => setState(() => this.sliderValue = value),
    //       ),
    //     ),
    //   ],
    // );
  }
}
