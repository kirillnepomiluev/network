import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Смотреть историю пополнений
        Padding(
          padding: EdgeInsets.only(
              top: 20.sp, //21
              bottom: 21.sp //24
          ),
          child: SizedBox(
            width: double.infinity, //168
            // height: 32.sp,  //53
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 22)),
              child: const Text(
                'Смотреть историю пополнений',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18, //16
                    color: AppColors.textBlack),
              ),
            ),
          ),
        ),

        for (final CurrencyData data in currencyList) currencyCont(data: data),
      ],
    );
  }
}