import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_avatar_row.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/icons/notification_icon.dart';


class PartnerCupboardRow extends StatelessWidget {
  const PartnerCupboardRow({
    Key? key, required this.onNotificationIconTap,
  }) : super(key: key);
  final VoidCallback onNotificationIconTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppBackButton(),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: NotificationIcon(
                  onTap: onNotificationIconTap,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: ProfileAvatarRowOld(title: 'Джоли, 28', showNotifications: false),
        ),
      ],
    );
  }
}
