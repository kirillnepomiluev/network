import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils_responsive.dart';

class CheckMeetingDescriptionOfMeeting extends StatelessWidget {
  const CheckMeetingDescriptionOfMeeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleStatText(AppString.of(context).descriptionOfMeeting),
        SizedBox(
          height: UtilsResponsive.getResSize(10),
        ),
        const AppTextField(
          hintText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.',
        ),
      ],
    );
  }
}
