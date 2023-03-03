import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class ClotheCarouselViewModel extends ViewModel {
  ClotheCarouselViewModel(this.context, this.isCupboard);
  final BuildContext context;
  final bool isCupboard;

  final ScrollController bodyScrollContr = ScrollController();
  final ScrollController headScrollContr = ScrollController();

  void goViewCategory(StoreProductType storeProductType) {
    context.router.push(
      StoreCategoryViewRoute(
        productType: storeProductType,
        isCupboard: isCupboard,
      ),
    );
  }
}
