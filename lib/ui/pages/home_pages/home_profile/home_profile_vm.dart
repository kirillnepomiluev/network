import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/meeting_notifications_view.dart';
import 'package:network_app/ui/pages/profile_pages/profile_bottom_sheet/profile_bottom_sheet_view.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class ProfileMainViewModel extends ViewModel {
  ProfileMainViewModel(this.context, this.isCupboardInit){
    if (isCupboardInit) {
      activeTab = ActiveProfileTabs.cupboard;
    }
  }
  final BuildContext context;
  final bool isCupboardInit;

  ActiveProfileTabs activeTab = ActiveProfileTabs.values.first;

  void changeTab(ActiveProfileTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  void onNotificationIconTap(){
    showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return const MeetingNotificationsView();
      },
    );
  }

  void openBottomSheetProfile() {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),),
        context: context,
        builder: (BuildContext context) => const ProfileBottomSheetView(),);
  }

  final ScrollController avatarScrollContr = ScrollController();
  final ScrollController hatScrollContr = ScrollController();


  void onTap() {
  }

}