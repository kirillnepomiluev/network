import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/profile_main/widgets/bottom_sheet_main.dart';
import 'package:network_app/ui/pages/meeting_pages/notifications/notifications_page.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class ProfileMainViewModel extends ViewModel {
  final BuildContext context;
  final bool isCupboardInit;
  ProfileMainViewModel(this.context, this.isCupboardInit){
    if (isCupboardInit) {
      activeTab = ActiveProfileTab.cupboard;
    }
  }

  ActiveProfileTab activeTab = ActiveProfileTab.values.first;

  void changeTab(ActiveProfileTab tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  void onNotificationIconTap(){
    showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return const NotificationsPage();
      },
    );
  }

  void openBottomSheetProfile() {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) => const BottomSheetMain());
  }

  final ScrollController avatarScrollContr = ScrollController();
  final ScrollController hatScrollContr = ScrollController();


  void onTap() {
  }

}