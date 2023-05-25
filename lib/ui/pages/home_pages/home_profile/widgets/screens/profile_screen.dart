import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_bottom_curve.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/stat_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.openBottomSheetProfile,
  }) : super(key: key);
  final VoidCallback openBottomSheetProfile;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;
    return Padding(
      padding: EdgeInsets.only(
          top: Res.s25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Padding(
            padding: EdgeInsets.only(
                left: Res.s15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tima',
                    style: AppTextStyles.primary26
                        .copyWith(fontWeight: FontWeight.w700),),

                SizedBox(
                  height: Res.s12,
                ),

                Text(
                    userData.rankText,
                  // AppString.of(context).baseLevel,
                ),

                SizedBox(
                  height: 25.sp,
                ),

                //Готов к встрече
                AppContainer(
                  padV: Res.s16,
                  color: AppColors.salad,
                  radius: AppBorderRadius.r15,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Res.s15,
                            ),
                        child: Icon(
                          NetworkIcons.check_thin,
                          size: Res.s14,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Res.s12,
                            right: Res.s20,
                            ),
                        child: Text(AppString.of(context).readyToMeet,
                            style: AppTextStyles.darkSalad
                                .copyWith(fontWeight: FontWeight.w500),),
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
                    left: Res.s15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatMiniContainer(
                        title: userData.points.toString(), subtitle: AppString.of(context).ofPoints,),
                    StatMiniContainer(
                        title: userData.meetingsCount.toString(), subtitle: AppString.of(context).meets,),
                    StatMiniContainer(
                        title: userData.rating.toString(), subtitle: AppString.of(context).rating,),
                  ],
                ),
              ),
              SizedBox(height: Res.s32,),
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
