import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/widgets/meeting_online_container.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';

class MettingAvatar extends StatelessWidget {
  final VoidCallback onPartnerTap;
  const MettingAvatar({
    Key? key, required this.onPartnerTap,
  }) : super(key: key);

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
              top: 15,
              right: 15,
              child: Assets.images.avatars.avatar3D.image(
                height: 681,
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
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
