import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils_responsive.dart';

class CheckMeetingDate extends StatelessWidget {
  const CheckMeetingDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleStatText('Период для планирования встречи'),
        SizedBox(
          height: Res.s20,
        ),
        Row(
          children: [
            Expanded(
              child: AppContainer(
                padV: Res.s15,
                padH: Res.s15,
                radius: AppBorderRadius.r10,
                child: const Text(
                  'с  01.03.2021',
                ),
              ),
            ),
            SizedBox(
              width: Res.s10,
            ),
            Expanded(
              child: AppContainer(
                padV: Res.s15,
                padH: Res.s15,
                radius: AppBorderRadius.r10,
                child: const Text(
                  'по  01.03.2021',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
