import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/clothe_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/blockchain/eth_utils.dart';
import 'package:network_app/ui/pages/store_pages/store_product/store_product_vm.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_bottom.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_image_container.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


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
        final erc721Provider = Provider.of<ERC721ContractNotifier>(context);

        bool haveThisClothe = userData.avatarBodyCupboard.contains(clotheModel.id);

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  StoreProductImageContainer(
                   clotheModel: clotheModel,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 31),
                    child: Column(
                      children: [
                        StatColumn(
                          onBuyTokens: (){},
                          level: clotheModel.level,
                        ),
                        if(haveThisClothe)
                          Padding(
                            padding: const EdgeInsets.only(top: 31),
                            child: AppButton(onPressed: (){
                              launchUrl(Uri.parse('https://testnets.opensea.io/assets/goerli/0xab92aed3dd22ad824123239c1571e598eeda36db/0'));
                            }, text: 'View'),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: haveThisClothe? null : StoreProductBottom(
            cost: clotheModel.price,
            showButtonLoading: model.showButtonLoading,
            onBuyClothe: (){
              model.onBuyClothe(erc721Provider);
            },
          ),
        );
      },);
}


}
