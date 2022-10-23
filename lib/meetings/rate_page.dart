import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/meetings/rate_final_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class RatePage extends StatefulWidget {
  const RatePage({Key? key}) : super(key: key);

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {

  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

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
                BackButtonCustom(
                func: (){
                  showInterruptDialog(context);
                }),

                Container(
                  // alignment: Alignment.topLeft,
                  width: 0.11466*mediaWidth, //43
                  height: 0.11466*mediaWidth, //43
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: (){
                          showInterruptDialog(context);
                        },
                        icon: Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                          size: 18.5.sp, //18
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                // padding: EdgeInsets.only(top: 30),    //30
                padding: EdgeInsets.only(top: 0.0416*mediaHeight),    //30
                child: Text('Как прошла встреча?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 19.5.sp,   //20
                  fontWeight: FontWeight.w700,
                ),),
              ),


              Padding(
                padding: EdgeInsets.only(
                    top: mediaHeight*0.1387,     //100
                    bottom: mediaHeight*0.083    //60
                ),
                child: Image.asset('assets/icons/smile.png',
                  width: 0.1997*mediaHeight,
                  height: 0.1997*mediaHeight,    //144
                ),
              ),


              const SliderCustom(
                min: 0,
                max: 100,
                showLabel: false,
                sLiderValue: 50,
                // stepSize: 5
              ),

              Padding(
                  padding: EdgeInsets.only(
                    left: 0.0613*mediaWidth,   //23
                    top: 0.061*mediaHeight,    //44
                    bottom: 0.083*mediaHeight, //60
                  ),
                child: const AddCommentRow(color: Colors.black,)
              ),


              Padding(
                padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 0
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(52),
                          ),
                        ),
                      ),
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const RateFinalPage()));

                        },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.02358*mediaHeight    //17
                        ),
                        child: Text(
                          'Далее',
                          style: TextStyle(
                              color: Colors.white,
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