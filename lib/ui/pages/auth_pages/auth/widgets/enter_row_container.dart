import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnterRowContainer extends StatelessWidget {
  const EnterRowContainer(
      {Key? key,
      this.icon,
      this.iconName = '',
      required this.title,
      required this.onTap,
        this.iconSize,
      })
      : super(key: key);
  final VoidCallback onTap;
  final IconData? icon;
  final double? iconSize;
  final String iconName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppContainer(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                    left: 4,
                    right: 22.sp, //24
                  ),
                  child: AppContainer(
                    width: 32.sp,  //54
                    height: 32.sp,
                    color: Colors.white,
                    radius: AppBorderRadius.r15,
                    child: icon != null
                        ? Icon(icon, color: Colors.black, size: iconSize?? 21.sp) //21
                        : Padding(
                            padding: const EdgeInsets.all(17),
                            child: Image.asset(
                              iconName == 'logo_facebook'
                                  ? Assets.images.icons.logoFacebook.keyName
                                  : Assets.images.icons.logoGoogle.keyName,
                              width: 21.sp, //24
                              height: 21.sp,
                            ),
                          ),
                  ),),
              Padding(
                padding: EdgeInsets.only(right: 8.sp),
                child: Text(
                  title,
                  style: AppTextStyles.primary16,
                ),
              )
            ],
          ),),
    );
  }
}
