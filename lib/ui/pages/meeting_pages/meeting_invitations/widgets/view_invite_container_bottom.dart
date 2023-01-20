import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewInviteContainerBottom extends StatelessWidget {
  const ViewInviteContainerBottom({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppCircleAvatar(
              imageUrl: imageUrl,
              contSize: 40.sp, //83
            ),
            Padding(
              padding: EdgeInsets.only(left: UtilsResponsive.getResSize(21)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIconContainer(
                    icon: Icons.call_made,
                    contColor: AppColors.salad,
                    iconColor: Colors.black,
                    boxShape: BoxShape.circle,
                    iconSize: 15.sp,
                    contSize: UtilsResponsive.getResSize(18),
                  ),
                  SizedBox(
                    height: UtilsResponsive.getResSize(10),
                  ),
                  Text('250 м',
                      style: AppTextStyles.salad20
                          .copyWith(fontWeight: FontWeight.w600),)
                ],
              ),
            )
          ],
        ),

        InkWell(
          onTap: () {
            context.router.push(const MeetingMatchingViewRoute());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37),
                color: Colors.transparent,
                border: Border.all(color: AppColors.salad),),
            width: 35.sp, //66
            height: 35.sp * 1.394, //92
            child: Icon(
              NetworkIcons.arrow_long_right,
              color: AppColors.salad,
              size: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
