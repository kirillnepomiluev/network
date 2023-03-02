import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/utils_responsive.dart';

class AppContainerWithRemove extends StatelessWidget {
  const AppContainerWithRemove(
      {Key? key, required this.title, this.onTap, this.hasSkip = true,})
      : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final bool hasSkip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppContainer(
        padV: Res.s10,
        padH: Res.s14,
        radius: AppBorderRadius.r10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
            ),
            if (hasSkip)
              Padding(
                  padding: const EdgeInsets.only(left: 5, top: 3),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColors.salad,
                    size: Res.s16,
                  ),

                  // IconButton(
                  //     onPressed: onRemove,
                  //     padding: EdgeInsets.zero,
                  //     constraints:
                  //     const BoxConstraints(),
                  //     iconSize:
                  //     UtilsRes.s20,
                  //     icon: Icon(
                  //       Icons.close_rounded,
                  //       color: AppColors.salad,
                  //       size: UtilsRes.s16,
                  //     ),),

                  )
          ],
        ),
      ),
    );
  }
}
