import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HobbitsContainer extends StatelessWidget {
  const HobbitsContainer(this.text, {
    Key? key, this.hasEdit = true,
  }) : super(key: key);
  final String text;
  final bool hasEdit;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padH: Res.s15,
      padV: Res.s10,
      radius: AppBorderRadius.r10,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
          ),

          if(hasEdit)
            Padding(
            padding: EdgeInsets.only(left: 8.sp),
            child: Icon(
              Icons.close_rounded,
              size: Res.s22,
              color: AppColors.salad,
            ),
          )
        ],
      ),
    );
  }
}
