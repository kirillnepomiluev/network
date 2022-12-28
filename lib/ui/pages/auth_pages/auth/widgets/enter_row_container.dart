import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnterRowContainer extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? icon;
  final String iconName;
  final String title;
  const EnterRowContainer(
      {Key? key,
      this.icon,
      this.iconName = '',
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppContainer(
          radius: AppBorderRadius.r20,
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                    left: 4,
                    right: 24, //24
                  ),
                  child: AppContainer(
                    width: 54,
                    height: 54,
                    color: Colors.white,
                    radius: AppBorderRadius.r15,
                    child: icon != null
                        ? Icon(icon, color: Colors.black, size: 21)
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
                  )),
              Text(
                title,
                style: AppTextStyles.primary16
              )
            ],
          )),
    );
  }
}
