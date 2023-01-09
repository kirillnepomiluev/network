import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/icons/notification_icon.dart';


class ProfileAvatarRow extends StatelessWidget {
  final String title;
  final bool showNotifications;
  final VoidCallback? onNotificationIconTap;
  const ProfileAvatarRow({
    Key? key,
    this.title = 'Тимофей, 37',
    this.showNotifications = true,
    this.onNotificationIconTap,
  }) : super(key: key);

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
                padding: const EdgeInsets.only(right: 20),
                child: AppCircleAvatar(
                  contSize: 60,
                  imageUrl: Assets.images.avatars.avatar0.keyName,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.primary18
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 7,
                ),
                AppContainer(
                    padV: 6,
                    padH: 9,
                    radius: AppBorderRadius.r10,
                    child: Center(
                        child: Text('я люблю веселиться 😁',
                            style: AppTextStyles.primary12))),
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
