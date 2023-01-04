import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class OptionsContainer extends StatefulWidget {
  final String title;
  final Function? func;
  const OptionsContainer({Key? key, required this.title, this.func})
      : super(key: key);

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() {
        if (widget.func != null) {
          widget.func!();
        }

        setState(() {
          isSelected = !isSelected;
        });
      }),
      child: Container(
        padding: EdgeInsets.all(mediaWitdh * 0.0373), //14
        decoration: BoxDecoration(
          color: isSelected ? AppColors.salad100 : AppColors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
              color: isSelected ? Colors.black : AppColors.textWhite,
              fontSize: 15.5.sp, //12
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

