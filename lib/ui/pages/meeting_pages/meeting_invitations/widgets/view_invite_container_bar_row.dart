import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ViewInviteContainerTop extends StatelessWidget {
  const ViewInviteContainerTop({
    Key? key,
    required this.activeTab,
    required this.showVerified,
  }) : super(key: key);

  final ActiveInvitationTabs activeTab;
  final bool showVerified;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Тип
        AppContainer(
          height: 28.sp, //38,
          padH: UtilsResponsive.getResSize(17),
          radius: AppBorderRadius.r15,
          child: Center(
            child: Text(AppString.of(context).businessMeeting,
                style: AppTextStyles.primary12,),
          ),
        ),

        if (activeTab == ActiveInvitationTabs.invitations) Text('2 ч назад',
                style: AppTextStyles.primary.copyWith(color: AppColors.grey3),) else Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: UtilsResponsive.getResSize(13),
                      horizontal: showVerified ? UtilsResponsive.getResSize(17) : UtilsResponsive.getResSize(13),
                  ),
                  decoration: BoxDecoration(
                    color:
                        showVerified ? AppColors.white10 : AppColors.salad,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: showVerified
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('02:04:15',
                                style: AppTextStyles.primary12
                                    .copyWith(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.timer_outlined,
                                color: Colors.white,
                                size: UtilsResponsive.getResSize(16), //16
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppString.of(context).readyToMeet,
                                style: AppTextStyles.black12
                                    .copyWith(fontWeight: FontWeight.w500),),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.75),
                              child: Icon(
                                NetworkIcons.check,
                                size: 15.sp,
                              ),
                            ),
                          ],
                        ),
                ),
              )
      ],
    );
  }
}
