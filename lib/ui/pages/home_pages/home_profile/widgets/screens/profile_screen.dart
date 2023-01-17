import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_bottom_curve.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/common/stat_container.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback openBottomSheetProfile;
  const ProfileScreen({
    Key? key,
    required this.openBottomSheetProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: UtilsResponsive.getResSize(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: UtilsResponsive.getResSize(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tima',
                    style: AppTextStyles.primary26
                        .copyWith(fontWeight: FontWeight.w700)),

                SizedBox(
                  height: UtilsResponsive.getResSize(12),
                ),

                Text(
                  AppString.of(context).baseLevel,
                ),

                SizedBox(
                  height: 25.sp,
                ),

                //Готов к встрече
                AppContainer(
                  padV: UtilsResponsive.getResSize(20),
                  color: AppColors.salad,
                  radius: AppBorderRadius.r15,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: UtilsResponsive.getResSize(15)
                            ),
                        child: Icon(
                          NetworkIcons.check_thin,
                          size: UtilsResponsive.getResSize(14),
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: UtilsResponsive.getResSize(12),
                            right: UtilsResponsive.getResSize(20)
                            ),
                        child: Text(AppString.of(context).readyToMeet,
                            style: AppTextStyles.darkSalad
                                .copyWith(fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: UtilsResponsive.getResSize(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatMiniContainer(
                        title: '9.4k', subtitle: AppString.of(context).ofPoints),
                    StatMiniContainer(
                        title: '23', subtitle: AppString.of(context).meets),
                    StatMiniContainer(
                        title: '4.5', subtitle: AppString.of(context).rating),
                  ],
                ),
              ),
              SizedBox(height: UtilsResponsive.getResSize(32),),
              ProfileBottomCurve(
                openBottomSheetProfile: openBottomSheetProfile,
              ),
            ],
          )
        ],
      ),
    );
  }
}
