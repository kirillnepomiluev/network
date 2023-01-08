import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/graph_cont.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TokensScreen extends StatelessWidget {
  const TokensScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 26.sp //37
          ),
          child: Text(
            'Общее количество баллов',
            style: TextStyle(
              fontSize: 17.5.sp, //16
              fontWeight: FontWeight.w400,
              // color: Colors.black
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Text(
            '330',
            style: TextStyle(
                fontSize: 27.sp, //38
                fontWeight: FontWeight.w700,
                color: AppColors.salad),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.sp //33
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 19.5.sp, //20
                vertical: 24.sp //32
            ), //14
            decoration: BoxDecoration(
              color: AppColors.white10,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
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
                              color: AppColors.salad),
                        ),
                        Text(
                          'токенов',
                          maxLines: null,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: UtilsResponsive.getResSize(12), //12
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.sp //30
                  ),
                  child: MeetExchangeRow(
                    isExchange: true,
                    onTap: () {
                      context.router.push(const WalletExchangeViewRoute());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final CurrencyData data in currencyList)
                    GraphCont(data: data),
                ],
              ),
            )),
      ],
    );
  }
}