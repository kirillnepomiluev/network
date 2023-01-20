import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_currency_container.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange_success/wallet_exchange_success_vm.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/wallet_currency_data.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletExchangeSuccessView extends StatelessWidget {
  const WalletExchangeSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletExchangeSuccessViewModel>(
        createModelDataEx: () => WalletExchangeSuccessViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: UtilsResponsive.getResSize(16)),
                  child: Column(
                    children: [
                      AppBarRow(title: AppString.of(context).wallet,),
                      SizedBox(height: 30.sp,),
                      const RichTextTwo(
                        text1: 'Обмен\n',
                        text2: 'успешно выполнен',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35.5.sp,), //66
                      Text(
                          '0.00045 BTC',
                          style: AppTextStyles.salad38.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: UtilsResponsive.getResSize(13),),
                      const Text(
                        'на вашем счете',
                      ),
                      SizedBox(height: UtilsResponsive.getResSize(40),),
                      // const SizedBox(height: 50),

                      WalletCurrencyContainer(data: WalletCurrencyData.currencyList[0]),
                      SizedBox(height: UtilsResponsive.getResSize(40),),
                      // const SizedBox(height: 48),

                      AppButton(onPressed: (){
                        context.router.pop();
                      }, text:  'Смотреть другие валюты',),
                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}

