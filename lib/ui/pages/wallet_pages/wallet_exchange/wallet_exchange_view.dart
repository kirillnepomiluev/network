import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletExchangeView extends StatefulWidget {
  const WalletExchangeView({Key? key}) : super(key: key);

  @override
  State<WalletExchangeView> createState() => _WalletExchangeViewState();
}

class _WalletExchangeViewState extends State<WalletExchangeView> {
  bool showSuccess = false;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SingleChildScrollView(
          child: showSuccess
              ? Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AppBackButton( func: () {}),
                            Center(
                                child: Text(
                              'Кошелек',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.5.sp, //18
                                  fontWeight: FontWeight.w600,
                                  // color: Colors.black
                              ),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 30.sp     //47
                        ),
                        child:
                        const RichTextTwo(
                          text1: 'Обмен\n',
                          text2: 'успешно выполнен',
                          // color1: ConstColor.salad100,
                          // color2: ConstColor.textWhite,
                          textAlign: TextAlign.center,
                        )

                        // Text(
                        //   'Обмен\nуспешно выполнен',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       fontSize: ResponsiveUtils.getResSize(24), //24
                        //       fontWeight: FontWeight.w600,
                        //       color: Colors.black),
                        // ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(
                              top: 35.5.sp  //66
                          ),
                          child:
                          Text(
                            '0.00045 BTC',
                            style: TextStyle(
                                color: AppColors.salad,
                                fontSize: 27.sp, //38
                                fontWeight: FontWeight.w600
                            ),
                          )
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       '+ 0.00045 ',
                          //       style: TextStyle(
                          //           fontSize: 27.sp, //38
                          //           fontWeight: FontWeight.w600),
                          //     ),
                          //     Text(
                          //       'BTC',
                          //       style: TextStyle(
                          //           fontSize: ResponsiveUtils.getResSize(20),
                          //           fontWeight: FontWeight.w600),
                          //     ),
                          //   ],
                          // )
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 13),    //29
                        child: Text(
                          'на вашем счете',
                          style: TextStyle(
                              fontSize: UtilsResponsive.getResSize(14), //14
                              fontWeight: FontWeight.w400,
                              // color: Colors.black
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: currencyCont(data: currencyList[0]),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 48
                        ),
                        child: SizedBox(
                          width: double.infinity, //168
                          // height: 32.sp, //53
                          child: ElevatedButton(
                            onPressed: () {
                              context.router.pop();

                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  // side: BorderSide(color: Colors.red)
                                ))
                                // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Смотреть другие валюты',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: UtilsResponsive.getResSize(16), //16
                                    color: AppColors.textBlack
                                ),
                              ),
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
                          left: UtilsResponsive.getResSize(16), //16
                          right: UtilsResponsive.getResSize(16)),
                      decoration: const BoxDecoration(
                        // color: ConstColor.white10,
                        color: AppColors.blackBack,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AppBackButton( func: () {}),
                                Center(
                                    child: Text(
                                  'Кошелек',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18.5.sp, //18
                                      fontWeight: FontWeight.w600,
                                      // color: Colors.black
                                  ),
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 27.sp, //37
                                bottom: 27.sp //37
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Вы собираетесь обменять',
                                  style: TextStyle(
                                    fontSize: UtilsResponsive.getResSize(24), //24
                                    // color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                        // text: '300 баллов',
                                        style: TextStyle(
                                          fontSize: UtilsResponsive.getResSize(24),
                                          // color: ConstColor.salad100,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        children: const <TextSpan>[
                                      TextSpan(
                                        text: '300 баллов ',
                                        style: TextStyle(
                                          color: AppColors.salad
                                        )
                                      ),
                                      TextSpan(
                                          text: 'в ',
                                          // style: TextStyle(color: Colors.grey)
                                          ),
                                      TextSpan(
                                        text: 'Bitcoin',
                                          style: TextStyle(
                                              color: AppColors.salad
                                          )
                                      ),
                                    ])),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.white10
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 24.sp //32
                                        ),
                                    child: Text(
                                      'Вы получите',
                                      style: TextStyle(
                                          fontSize: UtilsResponsive.getResSize(14), //14
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: UtilsResponsive.getResSize(15)),
                                      child:
                                      Text(
                                        '0.00045 BTC',
                                        style: TextStyle(
                                            color: AppColors.salad,
                                            fontSize: 27.sp, //38
                                            fontWeight: FontWeight.w600
                                        ),
                                      )
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.center,
                                      //   children: [
                                      //     Text(
                                      //       '0.00045 BTC',
                                      //       style: TextStyle(
                                      //         color: ConstColor.salad100,
                                      //           fontSize: 27.sp, //38
                                      //           fontWeight: FontWeight.w600
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       'BTC',
                                      //       style: TextStyle(
                                      //           fontSize: ResponsiveUtils.getResSize(20),
                                      //           fontWeight: FontWeight.w600),
                                      //     ),
                                      //   ],
                                      // )
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.sp,   //22
                                          right: 20.sp,  //22
                                          top: 27.sp,    //37
                                          bottom: 18.5.sp  //19
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Комиссия (2%)',
                                            style: TextStyle(
                                                fontSize: UtilsResponsive.getResSize(14),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            '0.00015',
                                            style: TextStyle(
                                                fontSize: UtilsResponsive.getResSize(18),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 35.sp,  //70
                                left: UtilsResponsive.getResSize(12),
                                right: UtilsResponsive.getResSize(12),
                                top: 35.sp     //68
                            ),
                            child: MeetExchangeRow(
                              isExchange: true,
                              onTap: (){
                                setState(() {
                                  showSuccess = true;
                                });
                              },

                            ),
                          ),
                        ],
                      ),
                    ),
                    //GO
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 45,      //45
                          bottom: 50    //50
                      ),
                      child: InkWell(
                        onTap: () {
                          context.router.pop();

                        },
                        child: Center(
                          child: Container(
                            width: 66,
                            height: 92,
                            decoration: BoxDecoration(
                                color: AppColors.salad,
                                borderRadius: BorderRadius.circular(37)),
                            child: Icon(
                              Icons.close_rounded,
                              color: AppColors.black1A,
                              size: 22.sp, //20
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

}





class CurrencyData {
  final String title;
  final String subtitle;
  final IconData icon;
  final double iconSize;

  CurrencyData(this.title, this.subtitle, this.icon, this.iconSize);
}

List<CurrencyData> currencyList = [
  CurrencyData(
    'BTC',
    'Bitcoin',
    NetworkIcons.bitcoin,
    UtilsResponsive.getResSize(20),
  ), //20
  CurrencyData('SOL', 'Solana', NetworkIcons.sol, UtilsResponsive.getResSize(14)), //14
  CurrencyData('DASH', 'Dash', NetworkIcons.dash, UtilsResponsive.getResSize(15)), //15
  CurrencyData('ETH', 'Ethereum', NetworkIcons.eth, UtilsResponsive.getResSize(20)), //20
];

Widget currencyCont({required CurrencyData data}) => Padding(
      padding: EdgeInsets.only(bottom: 20.sp //21
          ),
      child: Container(
        padding: EdgeInsets.all(22.5.sp), //27
        decoration: BoxDecoration(
            color: AppColors.white10,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                cryptoCont(data: data, isDark: true),

                // Container(
                //   width: 27.sp, //37
                //   height: 27.sp, //37
                //   decoration: BoxDecoration(
                //       color: Colors.grey.shade400, shape: BoxShape.circle),
                //   child: Icon(
                //     data.icon,
                //     size: data.iconSize,
                //     color: Colors.black,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: UtilsResponsive.getResSize(18) //18
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                            fontSize: UtilsResponsive.getResSize(16), //16
                            fontWeight: FontWeight.w400,
                            // color: Colors.black
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          data.subtitle,
                          style: TextStyle(
                              fontSize: UtilsResponsive.getResSize(14), //14
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '0.00045',
                  style: TextStyle(
                      fontSize: UtilsResponsive.getResSize(14), //14
                      fontWeight: FontWeight.w400,
                      // color: Colors.black
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money_sharp,
                        size: UtilsResponsive.getResSize(12), //12
                        color: AppColors.salad
                      ),
                      Text(
                        '20.13',
                        style: TextStyle(
                            fontSize: UtilsResponsive.getResSize(12), //12
                            fontWeight: FontWeight.w400,
                            color: AppColors.salad
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );


Widget cryptoCont({required CurrencyData data, bool isDark=false}) => Container(
  width: 27.sp,    //37
  height: 27.sp,   //37
  decoration:  BoxDecoration(
      color: isDark? AppColors.salad : AppColors.black1A,
      borderRadius: BorderRadius.circular(15)
  ),
  child: Icon(
      data.icon,
      size: data.iconSize,
      color: isDark? AppColors.black1A : AppColors.salad
  ),
);