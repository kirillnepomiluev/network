import 'dart:async';
import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/meetings/complaint_page.dart';
import 'package:network_app/meetings/rate_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  // Duration duration = const Duration(minutes: 1);
  Duration duration = const Duration(seconds: 10);
  Timer? timer;

  int maxSeconds = 0;

  void addTime(){

    if (mounted) {
      const addSeconds =  -1 ;

      setState(() {
        final seconds = duration.inSeconds + addSeconds;

        if (seconds < 0) {
          timer?.cancel();

          openBottomSheetSuccess();


        } else {
          duration = Duration(seconds: seconds);
        }
      });
    }

  }

  void startTimer({bool resets = true}){
    // if(resets)
    //   reset();

      setState(() {
        isPaused = false;
      });

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime() );
  }

  void pauseTimer({bool resets = true}){
    // if(resets){
    //   reset();
    // }

    setState(() {
      isPaused = true;
      timer?.cancel();
    });

  }


  late ValueNotifier<double> valueNotifier;

  bool isPaused = true;

  @override
  void initState() {
    maxSeconds = duration.inSeconds;
    valueNotifier = ValueNotifier(0.0);

    // startTimer();
    super.initState();
  }

  String twoDigits(int n) => n.toString().padLeft(2,'0'); //9->09

  @override
  Widget build(BuildContext context) {
    // final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final currentSeconds = duration.inSeconds;
    final valueTime = (1-currentSeconds/maxSeconds)*100;
    valueNotifier.value = valueTime;


    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

//281

    return WillPopScope(
      onWillPop: () async {

        if(currentSeconds==maxSeconds){
          Navigator.of(context).pop();
        }
        else{
          showPauseDialog();
        }

        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade400,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child:  backButton(context, func: (){
                    if(currentSeconds==maxSeconds){
                      Navigator.of(context).pop();
                    }
                    else{
                      showPauseDialog();
                    }
                  }),
                ),

                Center(
                    child:
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                        right: 20,
                        top: 0.0416*mediaHeight   //30
                    ),
                    child: SimpleCircularProgressBar(
                      // backStrokeWidth: 0.07466*mediaWidth,        //28
                      // progressStrokeWidth: 0.07466*mediaWidth,
                      // size: 0.3897*mediaHeight,    //281
                      backStrokeWidth: 0.07466*mediaWidth,        //28
                      progressStrokeWidth: 0.07466*mediaWidth,
                      size: 0.7493*mediaWidth,    //281
                      backColor: Colors.grey.shade100,
                      progressColors: const [Colors.black],
                      // animationDuration: 0,
                      animationDuration: maxSeconds,
                      valueNotifier: valueNotifier,
                      mergeMode: true,
                      onGetText: (double value) {

                        return Text(
                          // '${value.toInt()}',
                          '$minutes:$seconds',
                          style:
                          TextStyle(
                            fontSize: 27.sp,   //38
                            fontWeight: FontWeight.w700,
                            // color: Colors.greenAccent.withOpacity(value * 0.01),
                            color: Colors.black,
                          ),
                        );
                      },

                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 0.0832*mediaHeight   //60
                  ),
                  child: Text(isPaused? 'начните встречу' : 'до конца встречи',
                    style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 21.sp    //23
                    ),

                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 0.0485*mediaHeight,    //35
                      bottom: 0.0832*mediaHeight   //60
                  ),
                  child: Text('Минимальное время встречи\nдля начисления баллов 20 минут',
                    style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 17.5.sp  //16
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: (){

                      // openBottomSheetSuccess();

                      if(isPaused){
                        startTimer();
                      }else{
                        showPauseDialog();
                      }

                    },
                    child: Container(
                      width: 0.1946*mediaWidth,    //73
                      height: 0.1946*mediaWidth*1.26,   //92
                      decoration: BoxDecoration(
                        color: isPaused? Colors.black : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(36)
                      ),

                    child: Center(
                      child:
                      isPaused?
                      Text('GO', style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.5.sp,   //20
                        fontWeight: FontWeight.w600
                      ),)
                          : Icon(Icons.close_outlined, color: ConstColor.grey,
                        size: 19.5.sp,   //20
                      )
                      ,
                    ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }



  void showPauseDialog() {
    pauseTimer();

    showDialog<void>(
        // barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => pauseDialog());
  }


  Widget pauseDialog() {

    final mediaWidth = MediaQuery.of(context).size.width;
    final padMain = 0.0746*mediaWidth; //28

    return
      Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: 0.08*mediaWidth  //30
          ),

          backgroundColor: Colors.transparent,
      // scrollable: true,
      // content:
          child:
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: padMain*1.57,  //44
                bottom: padMain,
            ),
          // width: mediaWidth*0.872,   //327
          // height: 0.5627*mediaWidth*0.872,  //184
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text('Вы уверены, что хотите\nпрервать встречу?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.5.sp,   //16
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 0.0986*mediaWidth  //37
                ),
                child: Row(
                  // spacing:  10,    //24,
                  // runSpacing: 0.064*mediaWidth,    //24,
                  // alignment: WrapAlignment.spaceBetween,
                  // runAlignment: WrapAlignment.center,
                  // direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        startTimer();
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(
                                  vertical: 0.056*mediaWidth*0.428,    //9
                                  horizontal: 0.0266*mediaWidth  //15
                              ),
                        child: Text(
                          // 'Создать чат',
                          'Продолжить',
                          style: TextStyle(
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

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();

                        },
                        child: Text('Прервать', style: TextStyle(
                          fontSize: 16.5.sp,   //14
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500
                        ),),
                      ),
                    )


                ],),
              )

            ],),
        ),



          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 0.128*mediaWidth*0.916,  //44
                  bottom: padMain,        //28
                  // left: 40,     //48
                  // right:40
            ),
              // width: 327,
              // height: 227,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: 21),
                    child: Icon(Network.warning,
                      size: 21.sp, //23
                    ),
                  ),

                  Text('Если у вас возникли проблемы\nвы можете оставить жалобу',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.5.sp, //14
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 37),
                    child:
                    ElevatedButton(
                        style: ButtonStyle(
                          // padding: MaterialStateProperty.all(
                          //     const EdgeInsets.symmetric(vertical: 9, horizontal: 21)),
                          backgroundColor:
                          MaterialStateProperty.all(ConstColor.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (context) => const ComplaintPage()));
                        },

                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(
                              vertical: 0.056*mediaWidth*0.428,    //9
                              horizontal: 0.0266*mediaWidth  //15
                          ),
                      child: Text(
                            // 'Создать чат',
                            'Пожаловаться',
                            style: TextStyle(
                                fontSize: 16.5.sp,   //14
                                fontWeight: FontWeight.w400

                            ),
                          ),
                        )),
                  )

                ],),
            ),
          )


      ],)

    );

  }


  void openBottomSheetSuccess() {
    showModalBottomSheet<void>(
      enableDrag: true,
      isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {

          final mediaWidth = MediaQuery.of(context).size.width;

          final imageWidth = 0.624*mediaWidth;


          return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30))),
              // height: MediaQuery.of(context).size.height * 0.8,
              // padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Text('Вы получили 150 баллов!', style: TextStyle(
                      fontSize: 19.5.sp,  //20
                      fontWeight: FontWeight.w700,
                    ),),

                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 66),
                      child: Container(
                        width: imageWidth,     //234
                        height: 0.9359*imageWidth,  //219
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17)
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: SizedBox(
                        width: 0.69*mediaWidth,   //259
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
                                  builder: (context) => const RatePage()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0453*mediaWidth    //17
                              ),
                              child: Text(
                                // 'Создать чат',
                                'Оценить встречу',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.5.sp,   //16
                                    fontWeight: FontWeight.w500

                                ),
                              ),
                            )),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 31),
                      child: SizedBox(
                        width: 0.69*mediaWidth,   //259
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade100,),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(52),
                                    side: const BorderSide(width: 2, color: Colors.black)
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0453*mediaWidth    //17
                              ),
                              child: Text(
                                'Оценить позже',
                                style: TextStyle(
                                    color: Colors.black,
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
        });
  }


}