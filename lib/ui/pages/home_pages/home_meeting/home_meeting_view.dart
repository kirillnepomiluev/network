import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/choose_meeting_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_avatar.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_partner_info.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_row_bar.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class HomeMeetingView extends StatelessWidget {
  const HomeMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingMainViewModel>(
      createModelDataEx: () => MeetingMainViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        return Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Верхняя часть Для вас:
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MeetingRowBar(
                        onSearchIconTap: model.onSearchIconTap,
                        onNotificationIconTap: model.onNotificationIconTap,
                        onTimerIconTap: model.onTimerIconTap,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ChooseMeetingScreen(
                        changeTab: model.changeTab,
                        activeTab: model.activeTab,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                //Нижняя часть
                Expanded(
                  child: MeetingAvatar(onPartnerTap: model.onPartnerTap),
                )
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MeetingPartnerInfo(onPartnerTap: model.onPartnerTap),
                  MeetExchangeRow(
                    onTap: () {
                      context.router.push(MeetingTimerViewRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
