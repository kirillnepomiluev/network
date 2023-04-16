import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_vm.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/widgets/wallet_exchange_info_container.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/widgets/wallet_exchange_top_row.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class WalletExchangeView extends StatelessWidget {
  const WalletExchangeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WalletExchangeViewModel>(
        createModelDataEx: () => WalletExchangeViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Res.s16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarRow(
                        title: AppString.of(context).wallet,
                      ),
                      SizedBox(
                        height: 27.sp,
                      ), //37
                      const WalletExchangeTopRow(),
                      SizedBox(
                        height: 27.sp,
                      ),
                      const WalletExchangeInfoContainer(),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 35.sp, //70
                            left: Res.s12,
                            right: Res.s12,
                            top: 35.sp, //68
                            ),
                        child: MeetExchangeRow(
                          isExchange: true,
                          onTap: model.onExchangeTap,
                        ),
                      ),
                      SizedBox(
                        height: Res.s40, //45
                      ),
                      InkWell(
                        onTap: model.onCloseIconTap,
                        child: Center(
                          child: AppContainer(
                            width: 35.sp, //66
                            height: 35.sp * 1.394, //92
                            radius: 37,
                            color: AppColors.salad,
                            child: Icon(
                              Icons.close_rounded,
                              color: AppColors.black1A,
                              size: 22.sp, //20
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Res.s40, //50
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}