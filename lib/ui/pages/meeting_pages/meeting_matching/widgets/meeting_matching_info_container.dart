import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/utils/res.dart';

class MeetingMatchingInfoContainer extends StatelessWidget {
  const MeetingMatchingInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padV: Res.s23,   //23
      padH: Res.s17,   //17
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '92% совпадений',
            style: AppTextStyles.salad24.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Res.s20,
          ),
          AppContainer(
            padV: Res.s13,
            padH: Res.s15,
            color: AppColors.salad,
            radius: AppBorderRadius.r15,
            child: Text(AppString.of(context).businessMeeting,
                style: AppTextStyles.black12,),
          ),
          SizedBox(
            height: Res.s26,
          ),
          Row(
            children: [
              Text(AppString.of(context).tokensForMeeting,
                  style: AppTextStyles.primary12,),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: RhombusText(
                  fontSize: Res.s18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            height: Res.s26,
          ),
      const AppWrapContainersWithRemove(listOptions: ['Большой теннис', 'Бассейн', 'Управление', 'Маркетинг'],)

          // Wrap(
          //   spacing: UtilsResponsive.getResSize(10),
          //   runSpacing: UtilsResponsive.getResSize(10),
          //   direction: Axis.horizontal,
          //   children: const [
          //     AppContainerWithRemove(title: 'Большой теннис', hasRemove: false,),
          //     AppContainerWithRemove(title: 'Бассейн', hasRemove: false,),
          //     AppContainerWithRemove(title: 'Управление', hasRemove: false,),
          //     AppContainerWithRemove(title: 'Маркетинг', hasRemove: false,),
          //   ],
          // ),
        ],
      ),
    );
  }
}