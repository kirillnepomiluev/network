import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';


class EditFieldViewModel extends ViewModel {
  EditFieldViewModel(this.context, this.keyName){
    getInit();
  }
  final BuildContext context;
  final String keyName;

  void getInit(){
    final userData = Provider.of<UserNotifier>(context).userData;

    initialData = userData.dataMap[keyName]??'';
    print('mapData ${UserNotifier().userData.dataMap}');
    print('keyName $keyName initialData $initialData');
    textController.text = initialData;
  }

  final textController = TextEditingController(text: '');
  String initialData = '';

  bool showLoading = false;

  Future<void> onTap() async {

    showLoading = true;
    notifyListeners();

    Utils.unFocus();
    if(textController.text != initialData){
      print('обновили');
      await UserNotifier().updateData(newData: {
        keyName : textController.text
      },);
    }
    else{
      print('ниче не изменилось');
    }
    context.router.pop();
  }
}