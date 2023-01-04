import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/meeting_partner_info.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/meetings_main_vm.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/metting_avatar.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/widgets/choose_meeting_screen.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/widgets/meetings_row_bar.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/timer_page.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';

class MeetingsMainPage extends StatelessWidget {
  const MeetingsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingsMainViewModel>(
        createModelDataEx: () => MeetingsMainViewModel(context),
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
                        MeetingsRowBar(
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
                    child: MettingAvatar(onPartnerTap: model.onPartnerTap),
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
                    MeetExchangeRow(onTap: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const TimerPage()));
                    }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
