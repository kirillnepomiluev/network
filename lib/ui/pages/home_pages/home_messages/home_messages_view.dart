import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/messages_bar_row.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/messages_invitations_row.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/messages_wrap.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';

class HomeMessagesView extends StatelessWidget {
  const HomeMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeMessagesViewModel>(
        createModelDataEx: () => HomeMessagesViewModel(context),
        builder: (context, model) {
          final mediaTop = MediaQuery.of(context).viewPadding.top;
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                  top: mediaTop,
                  left: Res.s15,
                  right: Res.s15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const MessagesBarRow(),
                    MessagesInvitationsRow(photoList: model.photoList),
                    MessagesWrap(photoList: model.photoList),
                  ],
                ),
              ),
            ),
          );
        },);
  }
}