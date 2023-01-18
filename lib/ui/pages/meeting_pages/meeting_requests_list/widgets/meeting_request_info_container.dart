import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetingRequestInfoContainer extends StatelessWidget {
  const MeetingRequestInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: UtilsResponsive.getResSize(20)),
      child: AppContainer(
        width: double.infinity,
        padV: UtilsResponsive.getResSize(26),
        padH: UtilsResponsive.getResSize(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.of(context).businessMeeting,
                    style: AppTextStyles.primary16.copyWith(fontWeight: FontWeight.w500)
                ),
                Text('#256893',
                    style: AppTextStyles.salad16.copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'от 25.11.2022',
              style: AppTextStyles.grey,
            ),
            SizedBox(
              height: UtilsResponsive.getResSize(20),
            ),
            const Text(
              'Здесь будет небольшое описание встречи, которое будет видно на 2 строчки...',
            ),
          ],
        ),
      ),
    );
  }
}
