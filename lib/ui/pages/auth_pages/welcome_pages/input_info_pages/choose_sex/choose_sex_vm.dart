import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

enum SexOptions {
  male,
  female,
}

class ChooseSexViewModel extends ViewModel {
  ChooseSexViewModel(this.context);
  final BuildContext context;

  bool sexChoosed = false;

  // SexOptions choosedSex = SexOptions.male;
  bool maleChoosed = false;
  bool femaleChoosed = false;

  void onMaleChoosed(){
    sexChoosed = true;
    maleChoosed = true;
    femaleChoosed = false;
    notifyListeners();
  }

  void onFemaleChoosed(){
    sexChoosed = true;
    maleChoosed = false;
    femaleChoosed = true;
    notifyListeners();
  }


  bool hideSex = false;
  void onHideSexCheckBox(bool? newValue) {
    hideSex = newValue!;
    notifyListeners();
  }

  Future<void> onTap() async {

    UserNotifier().updateData(
      newData: {'hide_sex': hideSex, 'sex': maleChoosed? 'Мужчина' : 'Женщина'},
    );

    context.router.push(const ChooseLevelViewRoute());
  }

}