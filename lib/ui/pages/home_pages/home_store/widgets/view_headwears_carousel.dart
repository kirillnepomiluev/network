import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_headwear_container.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_category_icon.dart';
import 'package:network_app/utils/utils_responsive.dart';

class ViewHeadwearsCarousel extends StatelessWidget {
  const ViewHeadwearsCarousel({
    Key? key, required this.scrollController, required this.onPressed,
  }) : super(key: key);
  final ScrollController scrollController;
  final VoidCallback onPressed;

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
            children: [
              for (var i = 0; i < 6; i++)
                Padding(
                  padding: EdgeInsets.only(right: Res.s10),
                  child: StoreHeadwearContainer(
                    type: i.isEven ? 'Обычный' : 'Редкий',
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
