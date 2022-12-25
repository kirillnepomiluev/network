import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/rate_final_page.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/constants.dart';
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

    final mediaWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        showInterruptDialog(context);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 10),
                  child: BackButtonCustom(),
                ),

                const Padding(
                  // padding: EdgeInsets.only(top: 30),    //30
                  padding: EdgeInsets.only(top: 59),    //30
                  child:

                    BuildRichTextTwo(
                      text1: 'Как прошла ',
                      text2: 'встреча?',
                      color1: ConstColor.salad100,
                      color2: ConstColor.textWhite,
                      // fontSize: 20,
                    )
                ),


                const Padding(
                  padding: EdgeInsets.only(top: 131),
                  child: Icon(
                    NetworkIcons.smile_wave,
                    size: 100,
                    color: ConstColor.salad100,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 93),
                  child: SliderCustom(
                    min: 0,
                    max: 100,
                    showLabelsRow: false,
                    sLiderValue: 50,
                    // stepSize: 5
                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(
                      left: 0.0613*mediaWidth,   //23
                      top: 65,    //44
                    ),
                  child: const AddCommentRow(color: Colors.black,)
                ),


                Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                      left: 16,
                      right: 16,
                      bottom: 0
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
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const RateFinalPage()));
                          },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25    //17
                          ),
                          child: Text(
                            'Далее',
                            style: TextStyle(
                                color: ConstColor.textBlack,
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
    );
  }

}