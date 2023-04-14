import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/store_pages/store_product/store_product_vm.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_bottom.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_image_container.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:provider/provider.dart';


class StoreProductView extends StatelessWidget {
  const StoreProductView({
    Key? key,
    required this.clotheModel,
  }) : super(key: key);
  final ClotheModel clotheModel;

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<StoreProductViewModel>(
      createModelDataEx: () => StoreProductViewModel(context, clotheModel),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        final userData = Provider.of<UserNotifier>(context).userData;

        bool hidBuyBottom = userData.clothesIdList.contains(clotheModel.id);

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoreProductImageContainer(
                    title: clotheModel.title, imageURL: clotheModel.imageUrl,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 31),
                    child: StatColumn(
                      onBuyTokens: (){},
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: hidBuyBottom? null : StoreProductBottom(
            cost: clotheModel.cost,
            buyClothe: model.buyClothe,
          ),
        );
      },);
}


}
