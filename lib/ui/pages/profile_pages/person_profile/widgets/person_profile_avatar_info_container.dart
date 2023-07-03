import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_online_container.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils_locale.dart';
import 'package:network_app/utils/utils_meetings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonProfileAvatarInfoContainer extends StatelessWidget {
  const PersonProfileAvatarInfoContainer({
    Key? key, required this.partnerModel,
  }) : super(key: key);
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Res.s10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // AppBackButton(contColor: AppColors.black1A.withOpacity(0.65)),

              MeetingOnlineContainer(partnerModel: partnerModel),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: AppContainer(
                  padV: Res.s14,
                  padH: Res.s15,
                  color: AppColors.salad,
                  radius: AppBorderRadius.r15,
                  child: Center(
                      child: Text(AppString.of(context).businessMeeting,
                          style: AppTextStyles.black12,),),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: NameWithVerification(
                    userModel: partnerModel,
                    showFullName: true,
                    iconSize: 21.sp,
                    textStyle: AppTextStyles.primary32
                        .copyWith(fontWeight: FontWeight.w600),),
              ),
              SizedBox(
                height: Res.s10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      UtilsLocale.getLevelText(partnerModel.level, context)
                    // '${AppString.of(context).level} "${AppString.of(context).base}"',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RhombusText(
                    tokens: UtilsMeeting.culcTokens(partnerModel),
                  )
                ],
              ),
              SizedBox(
                height: Res.s26,
              ),
              const Text(
                '250 m from you',
              ),
              SizedBox(height: Res.s10),
              AppContainer(
                  padH: Res.s18,
                  padV: Res.s10,
                  color: AppColors.white10,
                  radius: AppBorderRadius.r10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Open map',
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: Res.s12,),
                          child: AppIconContainer(
                            contSize: 18.sp,
                            contColor: AppColors.salad,
                            boxShape: BoxShape.circle,
                            icon: Icons.call_received,
                            iconColor: Colors.black,
                            iconSize: 15.sp,
                          ),),
                    ],
                  ),),
              SizedBox(
                height: Res.s32,
              ),
              MeetExchangeRow(onTap: () {

                UtilsMeeting.onMeetingTap(context, partnerModel);

                // context.router.push(const PersonProfileViewRoute());
              },),
              SizedBox(
                height: Res.s24, //32
              ),
            ],
          )
        ],
      ),
    );
  }
}
