import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class WalletMainViewModel extends ViewModel {
  final BuildContext context;
  WalletMainViewModel(this.context);

  ActiveWalletTab activeTab = ActiveWalletTab.values.first;

  void changeTab(ActiveWalletTab tabName) {
    activeTab = tabName;
    notifyListeners();
  }


}