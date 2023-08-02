import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/messages_mini_avatar.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';


class MessagesInvitationsRow extends StatelessWidget {
  const MessagesInvitationsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final SettingsNotifier settingsNotifier = Provider.of<SettingsNotifier>(context);
    // final partnersList = settingsNotifier.partnersList;
    final userData = Provider.of<UserNotifier>(context).userData;

    return Padding(
      padding: EdgeInsets.only(
          top: Res.s20,
          bottom: Res.s32,
      ),
      child: AppContainer(
        width: MediaQuery.of(context).size.width,
        radius: AppBorderRadius.r15,
        padH: Res.s15,
        padV: Res.s15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.of(context).invitations,
            ),
            Padding(
              padding: EdgeInsets.only(top: Res.s15, left: 5),
              child:
              SizedBox(
                height: 75,
                child: StreamBuilder(
                  stream: AppSupabase.client
                      .from(AppSupabase.strMeetings)
                      .stream(primaryKey: ['id']).eq(
                      'partner_id', userData.id).order('created_date'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data! as List<Map<String, dynamic>>;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          final meetingMap = list[index];
                          return MessagesMiniAvatar(meetingMap: meetingMap);
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              )

            )
          ],
        ),
      ),
    );
  }
}
