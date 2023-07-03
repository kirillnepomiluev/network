import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_avatar.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_partner_info.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/utils/utils_meetings.dart';

class MeetingPartnerContainer extends StatefulWidget {
  const MeetingPartnerContainer({
    super.key, required this.partnerModel,
  });

  final UserModel partnerModel;

  @override
  State<MeetingPartnerContainer> createState() => _MeetingPartnerContainerState();
}

class _MeetingPartnerContainerState extends State<MeetingPartnerContainer> {

  void onPartnerTap() {
    context.router.push(PersonProfileViewRoute(partnerModel: widget.partnerModel));
  }

  // late UserModel partnerModel;

  @override
  void initState() {
    // partnerModel = UserModel.fromJson(widget.userModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        MeetingAvatar(onPartnerTap: onPartnerTap, partnerModel: widget.partnerModel,),

        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MeetingPartnerInfo(onPartnerTap: onPartnerTap, partnerModel: widget.partnerModel,),
              MeetExchangeRow(
                onTap: () {
                  UtilsMeeting.onMeetingTap(context, widget.partnerModel);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
