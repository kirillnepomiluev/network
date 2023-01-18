import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckMeetingOccupation extends StatelessWidget {
  const CheckMeetingOccupation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleStatText(AppString.of(context).occupation),
        SizedBox(
          height: UtilsResponsive.getResSize(20),
        ),
        AppWrapContainersWithRemove(listOptions: ['Маркетинг', 'IT-сфера', 'Финансы'], showAdd: true,),
        // Wrap(
        //   crossAxisAlignment: WrapCrossAlignment.center,
        //   spacing: UtilsResponsive.getResSize(10),
        //   runSpacing: UtilsResponsive.getResSize(10),
        //   direction: Axis.horizontal,
        //   children: [
        //     const AppContainerWithRemove(title: 'Маркетинг'),
        //     const AppContainerWithRemove(title: 'IT-сфера'),
        //     const AppContainerWithRemove(title: 'Финансы'),
        //     AppIconContainer(
        //       icon: Icons.add,
        //       contSize: 25.sp,
        //       iconSize: 17.5.sp,
        //       contColor: AppColors.salad,
        //       iconColor: Colors.black,
        //       radius: AppBorderRadius.r7,
        //     ),
        //   ],
        // ),
        SizedBox(
          height: UtilsResponsive.getResSize(20),
        ),
        RichTextTwo(
          text1: 'Вы можете указать ',
          text2: '3 сферы деятельности',
          fontSize: UtilsResponsive.getResSize(10),
          fontWeight1: FontWeight.w400,
          fontWeight2: FontWeight.w400,
        ),
      ],
    );
  }
}
