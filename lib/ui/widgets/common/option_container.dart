import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/utils_responsive.dart';


class OptionsContainer extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  const OptionsContainer({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        if (widget.onTap != null) {
          widget.onTap!();
        }

        setState(() {
          isSelected = !isSelected;
        });
      }),
      child: Container(
        padding: EdgeInsets.all(UtilsResponsive.getResSize(14)), //14
        decoration: BoxDecoration(
          color: isSelected ? AppColors.salad : AppColors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
              color: isSelected ? Colors.black : AppColors.textWhite,
              fontSize: UtilsResponsive.getResSize(12), //12
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}

