import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/messages_mini_avatar.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';


class MessagesInvitationsRow extends StatelessWidget {
  const MessagesInvitationsRow({
    Key? key, required this.photoList,
  }) : super(key: key);
  final List<Map<String, dynamic>> photoList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: UtilsResponsive.getResSize(20),
          bottom: UtilsResponsive.getResSize(20),
      ),
      child: AppContainer(
        width: MediaQuery.of(context).size.width,
        radius: AppBorderRadius.r15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: UtilsResponsive.getResSize(15),
                top: UtilsResponsive.getResSize(15),
              ),
              child: Text(
                AppString.of(context).invitations,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: UtilsResponsive.getResSize(15),),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final photoMap in photoList)
                      MessagesMiniAvatar(photoMap: photoMap)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
