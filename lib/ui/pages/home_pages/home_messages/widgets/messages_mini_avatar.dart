import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';

class MessagesMiniAvatar extends StatelessWidget {
  final Map<String, dynamic> photoMap;
  const MessagesMiniAvatar({
    Key? key,
    required this.photoMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const contWidth = 45.00;
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: InkWell(
        onTap: (() {
          context.router.push(const ChatPersonalViewRoute());
        }),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: contWidth,
              height: contWidth,
              child: Stack(
                children: [
                  AppCircleAvatar(
                    imageUrl: photoMap['url'] as String,
                    contSize: contWidth,
                  ),
                  photoMap['online'] == false
                      ? Container()
                      : const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      Icons.circle,
                      size: 12,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}