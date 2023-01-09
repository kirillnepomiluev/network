import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';


class MessageContainer extends StatelessWidget {
  final Map<String, dynamic> photoMap;
  const MessageContainer({
    Key? key,
    required this.photoMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = 0.1626 * mediaWidth; //43
    return InkWell(
      onTap: (() {
        context.router.push(const ChatPersonalViewRoute());
      }),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AppContainer(
              width: mediaWidth * 0.432,
              padH: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(photoMap['name'] as String,
                        style: AppTextStyles.primary16.copyWith(fontWeight: FontWeight.bold)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      photoMap['status'] as String,
                      style: AppTextStyles.grey10
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            '12:48',
                            style: AppTextStyles.grey10.copyWith(fontWeight: FontWeight.w500)
                          ),
                        ),

                        const Icon(
                          NetworkIcons.check_double,
                          size: 12,
                          color: AppColors.textGray,
                        )

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 26),
                    child: Text(
                      'Я предлагаю встретиться в каком-нибудь красивом...',
                      style: AppTextStyles.primary12
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: contSize,
            width: contSize,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                    top: 0,
                    child: AppCircleAvatar(
                      imageUrl: photoMap['url'] as String,
                      contSize: contSize,
                    )

                ),

                if(photoMap['name'] != 'Станислав')
                const Positioned(
                    right: 7,
                    bottom: 0,
                    child: Icon(
                      Icons.circle,
                      size: 14, //14
                      color: AppColors.salad,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
