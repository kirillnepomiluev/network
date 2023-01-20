import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: UtilsResponsive.getResSize(40), //43
      padV: UtilsResponsive.getResSize(14), //10
      padH: UtilsResponsive.getResSize(10),
      radius: AppBorderRadius.r15,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.sp, right: UtilsResponsive.getResSize(15)),
            child: Icon(
              NetworkIcons.search,
              size: UtilsResponsive.getResSize(14),
              color: Colors.white,
            ),
          ),
          const Expanded(
              child: AppTextField(
            isTransparent: true,
          ),),
        ],
      ),
    );
  }
}
