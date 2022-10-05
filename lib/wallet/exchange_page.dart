import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  bool showSuccess = false;


  @override
  Widget build(BuildContext context) {
    // final mediaTop = MediaQuery.of(context).viewPadding.top;

    final mediaWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade400,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child:
          showSuccess?
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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


                const Padding(
                  padding: EdgeInsets.only(top: 47),
                  child: Text('Обмен\nуспешно выполнен',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,   //16
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),


                Padding(
                    padding: const EdgeInsets.only(top: 66),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('+ 0.00045 ', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),),
                        Text('BTC', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                      ],)
                ),


                const Padding(
                  padding: EdgeInsets.only(top: 29),
                  child: Text('на вашем счете',
                    style: TextStyle(
                        fontSize: 14,   //14
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: currencyCont(data: currencyList[0]),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 62, ),
                  child: SizedBox(
                    width: double.infinity,  //168
                    height: 53,  //53
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute<void>(
                        //     builder: (context) => const LoginSecondPage()));

                        Navigator.of(context).pop();

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
                      const Text(
                        'Смотреть другие валюты',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16, //16
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                width: mediaWidth,
                // padding: const EdgeInsets.all(14),
                padding: EdgeInsets.only(
                    left: 17.sp, //16
                    right: 17.sp
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      padding: const EdgeInsets.only(top: 37, bottom: 37),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Вы собираетесь обменять',
                            style: TextStyle(fontSize: 24, color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          RichText(
                              text: const TextSpan(
                                // text: '300 баллов',
                                  style: TextStyle(fontSize: 24, color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),

                                  children: <TextSpan>[

                                    TextSpan(text: '300 баллов ',),

                                    TextSpan(text: 'в ',
                                        style: TextStyle(
                                            color: Colors.grey
                                        )
                                    ),

                                    TextSpan(text: 'Bitcoin',),

                                  ]
                              )),
                        ],
                      ),
                    ),

                    Center(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade300
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                          const Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Text('Вы получите', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                Text('0.00045 ', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),),
                                Text('BTC', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                              ],)
                          ),


                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 22,
                                    right: 22,
                                    top: 37,
                                bottom: 19
                                ),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text('Комиссия (2%)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                    Text('0.00015', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                  ],)
                            ),

                        ],),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 70,
                          left: 12,
                          right: 12,
                          top: 68),
                      child: meetRow(context),
                    ),

                  ],
                ),
              ),


              //GO
              Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 50),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Container(
                      width: 72,
                      height: 92,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(36)
                      ),

                      child: Center(
                        child:
                      Icon(Icons.close_outlined, color: ConstColor.grey,
                          size: 19.5.sp,   //20
                        )
                        ,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),



    );
  }



  Widget meetRow(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    final double contSize = mediaWitdh*0.128;   //48
//25
    final double iconElSize = 18.5.sp;   //20

    return InkWell(
      onTap: (){
        setState(() {
          showSuccess = true;
        });

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

class CurrencyData {
  final String title;
  final String subtitle;
  final IconData icon;
  final double iconSize;

  CurrencyData(this.title, this.subtitle, this.icon, this.iconSize);
}


List<CurrencyData> currencyList = [
  CurrencyData('BTC', 'Bitcoin', Network.bitcoin, 20),
  CurrencyData('SOL', 'Solana', Network.sol, 15),
  CurrencyData('DASH', 'Dash', Network.dash, 15),
  CurrencyData('ETH', 'Ethereum', Network.dash, 15),
];

Widget currencyCont({required CurrencyData data}) => Padding(
  padding: const EdgeInsets.only(bottom: 21),
  child: Container(
    padding: const EdgeInsets.all(27),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [

        Row(
          children: [

            Container(
              width: 37,
              height: 37,
              decoration:  BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle
              ),
              child: Icon(data.icon, size: data.iconSize,),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(data.title,
                    style: const TextStyle(
                        fontSize: 16,   //16
                        fontWeight: FontWeight.w400, color: Colors.black),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(data.subtitle,
                      style: const TextStyle(
                          fontSize: 14,   //16
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ),

                ],),
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            const Text('0.00045',
              style: TextStyle(
                  fontSize: 14,   //16
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: const [
                  Icon(Icons.attach_money_sharp, size: 12, color: Colors.grey,),

                  Text('20.13',
                    style: TextStyle(
                        fontSize: 12,   //16
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),

          ],)

      ],),
  ),
);