import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/currency_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/token_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/widgets/wallet_tab.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomeWalletView extends StatelessWidget {
  const HomeWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeWalletViewModel>(
        createModelDataEx: () => HomeWalletViewModel(context),
        builder: (context, model) {
          final mediaTop = MediaQuery.of(context).viewPadding.top;
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                  top: mediaTop,
                  left: 17.sp, //16
                  right: 17.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarRow(
                        title: AppString.of(context).wallet, onPressed: () {}),
                    Padding(
                      padding: EdgeInsets.only(top: 28.sp //41
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WalletTab(
                            tabName: ActiveWalletTabs.tokens,
                            text: AppString.of(context).tokens,
                            activeTab: model.activeTab,
                            changeTab: model.changeTab,
                          ),
                          WalletTab(
                            tabName: ActiveWalletTabs.currency,
                            text: AppString.of(context).currency,
                            activeTab: model.activeTab,
                            changeTab: model.changeTab,
                          ),
                        ],
                      ),
                    ),
                    model.activeTab == ActiveWalletTabs.tokens
                        ? const TokensScreen()
                        : const CurrencyScreen(),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
