import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/message_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesWrap extends StatelessWidget {
  const MessagesWrap({
    Key? key, required this.chatsList,
  }) : super(key: key);
  final List chatsList;

  @override
  Widget build(BuildContext context) {
    // final SettingsNotifier settingsNotifier = Provider.of<SettingsNotifier>(context);
    // final partnersList = settingsNotifier.partnersList;
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child:
      GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Res.s12,
              mainAxisSpacing: Res.s12,
              mainAxisExtent: 68.sp,   //300
          ),
          itemCount: chatsList.length,
          itemBuilder: (_, index) {
            return MessageContainer(dataMap: chatsList[index]);
          },),
    );
  }
}
