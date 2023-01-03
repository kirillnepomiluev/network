import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/profile_main_vm.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/widgets/tab_container.dart';


class ChooseInterface extends StatelessWidget {
  final ActiveTab activeTab;
  final Function(ActiveTab) changeTab;
  const ChooseInterface({
    Key? key,
    required this.activeTab, required this.changeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabContainer(
              text: AppString.of(context).profile,
              tabName: ActiveTab.profile,
              activeTab: activeTab,
              changeTab: changeTab),
          TabContainer(
              text: AppString.of(context).cupboard,
              tabName: ActiveTab.cupboard,
              activeTab: activeTab,
              changeTab: changeTab),
          TabContainer(
              text: AppString.of(context).friends,
              tabName: ActiveTab.friends,
              activeTab: activeTab,
              changeTab: changeTab),
        ],
      ),
    );
  }
}
