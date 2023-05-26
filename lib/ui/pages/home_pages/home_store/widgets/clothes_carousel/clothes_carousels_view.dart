import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/clothes_carousel/clothes_carousels_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_avatars_carousel.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class ClothesCarousels extends StatelessWidget {
  const ClothesCarousels({
    Key? key,
    required this.isCupboard,
  }) : super(key: key);
  final bool isCupboard;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClotheCarouselViewModel>(
      createModelDataEx: () => ClotheCarouselViewModel(context, isCupboard),
      builder: (context, model) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            //Аватары
            ViewAvatarsCarousel(
              isCupboard: isCupboard,
              title: AppString.of(context).avatars,
              onTap: model.goViewCategory,
              scrollController: model.bodyScrollContr,
              productType: StoreProductType.body,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // //Головные уборы
            // ViewAvatarsCarousel(
            //   isCupboard: isCupboard,
            //   title: AppString.of(context).headwears,
            //   onTap: model.goViewCategory,
            //   scrollController: model.headScrollContr,
            //   productType: StoreProductType.head,
            // ),
            const SizedBox(
              height: 85,
            ),
          ],
        );
      },
    );
  }
}
