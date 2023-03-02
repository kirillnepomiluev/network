import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';


class InputAboutYouViewModel extends ViewModel {
  InputAboutYouViewModel(this.context);
  final BuildContext context;

  final textController = TextEditingController(text: '');

  void onNextPage() {
    Utils.unFocus();
    context.router.push(const GeolocationTurnOnViewRoute());
  }

  void writeData() {
    if(textController.text.isNotEmpty){
      UserNotifier().updateData(
        newData: {'about': textController.text},
      );
    }
  }

  void onContinue() {
    Utils.unFocus();
    writeData();
    onNextPage();
  }

}