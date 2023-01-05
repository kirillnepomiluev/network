import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletTab extends StatelessWidget {
  final ActiveWalletTab activeTab;
  final ActiveWalletTab tabName;
  final String text;
  final Function(ActiveWalletTab) changeTab;
  const WalletTab({Key? key, required this.activeTab, required this.tabName, required this.text, required this.changeTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        changeTab(tabName);
      },
      child: Container(
        width: mediaWitdh*0.43,  //161   55
        height: 40.sp,   //91   40
        decoration: BoxDecoration(
          color: activeTab == tabName
              ? AppColors.salad100
              : AppColors.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: TextStyle(
                  color: activeTab == tabName
                      ? AppColors.textBlack
                      : AppColors.textWhite,
                  fontSize: 18.sp, //16
                  fontWeight: FontWeight.w400),
            ),


            Padding(
              padding: EdgeInsets.only(
                  left: 13.sp //9
              ),
              child: Icon(
                activeTab == tabName
                    ? NetworkIcons.arrow_right_down
                    : Icons.arrow_forward_rounded,
                size:
                activeTab == tabName
                    ?14.sp   //10
                    : 18.sp,

                color: activeTab == tabName
                    ? AppColors.textBlack
                    : AppColors.textWhite,
              ),
            )

          ],
        ),
      ),
    );
  }
}