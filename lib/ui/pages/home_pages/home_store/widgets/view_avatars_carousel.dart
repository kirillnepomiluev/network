import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_category_icon.dart';
import 'package:network_app/ui/pages/store_pages/store_avatars_pages/store_category_avatars/store_category_avatars_view.dart';


class ViewAvatarsCarousel extends StatelessWidget {
  final ScrollController scrollController;
  final VoidCallback onPressed;
  const ViewAvatarsCarousel({
    Key? key, required this.scrollController, required this.onPressed,
  }) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var i = 0; i < 6; i++)
                avatarContainer(
                  strCategory: i % 2 == 0 ? 'Редкий' : 'Обычный',
                  context: context,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
