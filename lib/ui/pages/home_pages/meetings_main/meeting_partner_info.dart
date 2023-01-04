import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingPartnerInfo extends StatelessWidget {
  final VoidCallback onPartnerTap;
  const MeetingPartnerInfo({
    Key? key, required this.onPartnerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPartnerTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Джоли, 28', style: AppTextStyles.primary26w7),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 18.sp, //16
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${AppString.of(context).level} "${AppString.of(context).base}" ',
          ),
          const SizedBox(
            height: 10,
          ),
          AppContainer(
            padV: 7,
            padH: 13,
            radius: AppBorderRadius.r10,
            child: Text(
              'ищу партнера для бизнеса 🤝',
              style: TextStyle(
                  // color: ConstColor.textWhite,
                  fontSize: 15.5.sp, //12
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 26), //26
              child: RhombusText()),
        ],
      ),
    );
  }
}