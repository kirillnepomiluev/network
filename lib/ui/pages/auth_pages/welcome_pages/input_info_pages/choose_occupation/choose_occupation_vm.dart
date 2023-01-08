import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class ChooseOccupationViewModel extends ViewModel {
  final BuildContext context;
  ChooseOccupationViewModel(this.context);

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