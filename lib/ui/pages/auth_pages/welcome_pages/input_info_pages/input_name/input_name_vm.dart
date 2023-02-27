import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';

class InputNameViewModel extends ViewModel {
  InputNameViewModel(this.context);
  final BuildContext context;

  final textController = TextEditingController();

  Future<void> onTap() async {
    Utils.unFocus();

    final name = textController.text;

    if(name.isNotEmpty){
      UserNotifier().updateData(
        newData: {'name': name},
      );
    }

    context.router.push(const ChooseBirthDateViewRoute());
  }
}
