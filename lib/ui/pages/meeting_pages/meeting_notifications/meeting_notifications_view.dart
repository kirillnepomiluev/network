import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingNotificationsView extends StatefulWidget {
  const MeetingNotificationsView({Key? key}) : super(key: key);

  @override
  State<MeetingNotificationsView> createState() => _MeetingNotificationsViewState();
}

class _MeetingNotificationsViewState extends State<MeetingNotificationsView> {
  int _activeInvitationTab = 1;

  Widget miniContainer({
    required int position,
    required String text,
  }) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (() {
          setState(() {
            _activeInvitationTab = position;
          });
        }),
        child: Container(
          padding: EdgeInsets.all(0.0373 * mediaWidth), //14
          decoration: BoxDecoration(
            color: _activeInvitationTab == position
                ? AppColors.grey
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15.5.sp, //12
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;


    return BlurryContainer(
      color: Colors.black.withOpacity(0.6),
      padding: EdgeInsets.zero,
      blur: 30,
      child: Scaffold(
        // backgroundColor: Colors.black.withOpacity(0.8),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(
              top: mediaTop,
              left: 17.sp, //16
              right: 17.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // BackButtonCustom(),
                      const AppBackButton(),

                      Text(
                        'Уведомления',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.5.sp, //20
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      AppIconContainer(
                          icon: NetworkIcons.check_double,
                          iconSize: 18.5.sp,
                          onTap: (){}
                      )
                    ],
                  ),
                ),

                notificationCont(
                    showOnline: true,
                    title1: 'Джоли ',
                    title2: 'пригласила вас на ',
                    title3: 'встречу',
                    strTime: '5 мин назад',
                    icon: NetworkIcons.electric
                ),

                notificationCont(
                    showOnline: true,
                    title1: 'Питер ',
                    title2: 'добавил вас в ',
                    title3: 'избранное',
                    strTime: '15 мин назад',
                    icon: NetworkIcons.star
                ),

                notificationCont(
                    showOnline: false,
                    title1: 'Меган ',
                    title2: 'хочет добавить вас в ',
                    title3: 'друзья',
                    strTime: '2 ч назад',
                    icon: NetworkIcons.people
                ),

                notificationCont(
                    showOnline: false,
                    title1: '',
                    title2: 'На вас подали ',
                    title3: 'жалобу',
                    strTime: '2 ч назад',
                    icon: NetworkIcons.info
                ),

                notificationCont(
                    showOnline: false,
                    title1: '',
                    title2: 'Появился ',
                    title3: 'новый запрос',
                    strTime: '2 ч назад',
                    icon: NetworkIcons.electric
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationCont({
    required bool showOnline,
    required String title1,
    required String title2,
    required String title3,
    required String strTime,
    required IconData icon
  }) {
    // final mediaWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            showOnline == false
                ? Container()
                : Positioned(
                    left: 15.5.sp, //12
                    top: 15.5.sp,
                    child: Icon(
                      Icons.circle,
                      color: AppColors.salad100,
                      size: 13.sp, //8
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 18.sp, //17
                  vertical: 16.2.sp //14
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  if(title1!='')

                  SizedBox(width: 13.sp,),

                  Expanded(
                    child: Column(
                      // direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRichText(
                          title1, title2, title3
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: Text(
                            strTime,
                            style: TextStyle(
                                fontSize: 14.sp, //10
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 13.sp),
                    child: Container(
                      width: 22.sp, //24
                      height: 22.sp,
                      decoration: BoxDecoration(
                          color: AppColors.salad100,
                          borderRadius: BorderRadius.circular(7),
                          ),
                      child:
                      Icon(icon,
                        color: Colors.black,
                        size: 15.5.sp, //12
                      ),
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

  Widget buildRichText(String text1, String text2, String text3) => RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.5.sp, //12
          ),
          children: <TextSpan>[
            TextSpan(
                text: text1,
                style: const TextStyle(
                    color: AppColors.salad100,
                    fontWeight: FontWeight.w600)),
            TextSpan(
                text: text2,
                style: const TextStyle(fontWeight: FontWeight.w400)),
            TextSpan(
                text: text3,
                style: const TextStyle(
                    color: AppColors.salad100,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        // minFontSize: 14,
      );
}
