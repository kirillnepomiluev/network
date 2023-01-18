import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_bottom.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_image_container.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';

class StoreProductView extends StatelessWidget {
  final String title;
  final String? imageURL;
  const StoreProductView(
      {Key? key,
        this.title = 'Костюм "Выходной"',
        this.imageURL
      })
      : super(key: key);

  //   title: 'Костюм "Выходной"',
  //           imageURL: Assets.images.avatars.avatar3.keyName,

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreProductImageContainer(
                title: title,
                imageURL: imageURL?? Assets.images.avatars.avatar3.keyName,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 31),
                child: StatColumn(ifProfileSheet: false),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StoreProductBottom(),
    );
  }
}
