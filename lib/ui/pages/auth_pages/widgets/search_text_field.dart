import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.onChange, this.controller,
  }) : super(key: key);
  final Function(String? newValue)? onChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: Res.s40, //43
      padH: Res.s10,
      radius: AppBorderRadius.r15,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.sp, right: Res.s15),
            child: Icon(
              NetworkIcons.search,
              size: Res.s14,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: AppTextField(
              controller: controller,
              onChange: onChange,
              isTransparent: true,
            ),
          ),
        ],
      ),
    );
  }
}
