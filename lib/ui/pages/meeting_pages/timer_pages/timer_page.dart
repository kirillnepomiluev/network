import 'dart:async';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/all_questions.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/complaint_page.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/rate_page.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class TimerPage extends StatefulWidget {
  final bool isTimer;
  const TimerPage({Key? key, this.isTimer = false}) : super(key: key);

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


          openBottomSheetComplain(
              context: context,
              icon: NetworkIcons.smile_dead,
              text1: 'Вы получили ',
              text2: 'жалобу',
              text3: 'Ваш рейтинг понижен на ____.\nЕсли на вас поступят еще 2 жалобы, мы\nвынуждены будем вас заблокировать. ',
              textButton: 'Посмотреть',
              func: (){
                Navigator.of(context).pop();

                openBottomSheetSuccess();

                // Navigator.of(context).push(MaterialPageRoute<void>(
                //     builder: (context) => const RatePage()));
              }
          );


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
          // backgroundColor: Colors.grey.shade400,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child:  AppBackButton( func: (){
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
                      backStrokeWidth: 28,        //28
                      progressStrokeWidth: 28,
                      size: 281,    //281
                      backColor: AppColors.white10,
                      progressColors: const [AppColors.salad100],
                      animationDuration: maxSeconds,
                      valueNotifier: valueNotifier,
                      mergeMode: true,
                      onGetText: (double value) {
                        return Text(
                          '$minutes:$seconds',
                          style:
                          TextStyle(
                            fontSize: 27.sp,   //38
                            fontWeight: FontWeight.w700,
                            // color: Colors.black,
                          ),
                        );
                      },

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 50   //60
                  ),
                  child: Text(isPaused? 'Начните встречу' : 'до конца встречи',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 21.sp    //23
                    ),

                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(
                      top: 24,    //35
                      bottom: 91
                  ),
                  child: Text('Минимальное время встречи\nдля начисления баллов 20 минут',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16  //16
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                widget.isTimer?
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: (){

                      // openBottomSheetSuccess();

                      if(isPaused){
                        startTimer();
                      }else{

                        // openBottomSheetComplain(
                        //   icon: NetworkIcons.check_circle_outlined,
                        //   text1: 'Ваша ',
                        //   text2: 'жалоба отправлена',
                        //   text3: 'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
                        //   textButton: 'Закрыть',
                        //   func: (){
                        //     Navigator.of(context).pop();
                        //   }
                        // );

                        // openBottomSheetComplain(
                        //     icon: Network.smile_dead,
                        //     text1: 'Вы получили ',
                        //     text2: 'жалобу',
                        //     text3: 'Ваш рейтинг понижен на ____.\nЕсли на вас поступят еще 2 жалобы, мы\nвынуждены будем вас заблокировать. ',
                        //     textButton: 'Посмотреть',
                        //     func: (){
                        //       // Navigator.of(context).push(MaterialPageRoute<void>(
                        //       //     builder: (context) => const RatePage()));
                        //     }
                        // );

                        showPauseDialog();
                      }

                    },
                    child: Container(
                      width: 66,    //66
                      height: 92,   //92
                      decoration: BoxDecoration(
                        color: isPaused? AppColors.white10 : AppColors.salad100,
                        borderRadius: BorderRadius.circular(37)
                      ),

                    child: Center(
                      child:
                      isPaused?
                      Text('GO', style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.5.sp,   //20
                        fontWeight: FontWeight.w600
                      ),)
                          :
                      Icon(Icons.close_rounded,
                        color: Colors.black,
                        size: 20.5.sp,   //20
                      )
                      ,
                    ),
                    ),
                  ),
                )
                :
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: buttonStyleCustom(
                              color: Colors.white, padH: 0, padV: 22, radius: 20),
                          onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (context) => const AllQuestionsPage()));
                          },
                          child: Text(
                            'Показать вопросы',
                            style: TextStyle(
                                fontSize: 18.5.sp, //18
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(
                          top: 26   //60
                      ),
                      child: Text('Чтобы получить больше токенов,\nответеть на вопросы',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16 //23
                        ),

                      ),
                    ),
                  ],
                ),



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
      BlurryContainer(
        blur: 20,
        child: Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: 0.08*mediaWidth  //30
            ),

            backgroundColor: Colors.transparent,
            // backgroundColor: ConstColor.white10,
            child:
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            BlurryContainer(
              blur: 20,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: padMain*1.57,  //44
                  bottom: padMain,
              ),
                color: AppColors.white10,
                // color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                RichTextTwo(
                  text1: 'Вы уверены, что хотите\n',
                  text2: 'прервать встречу',
                  fontSize:  17.5.sp,
                  fontWeight1: FontWeight.w500,
                  fontWeight2: FontWeight.w500,
                  textAlign: TextAlign.center,
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

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();

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
          ),



            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlurryContainer(
                blur: 40,
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 0.128*mediaWidth*0.916,  //44
                    bottom: padMain,        //28
                    // left: 40,     //48
                    // right:40
              ),
                    color: AppColors.white10,
                    borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(bottom: 21),
                      child: Icon(
                        NetworkIcons.warning,
                        size: 21.sp, //23
                        color: AppColors.salad100,
                      ),
                    ),


                    RichTextTwo(
                      text1: 'Если у вас возникли проблемы\nвы можете ',
                      text2: 'оставить жалобу',
                      fontSize:  17.5.sp,
                      fontWeight1: FontWeight.w500,
                      fontWeight2: FontWeight.w500,
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
                            MaterialStateProperty.all(Colors.white),
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
                                color: AppColors.textBlack,
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

    ),
      );

  }


  void openBottomSheetSuccess() {
    showModalBottomSheet<void>(
        backgroundColor: AppColors.black1A.withOpacity(0.5),
        enableDrag: true,
      isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {

          return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: BlurryContainer(
              blur: 30,
                  color: Colors.transparent,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Padding(
                      padding: EdgeInsets.only(top: 63),
                      child: RichTextTwo(
                        // fontSize: 20,
                        text1: 'Вы получили\n',
                        text2: 'токены за встречу',
                        // fontWeight1: FontWeight.w600,
                        // fontWeight2: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),


                    const Padding(
                      padding: EdgeInsets.only(top: 101),
                      child:  RhombusText(
                        padLeft: 20,
                        fontSize: 60,
                        iconSize: 45,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 104),
                      child: SizedBox(
                        width: double.infinity,   //259
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
                              Navigator.of(context).pop();

                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  builder: (context) => const RatePage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 26
                              ),
                              child: Text(
                                'Оценить встречу',
                                style: TextStyle(
                                    color: AppColors.textBlack,
                                    fontSize: 17.5.sp,   //16
                                    fontWeight: FontWeight.w500

                                ),
                              ),
                            )),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 31, bottom: 20),
                      child: SizedBox(
                        width: double.infinity,   //259
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.black,),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(width: 2, color: Colors.white)
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 26
                              ),
                              child: Text(
                                'Оценить позже',
                                style: TextStyle(
                                    // color: ConstColor.textWhite,
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






void openBottomSheetComplain({
  required BuildContext context,
  required IconData icon,
  required String text1,
  required String text2,
  required String text3,
  required String textButton,
  final Function? func,
}) {
  showModalBottomSheet<void>(
      backgroundColor: AppColors.black1A.withOpacity(0.5),
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {

        // final mediaWidth = MediaQuery.of(context).size.width;

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: BlurryContainer(
            blur: 30,
            // decoration: BoxDecoration(
            //     color: ConstColor.white10,
            color: Colors.transparent,
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(30))
            // )
            ,
            // padding: const EdgeInsets.symmetric(vertical: 60),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 69),
                    child: Icon(
                      icon,
                      // Network.check_circle_outlined,
                      size: 100,
                      color: AppColors.salad100,
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 69),
                      child:
                      RichTextTwo(
                        // fontSize: 20,
                        text1: text1,
                        text2: text2,
                        // fontWeight1: FontWeight.w600,
                        // fontWeight2: FontWeight.w600,
                      )
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text(
                      // 'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
                      text3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 150, bottom: 35),
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
                          onPressed: (){
                            if(func!=null){
                              func();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            child: Text(
                              textButton,
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
        );
      });
}