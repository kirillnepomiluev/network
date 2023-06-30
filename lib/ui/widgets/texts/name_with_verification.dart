import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NameWithVerification extends StatelessWidget {
  const NameWithVerification({
    Key? key,
    this.textStyle,
    this.iconSize,
    required this.userModel,
    this.showFullName = false,
  }) : super(key: key);
  final TextStyle? textStyle;
  final double? iconSize;
  final UserModel userModel;
  final bool showFullName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            userModel.name,
            style: textStyle ??
                AppTextStyles.primary18.copyWith(fontWeight: FontWeight.w500),
            maxLines: showFullName ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                '${userModel.age}',
                style: textStyle ??
                    AppTextStyles.primary18
                        .copyWith(fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
            if (userModel.verified)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(
                  Icons.verified,
                  color: AppColors.salad,
                  size: iconSize ?? 18.sp, //17
                ),
              )
          ],
        )
      ],
    );
  }
}
