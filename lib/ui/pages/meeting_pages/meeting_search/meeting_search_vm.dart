import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class MeetingSearchViewModel extends ViewModel {
  MeetingSearchViewModel(this.context);
  final BuildContext context;

  ActiveSearchTabs activeTab = ActiveSearchTabs.values.first;

  void changeTab(ActiveSearchTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  void onScreenTap(){
    FocusManager.instance.primaryFocus?.unfocus();
  }

}