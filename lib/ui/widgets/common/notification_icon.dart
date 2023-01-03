import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';


class NotificationIcon extends StatelessWidget {
  final VoidCallback? onTap;
  const NotificationIcon({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 43,
      height: 44,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IconContainer(
            icon: NetworkIcons.notification,
            iconSize: 15,
            func: onTap,
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(
              Icons.circle,
              size: 12,
              color: AppColors.salad100,
            ),
          )
        ],
      ),
    );
  }
}
