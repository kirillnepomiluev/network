import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/widgets/meeting_notifications_info_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/utils/utils.dart';


class NotificationModel {
  int id;
  String userID;
  String fromID;
  UserModel partnerModel;
  DateTime createdDate;
  String type; //Общение, Деловая
  String title;
  String description;
  String status;
  String statusText;
  int? imageUrl;

  NotificationModel({
    required this.id,
    this.userID = '',
    this.fromID = '',
    required this.partnerModel,
    required this.createdDate,
    this.type = '',
    this.title = '',
    this.description = '',
    this.imageUrl,
    this.status ='',
    this.statusText='',
  });

  factory NotificationModel.fromMap(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;

    return NotificationModel(
      id: dataMap['id'],
      userID: dataMap['user_id'],
      fromID: dataMap['from_id'] ?? '',
      partnerModel: UserModel.emptyModel(),
      createdDate: createdDate,
      type: dataMap['type'],
      title: dataMap['title'],
      description: dataMap['description'],
      status: dataMap['status'],
      imageUrl: dataMap['image_url'],
    );
  }

  factory NotificationModel.emptyModel() {
    return NotificationModel(
        id: 0,
        partnerModel: UserModel.emptyModel(),
        createdDate: DateTime.now(),
    );
  }

  Future<void> updateData({required Map<String, dynamic> newData}) async {
    await AppSupabase.updateData(newData: newData, collRef: AppSupabase.strNotifications, id: id);
  }
}


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


