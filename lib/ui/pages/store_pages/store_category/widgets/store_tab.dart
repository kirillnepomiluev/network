import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreFilterTab extends StatelessWidget {
  const StoreFilterTab({
    Key? key,
    required this.activeTab,
    required this.text,
    required this.tabName, required this.changeTab,
  }) : super(key: key);
  final ActiveStoreFilerTabs activeTab;
  final String text;
  final ActiveStoreFilerTabs tabName;
  final Function(ActiveStoreFilerTabs) changeTab;

  @override
  Widget build(BuildContext context) {
    final bool isActive = activeTab==tabName;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (){
          changeTab(tabName);
        },
        child:
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          decoration: BoxDecoration(
            color: AppColors.white10,
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(width: 1.5, color: Colors.grey.shade500)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 3),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 16.5.sp,   //14
                      color: isActive? AppColors.salad : AppColors.textWhite,
                      fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                isActive? Icons.keyboard_arrow_down_sharp: Icons.keyboard_arrow_right,
                size: 20,   //14
                color: isActive? AppColors.salad : AppColors.textWhite,
              )
            ],
          ),
        ),

        // BlurryContainer(
        //   blur: 20,
        //   color: AppColors.white10,
        //   borderRadius: BorderRadius.circular(20),
        //   padding: EdgeInsets.symmetric(
        //     vertical: 18.5.sp, //19
        //   ),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(left: 20),
        //         child: Text(
        //           text,
        //           style: TextStyle(
        //               color: activeTab == tabName
        //                   ? AppColors.salad
        //                   : Colors.white,
        //               fontSize: 16.5.sp, //14
        //               fontWeight: FontWeight.w500),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(left: 5, right: 16),
        //         child: activeTab == tabName
        //             ? Icon(
        //           Icons.keyboard_arrow_down,
        //           color: AppColors.salad,
        //           size: 19.sp, //20
        //         )
        //             : Icon(
        //           Icons.keyboard_arrow_right,
        //           color: Colors.white,
        //           size: 19.sp, //20
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
