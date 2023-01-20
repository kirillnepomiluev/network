import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
import 'package:network_app/ui/widgets/icons/app_add_rectangle_icon.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//+ + + +
//- -

class AppWrapContainersWithRemove extends StatelessWidget {
  const AppWrapContainersWithRemove({
    Key? key, required this.listOptions, this.showAdd = false,
  }) : super(key: key);
  final List<String> listOptions;
  final bool showAdd;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.sp,
      runSpacing: UtilsResponsive.getResSize(10),
      children: [
        for(final item in listOptions)
          AppContainerWithRemove(
            title: item,
          ),

        if(showAdd)
        const AppAddRectangleIcon(),
      ],
    );
  }
}
