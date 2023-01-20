import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_tab.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ChooseProfileScreen extends StatelessWidget {
  const ChooseProfileScreen({
    Key? key,
    required this.activeProfileTab, required this.changeTab,
  }) : super(key: key);
  final ActiveProfileTabs activeProfileTab;
  final Function(ActiveProfileTabs) changeTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 17.5.sp,
        top: 19.sp, //20
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProfileTab(
                text: AppString.of(context).profile,
                tabName: ActiveProfileTabs.profile,
                activeTab: activeProfileTab,
                changeTab: changeTab,),
            ProfileTab(
                text: AppString.of(context).cupboard,
                tabName: ActiveProfileTabs.cupboard,
                activeTab: activeProfileTab,
                changeTab: changeTab,),
            ProfileTab(
                text: AppString.of(context).friends,
                tabName: ActiveProfileTabs.friends,
                activeTab: activeProfileTab,
                changeTab: changeTab,),
          ],
        ),
      ),
    );
  }
}
