import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_online_container.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAvatar extends StatelessWidget {
  const MeetingAvatar({
    Key? key,
    required this.onPartnerTap, required this.partnerModel,
  }) : super(key: key);
  final VoidCallback onPartnerTap;
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPartnerTap,
      child: AppContainer(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              // top: Res.s15,
              // left: Res.s15,
              child:
              Image.network(partnerModel.bodyURL,
                    height: 110.sp,
                  fit: BoxFit.cover
              )
              // Assets.images.avatars.avatar3D.image(
              //   height: 110.sp, //681
              // ),
            ),
            const Positioned(
              top: 10,
              left: 15,
              // padding: EdgeInsets.only(top: 10, left: 15),
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
