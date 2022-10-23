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
  int _activeWalletTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    final mediaWitdh = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() {
        setState(() {
          _activeWalletTab = position;
        });
      }),
      child: Container(
        width: mediaWitdh*0.43,  //161   55
        height: 40.sp,   //91   40
        // padding: EdgeInsets.all(0.0373 * mediaWidth), //14
        decoration: BoxDecoration(
          color: _activeWalletTab == position
              ? ConstColor.grey
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: TextStyle(
                  fontSize: 18.sp, //16
                  fontWeight: FontWeight.w400),
            ),


            Padding(
              padding: EdgeInsets.only(
                  left: 13.sp //9
              ),
              child: Icon(
                position==1
                    ? Network.arrow_right_down
                    : Network.arrow_right_up,
                size: 14.sp,   //10
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
      backgroundColor: Colors.grey.shade400,
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
                padding: EdgeInsets.only(top: 10),
                child:
                Stack(
                  alignment: Alignment.center,
                  children: [
                    BackButtonCustom( func: (){}),
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
                padding: EdgeInsets.only(
                    top: 28.sp  //41
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              _activeWalletTab==1?
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
                        fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text('330',
                      style: TextStyle(
                          fontSize: 27.sp,   //38
                          fontWeight: FontWeight.w700, color: Colors.black),
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
                        color: Colors.grey.shade300,
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
                                      fontWeight: FontWeight.w400),
                                ),

                                Text(
                                  'баллов',
                                  maxLines: null,
                                  style: TextStyle(
                                    color: Colors.grey,
                                      fontSize: getResSize(12), //12
                                      fontWeight: FontWeight.w400),
                                ),

                              ],)

                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: 24.sp  //30
                            ),
                            child: meetRow(context),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: 24.sp  //32
                    ),
                    child: Text('Выберете валюту',
                      style: TextStyle(
                          fontSize: 16.5.sp,   //14
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(
                          top: 17.5.sp  //16
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
                      height: 32.sp,  //53
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute<void>(
                          //     builder: (context) => const LoginSecondPage()));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(52),
                              // side: BorderSide(color: Colors.red)
                            ))
                          // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child:
                        Text(
                          'Смотреть историю пополнений',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getResSize(16), //16
                              color: Colors.white),
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


  Widget graphCont({required CurrencyData data}) => Padding(
    padding: EdgeInsets.only(
        right: 20.sp  //21
    ),
    child: Container(
      padding:
      EdgeInsets.only(
          top: getResSize(14),
          right: getResSize(14),
          bottom: getResSize(14)
      ),
      width: 55.sp, //161
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),

                Text('+5,76%',
                  style: TextStyle(
                      fontSize: getResSize(12),   //16
                      fontWeight: FontWeight.w400, color: Colors.black),
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
                  fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: 22.sp  //28
            ),
            child:
            Image.asset('assets/images/${data.title=='BTC'?'graph_btc.png':'graph_sol.png'}',),
          ),

          Padding(
            padding:  EdgeInsets.only(top: getResSize(10)),
            child:  Align(
              alignment: Alignment.topRight,
              child: Text('Вы получите',
                style: TextStyle(
                    fontSize: getResSize(10),   //10
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
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
                  Container(
                    width: 27.sp,    //37
                    height: 27.sp,   //37
                    decoration:  BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle
                      // borderRadius: BorderRadius.circular(15)
                    ),
                    child: Icon(data.icon, size: data.iconSize, color: Colors.black),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                    Text('0.00045',
                      style: TextStyle(
                          fontSize: getResSize(14),   //14
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_sharp,
                          size: getResSize(12),
                          color: Colors.grey,),

                        Text('20.13',
                          style: TextStyle(
                              fontSize: getResSize(12),   //12
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),

                  ],)

                ],
              )
          ),


        ],),
    ),
  );

  Widget meetRow(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    final double contSize = mediaWitdh*0.128;   //48
    final double iconElSize = 18.5.sp;   //20

    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (context) =>
                const ExchangePage()));
      },
      child: Container(
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


