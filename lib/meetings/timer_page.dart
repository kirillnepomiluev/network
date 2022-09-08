import 'dart:async';
import 'package:flutter/material.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/meetings/complaint_page.dart';
import 'package:network_app/meetings/rate_page.dart';
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

    if (this.mounted) {
      const addSeconds =  -1 ;

      setState(() {
        final seconds = duration.inSeconds + addSeconds;

        if (seconds < 0) {
          timer?.cancel();

          openBottomSheetSuccess();

          print('таймер кончился');

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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:  backButton(context, func: (){
              if(currentSeconds==maxSeconds){
                Navigator.of(context).pop();
              }
              else{
                showPauseDialog();
              }
            }),
          ),
        ),
        // extendBody: true,
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [



                Center(
                    child:
                  SimpleCircularProgressBar(
                    backStrokeWidth: 28,
                    progressStrokeWidth: 28,
                    size: 281,
                    backColor: Colors.grey.shade100,
                    progressColors: [Colors.black],
                    animationDuration: maxSeconds,
                    valueNotifier: valueNotifier,
                    mergeMode: true,
                    onGetText: (double value) {
                      TextStyle centerTextStyle = TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                        // color: Colors.greenAccent.withOpacity(value * 0.01),
                        color: Colors.black,
                      );

                      return Text(
                        // '${value.toInt()}',
                        '$minutes:$seconds',
                        style: centerTextStyle,
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(isPaused? 'начните встречу' : 'до конца встречи',
                    style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 23
                    ),

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 78),
                  child: Text('Минимальное время встречи\nдля начисления баллов 20 минут',
                    style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),


                InkWell(
                  onTap: (){

                    // openBottomSheetSuccess();

                    if(isPaused){
                      startTimer();
                    }else{
                      showPauseDialog();
                    }

                  },
                  child: Container(
                    width: 73,
                    height: 92,
                    decoration: BoxDecoration(
                      color: isPaused? Colors.black : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(36)
                    ),

                  child: Center(
                    child:
                    isPaused?
                    Text('GO', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),)
                        : Icon(Icons.close_outlined, color: ConstColor.grey, size: 20,)
                    ,
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
    return
      AlertDialog(
        backgroundColor: Colors.transparent,
      scrollable: true,
      content:
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
            width: 327,
            height: 184,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text('Вы уверены, что хотите\nпрервать встречу?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 9, horizontal: 21)),
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
                        child: Text(
                          // 'Создать чат',
                          'Продолжить',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400

                          ),
                        )),


                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: InkWell(
                          onTap: (){

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();

                          },
                          child: Text('Прервать', style: TextStyle(
                            fontSize: 14,
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
                width: 327,
                height: 227,
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
                      child: Icon(Network.warning, size: 23,),
                    ),

                    Text('Если у вас возникли проблемы\nвы можете оставить жалобу',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 37),
                      child:
                      ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 9, horizontal: 21)),
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
                          child: Text(
                            // 'Создать чат',
                            'Пожаловаться',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400

                            ),
                          )),
                    )

                  ],),
              ),
            )


        ],),)

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
        builder: (BuildContext context) => WillPopScope(
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
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),

                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 66),
                      child: Container(
                        width: 234,
                        height: 219,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17)
                        ),
                      ),
                    ),


                    ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 17, horizontal: 61)),
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
                        child: Text(
                          'Оценить встречу',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                             color: Colors.white
                          ),
                        )),

                    Padding(
                      padding: const EdgeInsets.only(top: 31),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 17, horizontal: 61)),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade100,),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(52),
                                side: BorderSide(width: 2, color: Colors.black)
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Оценить позже',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          )),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }


}