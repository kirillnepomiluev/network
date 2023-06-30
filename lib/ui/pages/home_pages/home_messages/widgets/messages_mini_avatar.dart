import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesMiniAvatar extends StatelessWidget {
  const MessagesMiniAvatar({
    Key? key,
    required this.photoMap,
  }) : super(key: key);
  final Map<String, dynamic> photoMap;

  @override
  Widget build(BuildContext context) {
    final contWidth = 29.sp; //45
    return Padding(
      padding: EdgeInsets.only(
        left: Res.s15,
      ),
      child: InkWell(
        onTap: () {
          context.router.push(const ChatPersonalViewRoute());
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: contWidth,
              height: contWidth,
              child: Stack(
                children: [
                  AppCircleAvatar(
                    avatarUrl: photoMap['url'] as String,
                    contSize: contWidth,
                  ),
                  if (photoMap['online'] as bool)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.circle,
                        size: Res.s12,
                        color: AppColors.salad,
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                photoMap['name'] as String,
                style: AppTextStyles.primary12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
