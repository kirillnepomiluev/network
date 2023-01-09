import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class StoreCategoryAvatarsViewModel extends ViewModel {
  final BuildContext context;
  StoreCategoryAvatarsViewModel(this.context);

  ActiveStoreFilerTabs activeTab = ActiveStoreFilerTabs.values.first;

  void changeTab(ActiveStoreFilerTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

}