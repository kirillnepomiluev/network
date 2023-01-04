import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/messages_main/widgets/messages_mini_avatar.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesInvitationsRow extends StatelessWidget {
  final List<Map<String, dynamic>> photoList;
  const MessagesInvitationsRow({
    Key? key, required this.photoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                AppString.of(context).invitations,
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 16.5.sp //14
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
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
