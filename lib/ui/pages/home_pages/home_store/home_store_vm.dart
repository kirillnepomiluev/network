import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class StoreMainViewModel extends ViewModel {
  final BuildContext context;
  StoreMainViewModel(this.context);

  ActiveStoreFilerTabs activeTab = ActiveStoreFilerTabs.values.first;
  void changeTab(ActiveStoreFilerTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  final ScrollController avatarScrollContr = ScrollController();
  final ScrollController headwearScrollContr = ScrollController();

  void onNotificationIconTap() {}

  void onViewAvatarsTap() {
    // context.router.push(const StoreCategoryAvatarsViewRoute());
    context.router.push(StoreCategoryViewRoute(
        title: AppString.of(context).avatars,
        storeCategoryScreen: StoreCategoryScreens.avatars));
  }

  void onViewHeadWaresTap() {
    // context.router.push(const StoreCategoryHeadwearsViewRoute());
    context.router.push(StoreCategoryViewRoute(
        title: AppString.of(context).headwears,
        storeCategoryScreen: StoreCategoryScreens.hats));
  }
}
