import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class AppCheckListTile extends StatelessWidget {
  const AppCheckListTile(
      {Key? key,
      required this.title,
      this.width,
      this.value = false,
      this.onChanged,
      })
      : super(key: key);
  final Function(bool?)? onChanged;
  final bool value;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Transform.translate(
        offset: const Offset(-4, 0),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          checkColor: AppColors.black1A,
          checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(color: AppColors.salad),
          controlAffinity: ListTileControlAffinity.leading,
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.salad,
          title: Transform.translate(
            offset: const Offset(-17, 0),
            child: Text(
              title,
              style: AppTextStyles.primary,
            ),
          ),
        ),
      ),
    );
  }
}
