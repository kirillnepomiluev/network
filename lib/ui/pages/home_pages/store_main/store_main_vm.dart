import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/store_pages/avatars_pages/avatar_category/view_category_avatar_page.dart';
import 'package:network_app/ui/pages/store_pages/hat_pages/hat_category/view_category_hats.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class StoreMainViewModel extends ViewModel {
  final BuildContext context;
  StoreMainViewModel(this.context);

  ActiveStoreTab activeTab = ActiveStoreTab.store;
  void changeTab(ActiveStoreTab tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  final ScrollController avatarScrollContr = ScrollController();
  final ScrollController headwearScrollContr = ScrollController();

  void onNotificationIconTap(){}

  void onViewAvatarsTap(){
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (context) =>
            const ViewCategoryAvatarPage()));
  }

  void onViewHeadWaresTap(){
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (context) =>
            const ViewCategoryHeadWearsPage()));
  }

}