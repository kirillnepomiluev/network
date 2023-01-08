import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';

class MeetingOnlineContainer extends StatelessWidget {
  const MeetingOnlineContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Colors.black,
      radius: AppBorderRadius.r30,
      padV: 5,
      padH: 17,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.circle,
            color: AppColors.salad,
            size: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(AppString.of(context).online,
                style: AppTextStyles.primary12),
          )
        ],
      ),
    );
  }
}
