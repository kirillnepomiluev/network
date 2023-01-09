import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_bottom.dart';
import 'package:network_app/ui/pages/store_pages/store_product/widgets/store_product_image_container.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';


class StoreProductView extends StatelessWidget {
  final String title;
  final String imageURL;
  const StoreProductView(
      {Key? key, required this.title, required this.imageURL})
      : super(key: key);

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
                imageURL: imageURL,
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

