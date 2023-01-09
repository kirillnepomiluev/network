import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_graph_cont.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/utils/main_pages/wallet_currency_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletTokensScreen extends StatelessWidget {
  const WalletTokensScreen({Key? key}) : super(key: key);

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
            style: AppTextStyles.primary16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Text(
            '330',
            style: AppTextStyles.salad38,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.sp //33
          ),
          child: AppContainer(
            padH: 19.5.sp, //20
            padV: 24.sp, //32
            radius: AppBorderRadius.r15,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        'Вы можете обменять баллы\nна выбранную криптовалюту',
                        maxLines: null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '300',
                          maxLines: null,
                          style: AppTextStyles.salad16
                        ),
                        Text(
                          'токенов',
                          maxLines: null,
                          style: AppTextStyles.grey12.copyWith(color: Colors.grey)
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 24.sp,),
                MeetExchangeRow(
                  isExchange: true,
                  onTap: () {
                    context.router.push(const WalletExchangeViewRoute());
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final WalletCurrencyData data in WalletCurrencyData.currencyList)
                WalletGraphCont(data: data),
            ],
          ),
        ),
      ],
    );
  }
}