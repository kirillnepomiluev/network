import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/notifications/notifications_page.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/widgets/bottom_sheet_main.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

enum ActiveTab{
  profile,
  cupboard,
  friends
}

class ProfileMainViewModel extends ViewModel {
  final BuildContext context;
  final bool isCupboardInit;
  ProfileMainViewModel(this.context, this.isCupboardInit){
    if (isCupboardInit) {
      activeTab = ActiveTab.cupboard;
    }
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

  ActiveTab activeTab = ActiveTab.profile;

  void changeTab(ActiveTab tabName) {
      activeTab = tabName;
      notifyListeners();
  }

  void onTap() {
  }

}