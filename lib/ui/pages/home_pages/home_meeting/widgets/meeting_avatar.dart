import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_online_container.dart';
import 'package:network_app/ui/widgets/cards/app_cached_image.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAvatar extends StatelessWidget {
  const MeetingAvatar({
    Key? key,
    required this.onPartnerTap,
    required this.partnerModel,
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
                child: AppCachedImage(
              partnerModel.clotheUrl,
              height: 110.sp,
            )),
            Positioned(
              top: 10,
              left: 15,
              // padding: EdgeInsets.only(top: 10, left: 15),
              child: MeetingOnlineContainer(partnerModel: partnerModel),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.3, 1],
                  colors: [Colors.transparent, Colors.black.withOpacity(0.88)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
