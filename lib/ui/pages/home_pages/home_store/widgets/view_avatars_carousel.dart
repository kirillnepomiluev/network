import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_category_icon.dart';
import 'package:network_app/utils/utils_responsive.dart';


class ViewAvatarsCarousel extends StatelessWidget {
  const ViewAvatarsCarousel({
    Key? key, required this.scrollController, required this.onPressed,
  }) : super(key: key);
  final ScrollController scrollController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ViewCategoryIcon(
          title: AppString.of(context).avatars,
          onPressed: onPressed,
        ),
        const SizedBox(
          height: 15,
        ),

        //Карусель аватаров
        SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < 6; i++)
                Padding(
                  padding: EdgeInsets.only(right: UtilsResponsive.getResSize(10)),
                  child: StoreAvatarContainer(
                    // type: i % 2 == 0 ? 'Редкий' : 'Обычный',
                    type: i.isEven ? 'Редкий' : 'Обычный',
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
