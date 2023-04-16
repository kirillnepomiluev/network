import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/notification_icon.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';

class ProfileAvatarRow extends StatelessWidget {
  const ProfileAvatarRow({
    Key? key,
    this.title = 'Тимофей, 37',
    this.status = 'я люблю веселиться 😁',
    this.showNotifications = true,
    this.onNotificationIconTap,
  }) : super(key: key);
  final String title;
  final String status;
  final bool showNotifications;
  final VoidCallback? onNotificationIconTap;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Аватарка
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Res.s15,
                ),
                child: InkWell(
                  onTap: (){
                    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
                    userNotifier.signOut(context);
                  },
                  child: AppCircleAvatar(
                    contSize: Res.s60, //60
                    imageUrl: Assets.images.avatars.avatar0.keyName,
                  ),
                ),),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.primary18
                        .copyWith(fontWeight: FontWeight.w700),),
                const SizedBox(
                  height: 7,
                ),
                if(status.isNotEmpty)
                AppContainer(
                    padV: 6,
                    padH: 9,
                    radius: AppBorderRadius.r10,
                    child: Center(
                        child: Text(status,
                            style: AppTextStyles.primary12,),),),
              ],
            ),
          ],
        ),

        if (showNotifications)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: NotificationIcon(onTap: onNotificationIconTap),
          ),
      ],
    );
  }
}
