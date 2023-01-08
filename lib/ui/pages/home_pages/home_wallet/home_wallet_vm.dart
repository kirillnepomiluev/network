import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class HomeWalletViewModel extends ViewModel {
  final BuildContext context;
  HomeWalletViewModel(this.context);

  ActiveWalletTabs activeTab = ActiveWalletTabs.values.first;

  void changeTab(ActiveWalletTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }


}