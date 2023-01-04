import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class HobbitsContainer extends StatelessWidget {
  final String text;
  final bool hasEdit;
  const HobbitsContainer(this.text, {
    Key? key, this.hasEdit = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            // style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 16.5.sp, //14
            //     fontWeight: FontWeight.w400),
          ),
          hasEdit == false
              ? Container()
              : const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.close_rounded,
              size: 22,
              color: AppColors.salad100,
            ),
          )
        ],
      ),
    );
  }
}
