import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils_responsive.dart';

class CheckMeetingCategoryOfMeeting extends StatelessWidget {
  const CheckMeetingCategoryOfMeeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleStatText(AppString.of(context).categoryOfMeeting),
        SizedBox(
          height: Res.s20,
        ),
        InkWell(
          onTap: () {},
          child: AppContainer(
            padH: Res.s15,
            padV: Res.s10,
            radius: AppBorderRadius.r10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppString.of(context).businessMeeting,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      NetworkIcons.edit,
                      size: Res.s14,
                      color: AppColors.salad,
                    ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
