import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';

class HobbitsContainer extends StatelessWidget {
  final String text;
  final bool hasEdit;
  const HobbitsContainer(this.text, {
    Key? key, this.hasEdit = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padH: 15,
      padV: 10,
      radius: AppBorderRadius.r10,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
          ),

          if(hasEdit)
            const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.close_rounded,
              size: 22,
              color: AppColors.salad,
            ),
          )
        ],
      ),
    );
  }
}
