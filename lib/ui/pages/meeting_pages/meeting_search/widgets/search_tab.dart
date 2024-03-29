import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/res.dart';


class MeetingSearchTab extends StatelessWidget {
  const MeetingSearchTab({
    Key? key,
    required this.activeTab,
    required this.text,
    required this.tabName, required this.changeTab,
  }) : super(key: key);
  final ActiveSearchTabs activeTab;
  final String text;
  final ActiveSearchTabs tabName;
  final Function(ActiveSearchTabs) changeTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              fontSize: Res.s12,
              fontWeight: FontWeight.w500,),
        ),
      ),
    );
  }
}