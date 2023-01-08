import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';

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
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: AppContainer(
            padH: 15,
            padV: 10,
            radius: AppBorderRadius.r10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppString.of(context).businessMeeting,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(
                      NetworkIcons.edit,
                      size: 15,
                      color: AppColors.salad,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
