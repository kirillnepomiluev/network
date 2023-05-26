import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/choose_meeting_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_avatar.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_partner_info.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_row_bar.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class MeetingPartnerContainer extends StatefulWidget {
  const MeetingPartnerContainer({
    super.key, required this.dataMap,
  });

  final Map<String, dynamic> dataMap;

  @override
  State<MeetingPartnerContainer> createState() => _MeetingPartnerContainerState();
}

class _MeetingPartnerContainerState extends State<MeetingPartnerContainer> {
  void onPartnerTap() {
    context.router.push(const PersonProfileViewRoute());
  }

  late UserModel partnerModel;

  @override
  void initState() {
    partnerModel = UserModel.fromJson(widget.dataMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MeetingAvatar(onPartnerTap: onPartnerTap),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MeetingPartnerInfo(onPartnerTap: onPartnerTap, partnerModel: partnerModel,),
              MeetExchangeRow(
                onTap: () {
                  context.router.push(MeetingTimerViewRoute());
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
