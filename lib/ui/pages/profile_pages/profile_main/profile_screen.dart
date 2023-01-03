import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/widgets/stat_container.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final aspectRatio = mediaWidth / mediaHeight >= 0.6;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tima',
          style: AppTextStyles.primary26w7
        ),

        const SizedBox(height: 12,),

        Text(
          AppString.of(context).baseLevel,
        ),

        SizedBox(height: 25.sp,),

        //Готов к встрече
        AppContainer(
          padV: UtilsResponsive.getResSize(20),
          color: AppColors.salad100,
          radius: AppBorderRadius.r15,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.5.sp //14
                    ),
                child: Icon(
                  NetworkIcons.check_thin,
                  size: 16.5.sp, //14
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 15.5.sp, //12
                    right: 19.sp //20
                    ),
                child: Text(
                  AppString.of(context).readyToMeet,
                  style: AppTextStyles.darkSalad14w5
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              top: aspectRatio ? 15 : 30.sp
          ), //50
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatContainer(
                  title: '9.4k',
                  subtitle: AppString.of(context).ofPoints),
              StatContainer(
                  title: '23',
                  subtitle: AppString.of(context).meets),
              StatContainer(
                  title: '4.5',
                  subtitle: AppString.of(context).rating),
            ],
          ),
        ),
      ],
    );
  }
}
