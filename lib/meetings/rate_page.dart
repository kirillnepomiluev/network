import 'package:flutter/material.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/meetings/rate_final_page.dart';


class RatePage extends StatefulWidget {
  const RatePage({Key? key}) : super(key: key);

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {

  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showInterruptDialog(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backButton(context,
                func: (){
                  showInterruptDialog(context);
                }),

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
                        onPressed: (){
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
        ),
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.only(top: 58,),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Text('Как прошла встреча?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),),


                  Padding(
                    padding: const EdgeInsets.only(top: 122, bottom: 85),
                    child: Image.asset('assets/icons/smile.png', width: 144, height: 144,),
                  ),


                  SliderCustom(
                    min: 0,
                    max: 100,
                    showLabel: false,
                    sLiderValue: 50,
                    // stepSize: 5
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 23, bottom: 80, top: 44),
                    child: AddCommentRow(color: Colors.black,)
                  ),

                  // buttomCustom(
                  //   padH: 100,
                  //     text: 'Далее',
                  //     func: (){
                  //     print('ok');
                  //       Navigator.of(context).push(MaterialPageRoute<void>(
                  //           builder: (context) => const RateFinalPage()));
                  //     }
                  // ),

              ElevatedButton(
                  style:
                  buttonStyleCustom(padH: 100),
                  onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const RateFinalPage()));
                  },
                  child: Text(
                    'Далее',
                    style:
                    TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ))


              ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  // Widget _slider({int min=0, int max=100, double? stepSize, bool showLabel=true}) => SfSliderTheme(
  //   data: SfSliderThemeData(
  //     overlayColor: Colors.black.withOpacity(0.1),
  //     inactiveTrackColor: Colors.grey,
  //     activeTrackColor: Colors.black,
  //     thumbColor: Colors.black,
  //     activeTrackHeight: 10,
  //     inactiveTrackHeight: 10,
  //     thumbRadius: 14,
  //     tooltipBackgroundColor: Colors.transparent,
  //     tooltipTextStyle: TextStyle(
  //         color: Colors.black,
  //         fontSize: 16,
  //         fontWeight: FontWeight.w600
  //     ),
  //
  //   ),
  //   child: SfSlider(
  //     // tooltipShape: SfRectangularTooltipShape(),
  //     // tooltipTextFormatterCallback:
  //     //     (dynamic actualLabel, String formattedText) {
  //     //   return sliderValue.toStringAsFixed(1);
  //     // },
  //     thumbIcon: Icon(
  //       Icons.circle,
  //       color: Colors.grey,
  //       size: 13,
  //     ),
  //     min: min,
  //     max: max,
  //     value: sliderValue,
  //     stepSize: stepSize,
  //     enableTooltip: showLabel,
  //     onChanged: (value) => setState(() => this.sliderValue = value),
  //   ),
  // );


}