import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class TroubleLoginTextLink extends StatelessWidget {
  final Function(BuildContext context) onTroubleEnterTap;
  const TroubleLoginTextLink({Key? key, required this.onTroubleEnterTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTroubleEnterTap(context);
      },
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
                style: AppTextStyles.grayPrimary500,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                '_____________________________',
                style: AppTextStyles.gray12b,
              ),
            )
          ],
        ),
      ),
    );
  }
}