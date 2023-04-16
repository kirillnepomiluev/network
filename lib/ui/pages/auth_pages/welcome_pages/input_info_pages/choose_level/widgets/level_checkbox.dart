import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_vm.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/res.dart';


class LevelContainer extends StatelessWidget {
  const LevelContainer({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.groupValue, required this.value, required this.openBottomSheetProfile,
  }) : super(key: key);
  final VoidCallback openBottomSheetProfile;
  final String title;
  final LevelOptions value;
  final LevelOptions groupValue;
  final Function(LevelOptions?) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppContainer(
        padV: 5,
        radius: AppBorderRadius.r10,
        child: Row(
          children: [
            Expanded(
              child: RadioListTile<LevelOptions>(
                activeColor: AppColors.salad,
                title: Text(
                  title,
                  style: AppTextStyles.salad18.copyWith(fontWeight: FontWeight.w600),
                ),
                value: value,
                groupValue: groupValue,
                onChanged: onPressed,
              ),
            ),
            IconButton(
                onPressed: openBottomSheetProfile,
                icon: Icon(
                  NetworkIcons.info,
                  color: Colors.white,
                  size: Res.s24,
                ),),
            const SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }

}
