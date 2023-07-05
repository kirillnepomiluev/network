import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/res.dart';


class ViewCategoryIcon extends StatelessWidget {
  const ViewCategoryIcon({
    Key? key, required this.onPressed, required this.title,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Res.s15),
      child:
      Text(
        title,
        style: AppTextStyles.primary22.copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.start,
      )
      // InkWell(
      //   onTap: onPressed,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         title,
      //         style: AppTextStyles.primary22.copyWith(fontWeight: FontWeight.w600),
      //         textAlign: TextAlign.start,
      //       ),
      //
      //       Icon(
      //         NetworkIcons.arrow_long_right,
      //         color: Colors.white,
      //         size: Res.s18,
      //       ),
      //
      //     ],
      //   ),
      // ),

    );
  }
}
