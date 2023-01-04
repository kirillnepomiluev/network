import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetRowIconNext extends StatelessWidget {
  const MeetRowIconNext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: UtilsResponsive.getResSize(21)), //21
      child: SizedBox(
        width: 20,
        height: 20,
        child: Stack(
          children: const [
            Positioned(
                left: 0,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                  color: AppColors.grey,
                )),
            Positioned(
                left: 6,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                )),
          ],
        ),
      ),
    );
  }
}
