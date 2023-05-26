import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingPartnerInfo extends StatelessWidget {
  const MeetingPartnerInfo({
    Key? key,
    required this.onPartnerTap,
    required this.partnerModel,
  }) : super(key: key);
  final VoidCallback onPartnerTap;
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    // final userData = Provider.of<UserNotifier>(context).userData;

    final status =  partnerModel.status.isEmpty? 'ищу партнера для бизнеса 🤝' : partnerModel.status;

    return InkWell(
      onTap: onPartnerTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameWithVerification(
            strName: '${partnerModel.name}, ${partnerModel.age}',
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
            Utils.getLevel(partnerModel.level)
            // '${AppString.of(context).level} "${AppString.of(context).base}"',
          ),
          const SizedBox(
            height: 10,
          ),
          AppContainer(
            padV: 7,
            padH: 13,
            radius: AppBorderRadius.r10,
            child: Text(
             status,
              style: TextStyle(
                  // color: ConstColor.textWhite,
                  fontSize: 15.5.sp, //12
                  fontWeight: FontWeight.w400,),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const RhombusText(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
