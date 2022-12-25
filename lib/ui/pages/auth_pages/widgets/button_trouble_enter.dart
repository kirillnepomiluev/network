import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ButtonTroubleEnter extends StatelessWidget {
  const ButtonTroubleEnter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (context) => const RecoveryPage()));
      }),
      child: SizedBox(
        height: 23.sp, //30
        width: 55.5.sp, //160
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              right: 0,
              bottom: 10,
              child: Text(
                'Проблемы со входом?',
                style: TextStyle(
                    color: ConstColor.textGray,
                    fontSize: 16.5.sp, //14
                    fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              // padding: EdgeInsets.only(top: 8),
              child: Text(
                '_____________________________',
                style: TextStyle(
                    color: ConstColor.textGray,
                    fontSize: 15.5.sp, //12
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}