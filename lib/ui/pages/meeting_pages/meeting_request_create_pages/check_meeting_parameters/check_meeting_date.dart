import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';

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
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const [
            Expanded(
              child: AppContainer(
                padV: 15,
                padH: 15,
                radius: AppBorderRadius.r10,
                child: Text(
                  'с  01.03.2021',
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: AppContainer(
                padV: 15,
                padH: 15,
                radius: AppBorderRadius.r10,
                child: Text(
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
