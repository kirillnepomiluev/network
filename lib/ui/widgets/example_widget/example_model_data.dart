
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';

class ExampleModelData extends ViewModel{

  final int initValue;
  ExampleModelData({required this.initValue}){
    _count = initValue;
  }


  int _count = 0;
  int get getCount => _count;

  void increment(){
    _count++;
    notifyListeners();      //надо добавить addListener, чтобы это срабатывало
                            //добавить надо в ViewModelBuilder в initState
  }

}