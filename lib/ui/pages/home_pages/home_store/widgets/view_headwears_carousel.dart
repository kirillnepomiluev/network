import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_headwear_container.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_category_icon.dart';
import 'package:network_app/utils/utils_responsive.dart';

class ViewHeadwearsCarousel extends StatelessWidget {
  final ScrollController scrollController;
  final VoidCallback onPressed;
  const ViewHeadwearsCarousel({
    Key? key, required this.scrollController, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewCategoryIcon(
          title: AppString.of(context).headwears,
          onPressed: onPressed,
        ),
        const SizedBox(
          height: 15,
        ),

        //Карусель головных уборов
        SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var i = 0; i < 6; i++)
                Padding(
                  padding: EdgeInsets.only(right: UtilsResponsive.getResSize(10)),
                  child: StoreHeadwearContainer(
                    type: i % 2 == 0 ? 'Обычный' : 'Редкий',
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
