import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class ChooseMeetingOccupationViewModel extends ViewModel {
  ChooseMeetingOccupationViewModel(this.context);
  final BuildContext context;


  final int missedCount = 3;

  List<String> choosedOptions = [];

  void onRemove(String item){
    choosedOptions.remove(item);
    notifyListeners();
  }

  void onSelect(String item) {
    if (choosedOptions.length < 3) {
      choosedOptions.add(item);
      notifyListeners();
    }
  }

}