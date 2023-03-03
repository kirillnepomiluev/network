import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
import 'package:network_app/ui/widgets/icons/app_add_rectangle_icon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//+ + + +
//- -

class AppWrapContainersWithRemove extends StatelessWidget {
  const AppWrapContainersWithRemove({
    Key? key, required this.listOptions, this.showAdd = false, this.onTap,
  }) : super(key: key);
  final List listOptions;
  final bool showAdd;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12.sp,
      runSpacing: 12.sp,
      children: [
        for(final item in listOptions)
          AppContainerWithRemove(
            title: item,
          ),

        if(showAdd)
        AppAddRectangleIcon(
            onTap: onTap,
        ),
      ],
    );
  }
}
