import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingPartnerInfo extends StatelessWidget {
  const MeetingPartnerInfo({
    Key? key,
    required this.onPartnerTap,
  }) : super(key: key);
  final VoidCallback onPartnerTap;

  @override
  Widget build(BuildContext context) {
    // final userData = Provider.of<UserNotifier>(context).userData;
    return InkWell(
      onTap: onPartnerTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameWithVerification(
            strName: 'Джоли, 28',
            // strName: '${userData.name}, ${userData.age}',
            showVerified: true,
            iconSize: 20.sp,
            textStyle:
                AppTextStyles.primary26.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${AppString.of(context).level} "${AppString.of(context).base}"',
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
                  fontWeight: FontWeight.w400,),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10,
                  bottom: Res.s26,
              ), //26
              child: const RhombusText(),),
        ],
      ),
    );
  }
}
