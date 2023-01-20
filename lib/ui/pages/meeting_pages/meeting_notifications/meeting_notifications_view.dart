import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/widgets/meeting_notifications_info_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingNotificationsView extends StatelessWidget {
  const MeetingNotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return BlurryContainer(
      color: Colors.black.withOpacity(0.6),
      padding: EdgeInsets.zero,
      blur: 30,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(
              top: mediaTop,
              left: 17.sp, //16
              right: 17.sp,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Text(AppString.of(context).notifications,
                        style: AppTextStyles.primary20
                            .copyWith(fontWeight: FontWeight.w600),),
                    AppIconContainer(
                        icon: NetworkIcons.check_double,
                        iconSize: 18.5.sp,
                        onTap: () {},)
                  ],
                ),
                const MeetingNotificationInfoContainer(
                    showOnline: true,
                    title1: 'Джоли ',
                    title2: 'пригласила вас на ',
                    title3: 'встречу',
                    strTime: '5 мин назад',
                    icon: NetworkIcons.electric,),
                const MeetingNotificationInfoContainer(
                    showOnline: true,
                    title1: 'Питер ',
                    title2: 'добавил вас в ',
                    title3: 'избранное',
                    strTime: '15 мин назад',
                    icon: NetworkIcons.star,),
                const MeetingNotificationInfoContainer(
                    showOnline: false,
                    title1: 'Меган ',
                    title2: 'хочет добавить вас в ',
                    title3: 'друзья',
                    strTime: '2 ч назад',
                    icon: NetworkIcons.people,),
                const MeetingNotificationInfoContainer(
                    showOnline: false,
                    title1: '',
                    title2: 'На вас подали ',
                    title3: 'жалобу',
                    strTime: '2 ч назад',
                    icon: NetworkIcons.info,),
                const MeetingNotificationInfoContainer(
                    showOnline: false,
                    title1: '',
                    title2: 'Появился ',
                    title3: 'новый запрос',
                    strTime: '2 ч назад',
                    icon: NetworkIcons.electric,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


