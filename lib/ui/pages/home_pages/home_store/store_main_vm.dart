import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class StoreMainViewModel extends ViewModel {
  final BuildContext context;
  StoreMainViewModel(this.context);

  ActiveStoreTabs activeTab = ActiveStoreTabs.values.first;
  void changeTab(ActiveStoreTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  final ScrollController avatarScrollContr = ScrollController();
  final ScrollController headwearScrollContr = ScrollController();

  void onNotificationIconTap(){}

  void onViewAvatarsTap(){
    context.router.push(const StoreCategoryAvatarsViewRoute());
  }

  void onViewHeadWaresTap(){
    context.router.push(const StoreCategoryHeadwearsViewRoute());
  }

}