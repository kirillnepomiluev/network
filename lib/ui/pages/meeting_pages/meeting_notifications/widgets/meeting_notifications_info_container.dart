import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/widgets/meeting_notifications_rich_text.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingNotificationInfoContainer extends StatelessWidget {

  const MeetingNotificationInfoContainer(
      {Key? key,
      required this.showOnline,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.strTime,
      required this.icon,})
      : super(key: key);
  final bool showOnline;
  final String title1;
  final String title2;
  final String title3;
  final String strTime;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppContainer(
        child: Stack(
          children: [
            if (showOnline)
              Positioned(
                left: 15.5.sp, //12
                top: 15.5.sp,
                child: Icon(
                  Icons.circle,
                  color: AppColors.salad,
                  size: 13.sp, //8
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 18.sp, //17
                  vertical: 16.2.sp, //14
                  ),
              child: Row(
                children: [
                  if (title1 != '')
                    SizedBox(
                      width: 13.sp,
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MeetingNotificationRichText(title1, title2, title3),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(strTime, style: AppTextStyles.primary10)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.sp),
                    child: AppIconContainer(
                      icon: icon,
                      contSize: 22.sp,
                      iconSize: 15.5.sp,
                      contColor: AppColors.salad,
                      iconColor: Colors.black,
                      radius: AppBorderRadius.r7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
