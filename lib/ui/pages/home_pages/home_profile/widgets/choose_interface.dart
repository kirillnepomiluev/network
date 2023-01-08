import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_tab.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class ChooseProfileScreen extends StatelessWidget {
  final ActiveProfileTabs activeProfileTab;
  final Function(ActiveProfileTabs) changeTab;
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
              tabName: ActiveProfileTabs.profile,
              activeTab: activeProfileTab,
              changeTab: changeTab),
          ProfileTab(
              text: AppString.of(context).cupboard,
              tabName: ActiveProfileTabs.cupboard,
              activeTab: activeProfileTab,
              changeTab: changeTab),
          ProfileTab(
              text: AppString.of(context).friends,
              tabName: ActiveProfileTabs.friends,
              activeTab: activeProfileTab,
              changeTab: changeTab),
        ],
      ),
    );
  }
}
