import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileTab extends StatelessWidget {
  final ActiveProfileTab activeTab;
  final String text;
  final ActiveProfileTab tabName;
  final Function(ActiveProfileTab) changeTab;
  const ProfileTab({
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
        child: BlurryContainer(
          blur: 20,
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(20),
          padding: EdgeInsets.symmetric(
            vertical: 18.5.sp, //19
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      color: activeTab == tabName
                          ? AppColors.salad100
                          : Colors.white,
                      fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 16),
                child: activeTab == tabName
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.salad100,
                        size: 19.sp, //20
                      )
                    : Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 19.sp, //20
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
