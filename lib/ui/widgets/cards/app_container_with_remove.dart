import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';

class AppContainerWithRemove extends StatelessWidget {
  const AppContainerWithRemove({Key? key, required this.title, this.onRemove, this.hasRemove = true}) : super(key: key);
  final String title;
  final VoidCallback? onRemove;
  final bool hasRemove;

  @override
  Widget build(BuildContext context) {
    return
      AppContainer(
          padV: UtilsResponsive.getResSize(10),
          padH: UtilsResponsive.getResSize(14),
          radius: AppBorderRadius.r10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
              ),

              if(hasRemove)
              Padding(
                padding:
                const EdgeInsets.only(left: 5),
                child: IconButton(
                    onPressed: onRemove,
                    padding: EdgeInsets.zero,
                    constraints:
                    const BoxConstraints(),
                    iconSize:
                    UtilsResponsive.getResSize(20),
                    icon: Icon(
                      Icons.close_rounded,
                      color: AppColors.salad,
                      size: UtilsResponsive.getResSize(16),
                    ),),
              )
            ],
          ),);
  }
}
