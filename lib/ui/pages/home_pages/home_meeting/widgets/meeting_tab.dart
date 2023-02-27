import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils_responsive.dart';


class MeetingTab extends StatelessWidget {
  const MeetingTab({
    Key? key,
    required this.activeTab,
    required this.text,
    required this.tabName, required this.changeTab,
  }) : super(key: key);
  final ActiveMeetingTabs activeTab;
  final String text;
  final ActiveMeetingTabs tabName;
  final Function(ActiveMeetingTabs) changeTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (){
          changeTab(tabName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: activeTab == tabName?  AppColors.salad : AppColors.white10,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(
              vertical: Res.s16,
              horizontal: Res.s20,
          ),
          child:
          Text(
            text,
            style: TextStyle(
                color:
                activeTab == tabName
                    ? AppColors.textBlack
                    : AppColors.textWhite,
                fontSize: Res.s12, //12
                fontWeight: FontWeight.w500,),
          ),
        ),
      ),
    );
  }
}