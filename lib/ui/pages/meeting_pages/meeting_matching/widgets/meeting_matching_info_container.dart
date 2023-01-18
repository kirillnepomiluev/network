import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetingMatchingInfoContainer extends StatelessWidget {
  const MeetingMatchingInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padV: UtilsResponsive.getResSize(23),   //23
      padH: UtilsResponsive.getResSize(17),   //17
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '92% совпадений',
            style: AppTextStyles.salad24.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: UtilsResponsive.getResSize(20),
          ),
          AppContainer(
            padV: UtilsResponsive.getResSize(13),
            padH: UtilsResponsive.getResSize(15),
            color: AppColors.salad,
            radius: AppBorderRadius.r15,
            child: Text(AppString.of(context).businessMeeting,
                style: AppTextStyles.black12),
          ),
          SizedBox(
            height: UtilsResponsive.getResSize(26),
          ),
          Row(
            children: [
              Text(AppString.of(context).tokensForMeeting,
                  style: AppTextStyles.primary12),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: RhombusText(
                  fontSize: UtilsResponsive.getResSize(18),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            height: UtilsResponsive.getResSize(26),
          ),
      AppWrapContainersWithRemove(listOptions: ['Большой теннис', 'Бассейн', 'Управление', 'Маркетинг'],)

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