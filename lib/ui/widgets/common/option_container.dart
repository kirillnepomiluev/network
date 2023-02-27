import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';


class OptionsContainer extends StatefulWidget {
  const OptionsContainer({Key? key, required this.title, this.onTap})
      : super(key: key);
  final String title;
  final VoidCallback? onTap;

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        if (widget.onTap != null) {
          widget.onTap?.call();
        }

        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.all(Res.s14), //14
        decoration: BoxDecoration(
          color: isSelected ? AppColors.salad : AppColors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
              color: isSelected ? Colors.black : AppColors.textWhite,
              fontSize: Res.s12, //12
              fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}



class OptionsContainerTest extends StatefulWidget {
  OptionsContainerTest({Key? key, required this.hobbyModel, required this.onTap, required this.index})
      : super(key: key){
    isSelected = hobbyModel.active;
  }

  final HobbyModel hobbyModel;
  final Function(int) onTap;
  final int index;
  bool isSelected = false;

  @override
  State<OptionsContainerTest> createState() => _OptionsContainerTestState();
}

class _OptionsContainerTestState extends State<OptionsContainerTest> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap(widget.hobbyModel.index);
      },
      child: Container(
        padding: EdgeInsets.all(Res.s14), //14
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.salad : AppColors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.hobbyModel.title,
          style: TextStyle(
            color: widget.isSelected ? Colors.black : AppColors.textWhite,
            fontSize: Res.s12, //12
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

