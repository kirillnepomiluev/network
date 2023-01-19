import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonProfileAvatarInfoContainer extends StatelessWidget {
  const PersonProfileAvatarInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UtilsResponsive.getResSize(10)),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBackButton(contColor: AppColors.black1A.withOpacity(0.65)),
              AppContainer(
                padV: UtilsResponsive.getResSize(14),
                padH: UtilsResponsive.getResSize(15),
                color: AppColors.salad,
                radius: AppBorderRadius.r15,
                child: Center(
                    child: Text(AppString.of(context).businessMeeting,
                        style: AppTextStyles.black12)),
              ),
            ],
          ),
          Column(
            children: [
              NameWithVerification(
                  strName: 'Джоли, 28',
                  showVerified: true,
                  iconSize: 21.sp,
                  textStyle: AppTextStyles.primary32
                      .copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                height: UtilsResponsive.getResSize(10),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${AppString.of(context).level} "${AppString.of(context).base}"',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const RhombusText()
                ],
              ),
              SizedBox(
                height: UtilsResponsive.getResSize(26),
              ),
              const Text(
                '250 м в направлении',
              ),
              SizedBox(height: UtilsResponsive.getResSize(10)),
              AppContainer(
                  padH: UtilsResponsive.getResSize(18),
                  padV: UtilsResponsive.getResSize(10),
                  color: AppColors.white10,
                  radius: AppBorderRadius.r10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Открыть карту',
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: UtilsResponsive.getResSize(12)),
                          child: AppIconContainer(
                            contSize: 18.sp,
                            contColor: AppColors.salad,
                            boxShape: BoxShape.circle,
                            icon: Icons.call_received,
                            iconColor: Colors.black,
                            iconSize: 15.sp,
                          )),
                    ],
                  )),
              SizedBox(
                height: UtilsResponsive.getResSize(30),
              ),
              MeetExchangeRow(onTap: () {
                context.router.push(const PersonProfileViewRoute());
              }),
              SizedBox(
                height: UtilsResponsive.getResSize(24), //32
              ),
            ],
          )
        ],
      ),
    );
  }
}
