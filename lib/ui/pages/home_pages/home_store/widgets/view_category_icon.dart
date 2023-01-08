import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';


class ViewCategoryIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const ViewCategoryIcon({
    Key? key, required this.onPressed, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.primary22.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              NetworkIcons.arrow_long_right,
              color: Colors.white,
            ),
            iconSize: 20,
          )
        ],
      ),
    );
  }
}
