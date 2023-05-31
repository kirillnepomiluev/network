import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/settings_notifier.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/choose_meeting_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_partner_container.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_row_bar.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:provider/provider.dart';

class HomeMeetingView extends StatelessWidget {
  const HomeMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingMainViewModel>(
      createModelDataEx: () => MeetingMainViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        final SettingsNotifier settingsNotifier = Provider.of<SettingsNotifier>(context);
        final partnersList = settingsNotifier.partnersList;
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            child: Column(
              children: [
                Column(
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
                        ],
                      ),
                    ),
                    //Нижняя часть
                  ],
                ),
                Expanded(
                  child:
                  // model.showLoading?
                  // const Center(child: SizedBox(
                  //     width: 50,
                  //     height: 50,
                  //     child: CircularProgressIndicator()))
                  //     :
                  settingsNotifier.showPartnersLoading? const Center(child: CircularProgressIndicator(),):
                  partnersList.isEmpty? const Center(child: Text('Нет результатов')) :
                  PageView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    controller: model.pageController,
                      onPageChanged: (int index){
                        print('page $index');
                        settingsNotifier.setPage(index);
                        // initialPage = index;
                      },
                    itemCount: partnersList.length,
                    itemBuilder: (context, position) {
                      final userModel = partnersList[position];
                      return MeetingPartnerContainer(partnerModel: userModel);
                    },
                  ),
                  // PageView(
                  //   controller: model.pageController,
                  //   scrollDirection: Axis.vertical,
                  //   onPageChanged: (int index){
                  //     print('page $index');
                  //     settingsNotifier.setPage(index);
                  //     // initialPage = index;
                  //   },
                  //   children: [
                  //
                  //     for(final userModel in partnersList)
                  //       MeetingPartnerContainer(partnerModel: userModel),
                  //
                  //     // MeetingPartnerContainer(),
                  //   ],
                  // ),
                )
              ],
            ),
          ),

          //   PageView(
          //     scrollDirection: Axis.vertical,
          //     children: [
          //       Stack(
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               //Верхняя часть Для вас:
          //               Padding(
          //                 padding: const EdgeInsets.all(10),
          //                 child: Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     MeetingRowBar(
          //                       onSearchIconTap: model.onSearchIconTap,
          //                       onNotificationIconTap: model.onNotificationIconTap,
          //                       onTimerIconTap: model.onTimerIconTap,
          //                     ),
          //                     const SizedBox(
          //                       height: 20,
          //                     ),
          //                     ChooseMeetingScreen(
          //                       changeTab: model.changeTab,
          //                       activeTab: model.activeTab,
          //                     ),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               //Нижняя часть
          //               Expanded(
          //                 child: MeetingAvatar(onPartnerTap: model.onPartnerTap),
          //               )
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(left: 15, right: 15, bottom: 28),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //                 MeetingPartnerInfo(onPartnerTap: model.onPartnerTap),
          //                 MeetExchangeRow(
          //                   onTap: () {
          //                     context.router.push(MeetingTimerViewRoute());
          //                   },
          //                 ),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //       Container(color: Colors.red,),
          //       Container(color: Colors.blue,),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
