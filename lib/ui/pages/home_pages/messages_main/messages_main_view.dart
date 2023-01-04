import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/messages_main/messages_bar_row.dart';
import 'package:network_app/ui/pages/home_pages/messages_main/messages_invitations_row.dart';
import 'package:network_app/ui/pages/home_pages/messages_main/messages_main_vm.dart';
import 'package:network_app/ui/pages/home_pages/messages_main/messages_wrap.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';

class MessagesMainView extends StatelessWidget {
  const MessagesMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessagesMainViewModel>(
        createModelDataEx: () => MessagesMainViewModel(context),
        builder: (context, model) {
          final mediaTop = MediaQuery.of(context).viewPadding.top;
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: mediaTop, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MessagesBarRow(),
                    MessagesInvitationsRow(photoList: model.photoList),
                    MessagesWrap(photoList: model.photoList),
                  ],
                ),
              ),
            ),
          );
        });
  }
}



