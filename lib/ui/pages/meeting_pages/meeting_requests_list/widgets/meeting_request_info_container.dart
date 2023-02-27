import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetingRequestInfoContainer extends StatelessWidget {
  const MeetingRequestInfoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Res.s20),
      child: AppContainer(
        width: double.infinity,
        padV: Res.s26,
        padH: Res.s18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.of(context).businessMeeting,
                    style: AppTextStyles.primary16.copyWith(fontWeight: FontWeight.w500),
                ),
                Text('#256893',
                    style: AppTextStyles.salad16.copyWith(fontWeight: FontWeight.w500),),
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
              height: Res.s20,
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
