import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/wallet/exchange_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _activeTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    final mediaWitdh = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() {
        setState(() {
          _activeTab = position;
        });
      }),
      child: Container(
        width: mediaWitdh*0.43,  //161   55
        height: 40.sp,   //91   40
        decoration: BoxDecoration(
          color: _activeTab == position
              ? ConstColor.salad100
              : ConstColor.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: TextStyle(
                  color: _activeTab == position
                      ? ConstColor.textBlack
                      : ConstColor.textWhite,
                  fontSize: 18.sp, //16
                  fontWeight: FontWeight.w400),
            ),


            Padding(
              padding: EdgeInsets.only(
                  left: 13.sp //9
              ),
              child: Icon(
                _activeTab == position
                    ? NetworkIcons.arrow_right_down
                    : Icons.arrow_forward_rounded,
                size:
                _activeTab == position
                    ?14.sp   //10
                : 18.sp,

                color: _activeTab == position
                    ? ConstColor.textBlack
                    : ConstColor.textWhite,
              ),
            )

          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      body: Padding(
        padding: EdgeInsets.only(
            top: mediaTop,
            left: 17.sp, //16
            right: 17.sp
        ),
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
                    BackButtonCustom( func: (){}),
                    Center(child: Text('Кошелек',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.5.sp,   //18
                          fontWeight: FontWeight.w600,
                          // color: Colors.black
                      ),
                    ))
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 28.sp  //41
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    miniContainer(
                      position: 1,
                      text: 'Токены',
                    ),
                    miniContainer(
                      position: 2,
                      text: 'Валюта',
                    ),
                  ],
                ),
              ),

              _activeTab==1?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 26.sp  //37
                    ),
                    child: Text('Общее количество баллов',
                        style: TextStyle(
                        fontSize: 17.5.sp,   //16
                        fontWeight: FontWeight.w400,
                            // color: Colors.black
                        ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Text('330',
                      style: TextStyle(
                          fontSize: 27.sp,   //38
                          fontWeight: FontWeight.w700,
                          color: ConstColor.salad100
                      ),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(
                        top: 25.sp  //33
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 19.5.sp,  //20
                        vertical: 24.sp     //32
                      ), //14
                      decoration: BoxDecoration(
                        color: ConstColor.white10,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Flexible(
                                child:  Text(
                                  'Вы можете обменять баллы\nна выбранную криптовалюту',
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize: 16.5.sp, //14
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                Text(
                                  '300',
                                  maxLines: null,
                                  style: TextStyle(
                                      fontSize: 17.5.sp, //16
                                      fontWeight: FontWeight.w400,
                                    color: ConstColor.salad100
                                  ),
                                ),

                                Text(
                                  'токенов',
                                  maxLines: null,
                                  style: TextStyle(
                                    color: Colors.grey,
                                      fontSize: getResSize(12), //12
                                      fontWeight: FontWeight.w400
                                  ),
                                ),

                              ],)

                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: 24.sp  //30
                            ),
                            child: MeetRow(
                              isExchange: true,
                              func: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (context) =>
                                        const ExchangePage()));
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                  Padding(
                      padding: const EdgeInsets.only(
                          top: 50
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final CurrencyData data in currencyList)
                              graphCont(data: data),
                          ],),
                      )
                  ),
                ],
              )
              :
              Column(
                children: [
                  //Смотреть историю пополнений
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.sp,    //21
                        bottom: 21.sp  //24
                    ),
                    child: SizedBox(
                      width: double.infinity,  //168
                      // height: 32.sp,  //53
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute<void>(
                          //     builder: (context) => const LoginSecondPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(vertical: 22)
                          // padding: ,
                          //   backgroundColor:
                          //   MaterialStateProperty.all(Colors.white),
                          //   shape: MaterialStateProperty.all<
                          //       RoundedRectangleBorder>(RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20),
                          //   ))
                        ),
                        child:
                        const Text(
                          'Смотреть историю пополнений',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18, //16
                              color: ConstColor.textBlack
                          ),
                        ),
                      ),
                    ),
                  ),

                  for (final CurrencyData data in currencyList)
                    currencyCont(data: data),

                ],
              ),

              const SizedBox(height: 100,)

            ],
          ),
        ),
      ),
    );
  }


  Widget graphCont({required CurrencyData data}) {

    const double contWidth = 165;
    const double contHeight = contWidth*0.3333333333333333;

    final bool isDark = data.title=='SOL';

    return Padding(
    padding: EdgeInsets.only(
        right: 20.sp  //21
    ),
    child: Container(
      height: 250,
      padding:
      EdgeInsets.only(
          top: getResSize(14),
          right: getResSize(14),
          bottom: getResSize(14)
      ),
      width: 55.sp, //161
      decoration: BoxDecoration(
          color: isDark? ConstColor.white10 : ConstColor.salad100,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: getResSize(14) //14
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(data.title,
                      style: TextStyle(
                          fontSize: getResSize(16),   //16
                          fontWeight: FontWeight.w500,
                          color: isDark? ConstColor.salad100 : ConstColor.textBlack
                      ),
                    ),

                    Text('+5,76%',
                      style: TextStyle(
                          fontSize: getResSize(12),   //12
                          fontWeight: FontWeight.w400,
                          color: isDark? ConstColor.textWhite : ConstColor.textBlack
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: getResSize(14), //14
                    top: 5
                ),
                child: Text(data.subtitle,
                  style: TextStyle(
                      fontSize: getResSize(14),   //14
                      fontWeight: FontWeight.w400,
                      color: isDark? ConstColor.textGray : ConstColor.black1A
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: isDark? 17 : 27),
            child: Transform.scale(
              scaleY: isDark? -1 : 1,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 0.8,
                  heightFactor: 1.0,
                  child:
                  CustomPaint(
                    size: const Size(contWidth, contHeight), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: GraphOne(isDark: isDark),
                  ),
                ),
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: getResSize(10)),
                child:  Align(
                  alignment: Alignment.topRight,
                  child: Text('Вы получите',
                    style: TextStyle(
                        fontSize: getResSize(10),   //10
                        fontWeight: FontWeight.w500,
                        color: isDark? ConstColor.textGray : ConstColor.textBlack
                    ),
                  ),
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(
                      left: getResSize(14), //14
                      top: getResSize(12)   //12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cryptoCont(data: data, isDark: isDark),
                      // Container(
                      //   width: 27.sp,    //37
                      //   height: 27.sp,   //37
                      //   decoration:  BoxDecoration(
                      //       color: isDark? ConstColor.salad100 : ConstColor.black1A,
                      //     borderRadius: BorderRadius.circular(15)
                      //   ),
                      //   child: Icon(
                      //       data.icon,
                      //       size: data.iconSize,
                      //       color: isDark? ConstColor.black1A : ConstColor.salad100
                      //   ),
                      // ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                        Text('0.00045',
                          style: TextStyle(
                              fontSize: getResSize(14),   //14
                              fontWeight: FontWeight.w400,
                              color: isDark? ConstColor.textWhite : ConstColor.textBlack
                          ),
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.attach_money_sharp,
                              size: getResSize(12),
                              color: ConstColor.textBlack
                            ),

                            Text('20.13',
                              style: TextStyle(
                                  fontSize: getResSize(12),   //12
                                  fontWeight: FontWeight.w400,
                                  color: isDark? ConstColor.salad100 : ConstColor.textBlack
                              ),
                            ),
                          ],
                        ),

                      ],)

                    ],
                  )
              ),
            ],
          ),

        ],),
    ),
  );
  }

}


//Copy this CustomPainter code to the Bottom of the File
class GraphOne extends CustomPainter {
  final bool isDark;

  GraphOne({this.isDark = false});

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.006060606,size.height*0.9000000);
    path_0.cubicTo(size.width*0.01717170,size.height*0.9575764,size.width*0.05393939,size.height*1.038182,size.width*0.1121212,size.height*0.9000000);
    path_0.cubicTo(size.width*0.1848485,size.height*0.7272727,size.width*0.2242424,size.height*0.5363636,size.width*0.3212121,size.height*0.9000000);
    path_0.cubicTo(size.width*0.4181818,size.height*1.263636,size.width*0.3696970,size.height*0.3818218,size.width*0.4515152,size.height*0.2727309);
    path_0.cubicTo(size.width*0.5333333,size.height*0.1636400,size.width*0.4939394,size.height*0.8000036,size.width*0.5787879,size.height*0.7363673);
    path_0.cubicTo(size.width*0.6636364,size.height*0.6727309,size.width*0.6152121,size.height*0.3436545,size.width*0.7121212,size.height*0.3727273);
    path_0.cubicTo(size.width*0.7727273,size.height*0.3909091,size.width*0.7424242,size.height*0.5454545,size.width*0.8151515,size.height*0.5909091);
    path_0.cubicTo(size.width*0.8733333,size.height*0.6272727,size.width*0.9525273,size.height*0.2484855,size.width*0.9848485,size.height*0.05454545);

    Paint paint0Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=1;
    paint0Stroke.color= isDark? ConstColor.salad100 : ConstColor.black1A;
    // paint_0_stroke.color= Colors.transparent;
    canvas.drawPath(path_0,paint0Stroke);

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0,paint0Fill);

    Paint paint1Fill = Paint()..style=PaintingStyle.fill;
    paint1Fill.color = isDark? ConstColor.salad100 : ConstColor.black1A;
    canvas.drawCircle(Offset(size.width*0.9878788,size.height*0.03636364),size.width*0.01212121,paint1Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}