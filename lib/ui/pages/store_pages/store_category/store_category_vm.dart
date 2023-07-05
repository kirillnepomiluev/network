import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/clothe_model.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class StoreCategoryViewModel extends ViewModel {
  StoreCategoryViewModel(this.context, this.storeCategoryScreen){
    if(storeCategoryScreen==StoreProductType.body){
      title = AppString.of(context).avatars;
    }
    else if(storeCategoryScreen==StoreProductType.head){
      title = AppString.of(context).headwears;
    }
  }
  final BuildContext context;
  final StoreProductType storeCategoryScreen;

  late String title;

  ActiveStoreFilerTabs activeTab = ActiveStoreFilerTabs.values.first;

  void changeTab(ActiveStoreFilerTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  void onProductTap(ClotheModel clotheModel){

  }

}