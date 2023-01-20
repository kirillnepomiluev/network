import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_online_container.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAvatar extends StatelessWidget {
  const MeetingAvatar({
    Key? key,
    required this.onPartnerTap,
  }) : super(key: key);
  final VoidCallback onPartnerTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPartnerTap,
      child: AppContainer(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              top: UtilsResponsive.getResSize(15),
              right: UtilsResponsive.getResSize(15),
              child: Assets.images.avatars.avatar3D.image(
                height: 110.sp, //681
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: MeetingOnlineContainer(),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                    0.3,
                    1
                  ],
                      colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.88)
                  ],),),
            )
          ],
        ),
      ),
    );
  }
}
