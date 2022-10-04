import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _activeWalletTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeWalletTab = position;
          });
        }),
        child: Container(
          width: 161,
          height: 91,
          // padding: EdgeInsets.all(0.0373 * mediaWidth), //14
          decoration: BoxDecoration(
            color: _activeWalletTab == position
                ? ConstColor.grey
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                text,
                style: const TextStyle(
                    fontSize: 16, //16
                    fontWeight: FontWeight.w400),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Icon(
                  position==1
                      ? Network.arrow_right_down
                      : Network.arrow_right_up,
                  size: 10,
                ),
              )


            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = 0.11466 * mediaWidth; //43

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: EdgeInsets.only(
            top: mediaTop,
            left: 17.sp, //16
            right: 17.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                Stack(
                  alignment: Alignment.center,
                  children: [
                    backButton(context, func: (){}),
                    Center(child: Text('Кошелек',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.5.sp,   //18
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ))
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 41),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    miniContainer(
                      position: 1,
                      text: 'Баллы',
                    ),
                    miniContainer(
                      position: 2,
                      text: 'Валюта',
                    ),
                  ],
                ),
              ),


              const Padding(
                padding: EdgeInsets.only(top: 37),
                child: Text('Общее количество баллов',
                    style: TextStyle(
                    fontSize: 16,   //16
                    fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ),


              const Padding(
                padding: EdgeInsets.only(top: 9),
                child: Text('330',
                  style: TextStyle(
                      fontSize: 38,   //16
                      fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 33),
                child: Container(
                  // width: 161,
                  // height: 91,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 32
                  ), //14
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Flexible(
                            child: const Text(
                              'Вы можете обменять баллы\nна выбранную криптовалюту',
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: 14, //16
                                  fontWeight: FontWeight.w400),
                            ),
                          ),

                          Column(children: [

                            Text(
                              '300',
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: 16, //16
                                  fontWeight: FontWeight.w400),
                            ),

                            Text(
                              'баллов',
                              maxLines: null,
                              style: TextStyle(
                                  fontSize: 12, //16
                                  fontWeight: FontWeight.w400),
                            ),

                          ],)


                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: meetRow(context),
                      ),

                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }



  Widget meetRow(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    final double contSize = mediaWitdh*0.128;   //48
    final double iconSize = 19.sp;     //25
    final double iconElSize = 18.5.sp;   //20

    return InkWell(
      onTap: (){
        // Navigator.of(context).push(
        //     MaterialPageRoute<void>(
        //         builder: (context) =>
        //         const TimerPage()));
      },
      child: Container(
        // height: 54,
        // width: 209,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  // shape: BoxShape.circle
                ),
                width: contSize,
                height: contSize,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Network.arrow_right_long,
                    color: Colors.white,
                  ),
                  iconSize: iconElSize,
                )),

            Padding(
              padding: EdgeInsets.only(
                  left: mediaWitdh*0.0453, //17
                  right: 8
              ),
              child: Text('Обменять',
                  style: TextStyle(
                      fontSize: 15.sp,     //12
                      fontWeight: FontWeight.w500)),
            ),

            //иконка >>
            Padding(
              padding: EdgeInsets.only(right: mediaWitdh*0.056), //21
              child: SizedBox(
                width: 22,
                height: 20,
                child: Stack(
                  children: const [
                    Positioned(
                        left: 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 22,
                          color: ConstColor.grey,
                        )),
                    Positioned(
                        left: 8,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 22,
                        )),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
