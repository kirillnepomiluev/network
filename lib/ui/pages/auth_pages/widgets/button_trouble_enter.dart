import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class TroubleLoginTextLink extends StatelessWidget {
  const TroubleLoginTextLink({Key? key, required this.onTroubleEnterTap}) : super(key: key);
  final VoidCallback onTroubleEnterTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTroubleEnterTap,
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
                // 'Проблемы со входом?',
                "Can't sign in?",
                style: AppTextStyles.grey.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                // '_____________________________',
                '__________________',
                style: AppTextStyles.grey12.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}