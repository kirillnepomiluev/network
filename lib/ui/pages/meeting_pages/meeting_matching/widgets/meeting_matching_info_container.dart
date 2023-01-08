import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';

class MeetingMatchingInfoContainer extends StatelessWidget {
  const MeetingMatchingInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padV: 23,
      padH: 17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '92% совпадений',
            style: AppTextStyles.salad24.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          AppContainer(
            padV: 13,
            padH: 15,
            color: AppColors.salad,
            radius: AppBorderRadius.r15,
            child: Text(AppString.of(context).businessMeeting,
                style: AppTextStyles.black12),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              Text(AppString.of(context).tokensForMeeting,
                  style: AppTextStyles.primary12),
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: RhombusText(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: const [
              HobbitsContainer('Большой теннис', hasEdit: false),
              HobbitsContainer('Бассейн', hasEdit: false),
              HobbitsContainer('Управление', hasEdit: false),
              HobbitsContainer('Маркетинг', hasEdit: false),
            ],
          ),
        ],
      ),
    );
  }
}
