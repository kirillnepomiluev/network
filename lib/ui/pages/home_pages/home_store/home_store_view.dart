import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_store/home_store_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/clothes_carousel/clothes_carousels_view.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/partner_cupboard_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class HomeStoreView extends StatelessWidget {
  const HomeStoreView({Key? key, this.isPartnerCupboard = false})
      : super(key: key);
  final bool isPartnerCupboard;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreMainViewModel>(
      createModelDataEx: () => StoreMainViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: mediaTop,
              left: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isPartnerCupboard)
                    PartnerCupboardRow(
                      onNotificationIconTap: model.onNotificationIconTap,
                    ),
                  const ClothesCarousels(
                    isCupboard: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
