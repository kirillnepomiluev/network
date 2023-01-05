import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_tab.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class ChooseProfileScreen extends StatelessWidget {
  final ActiveProfileTab activeProfileTab;
  final Function(ActiveProfileTab) changeTab;
  const ChooseProfileScreen({
    Key? key,
    required this.activeProfileTab, required this.changeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileTab(
              text: AppString.of(context).profile,
              tabName: ActiveProfileTab.profile,
              activeTab: activeProfileTab,
              changeTab: changeTab),
          ProfileTab(
              text: AppString.of(context).cupboard,
              tabName: ActiveProfileTab.cupboard,
              activeTab: activeProfileTab,
              changeTab: changeTab),
          ProfileTab(
              text: AppString.of(context).friends,
              tabName: ActiveProfileTab.friends,
              activeTab: activeProfileTab,
              changeTab: changeTab),
        ],
      ),
    );
  }
}
