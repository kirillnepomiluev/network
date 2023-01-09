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
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonProfileAvatarInfoContainer extends StatelessWidget {
  const PersonProfileAvatarInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                padV: 14,
                padH: 15,
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
              const SizedBox(
                height: 43,
              ),
              NameWithVerification(
                  strName: 'Джоли, 28',
                  showVerified: true,
                  iconSize: 21.sp,
                  textStyle: AppTextStyles.primary32
                      .copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${AppString.of(context).level} "${AppString.of(context).base}"',
                    style: TextStyle(
                        fontSize: 16.5.sp, //14
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  const RhombusText()
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                '250 м в направлении',
              ),
              const SizedBox(
                height: 10,
              ),
              AppContainer(
                  padH: 18,
                  padV: 10,
                  color: AppColors.white10,
                  radius: AppBorderRadius.r10,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Открыть карту',
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 12),
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
              const SizedBox(
                height: 30,
              ),
              MeetExchangeRow(onTap: () {
                context.router.push(const PersonProfileViewRoute());
              }),
              const SizedBox(
                height: 32,
              ),
            ],
          )
        ],
      ),
    );
  }
}
