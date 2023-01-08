import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils_responsive.dart';


class InvitationTab extends StatelessWidget {
  final ActiveInvitationTabs activeTab;
  final String text;
  final ActiveInvitationTabs tabName;
  final Function(ActiveInvitationTabs) changeTab;
  const InvitationTab({
    Key? key,
    required this.activeTab,
    required this.text,
    required this.tabName, required this.changeTab,
  }) : super(key: key);

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
          padding: const EdgeInsets.symmetric(
              vertical: 16, //19
              horizontal: 20
          ),
          child:
          Text(
            text,
            style: TextStyle(
                color:
                activeTab == tabName
                    ? AppColors.textBlack
                    : AppColors.textWhite,
                fontSize: UtilsResponsive.getResSize(12), //12
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}