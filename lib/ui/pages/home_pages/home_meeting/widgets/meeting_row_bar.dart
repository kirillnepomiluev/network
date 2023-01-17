import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingRowBar extends StatelessWidget {
  final VoidCallback onSearchIconTap;
  final VoidCallback onNotificationIconTap;
  final VoidCallback onTimerIconTap;
  const MeetingRowBar({
    Key? key, required this.onSearchIconTap, required this.onNotificationIconTap, required this.onTimerIconTap,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 7),
            child: AppIconContainer(
              icon: NetworkIcons.search,
              onTap: onSearchIconTap,
              iconSize: 16.sp, //17
              iconColor: Colors.white,
            )),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIconContainer(
              icon: NetworkIcons.notification,
              onTap: onNotificationIconTap,
              iconSize: 16.sp, //17
              iconColor: Colors.white,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                onTap: onTimerIconTap,
                child: AppContainer(
                    width: 48.sp, //120
                    height: UtilsResponsive.getResSize(40), //43
                    radius: AppBorderRadius.r15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '02:04:15',
                          style: AppTextStyles.primary12.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.timer_outlined,
                            color: Colors.white,
                            size: UtilsResponsive.getResSize(16), //16
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
