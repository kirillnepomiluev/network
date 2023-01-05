import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/auth/auth_enums.dart';



class LevelContainer extends StatelessWidget {
  final VoidCallback openBottomSheetProfile;
  final String title;
  final LevelOptions value;
  final LevelOptions groupValue;
  final Function(LevelOptions?) onPressed;
  const LevelContainer({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.groupValue, required this.value, required this.openBottomSheetProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white10),
        child: Row(
          children: [
            Expanded(
              child: RadioListTile<LevelOptions>(
                activeColor: AppColors.salad100,
                title: Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.salad100,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                value: value,
                groupValue: groupValue,
                onChanged: onPressed,
              ),
            ),
            IconButton(
                onPressed: openBottomSheetProfile,
                icon: const Icon(
                  NetworkIcons.info,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

}
