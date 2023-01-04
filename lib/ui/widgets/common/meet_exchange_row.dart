import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/meet_row_icon_next.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetExchangeRow extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isExchange;
  const MeetExchangeRow({Key? key, this.onTap, this.isExchange = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    final double contSize = mediaWitdh * 0.128; //48
    final double iconSize = 19.sp; //25

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset:
                    const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconContainer(
                      icon: isExchange? NetworkIcons.arrow_long_right : NetworkIcons.electric,
                      iconSize: isExchange? 15.sp: 19.sp,
                      contSize: contSize,
                      contColor: AppColors.black1A,
                      onTap: onTap
                  ),

                  Text(
                    isExchange
                        ? AppString.of(context).exchange
                        : AppString.of(context).toMeet,
                    style: AppTextStyles.blackPrimary,
                  ),

                  //иконка >>
                  const MeetRowIconNext(),
                ],
              ),
            ),
          ),
        ),

        if(isExchange==false)
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: AppIconContainer(
              icon: NetworkIcons.star,
              iconSize: iconSize,
              contSize: contSize,
            ),
          ),
      ],
    );
  }
}