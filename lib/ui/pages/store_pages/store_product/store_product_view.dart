import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_bottom.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_image_container.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';

class StoreProductView extends StatelessWidget {
  const StoreProductView({
    Key? key,
    // this.title = 'Костюм "Выходной"',
    // this.imageURL,
    required this.clotheModel,
  }) : super(key: key);
  // final String title;
  // final String? imageURL;
  final ClotheModel clotheModel;

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreProductImageContainer(
                  title: clotheModel.title, imageURL: clotheModel.imageUrl),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 31),
                child: StatColumn(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StoreProductBottom(),
    );
  }
}
