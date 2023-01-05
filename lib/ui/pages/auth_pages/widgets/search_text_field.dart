import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 43,
      padV: 10,
      padH: 10,
      radius: AppBorderRadius.r15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 15),
            child: Icon(
              NetworkIcons.search,
              size: UtilsResponsive.getResSize(14),
              color: Colors.white,
            ),
          ),
          const Expanded(
              child: AppTextField(
            isTransparent: true,
          )),
        ],
      ),
    );
  }
}
