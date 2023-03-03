// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_category_icon.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewAvatarsCarousel extends StatelessWidget {
  const ViewAvatarsCarousel({
    Key? key,
    required this.scrollController,
    required this.title,
    required this.productType,
    required this.onTap,
    required this.isCupboard,
  }) : super(key: key);
  final ScrollController scrollController;
  final Function(StoreProductType type) onTap;
  final String title;
  final StoreProductType productType;
  final bool isCupboard;

  @override
  Widget build(BuildContext context) {
    final bool isAvatarBody = productType == StoreProductType.body;
    final strType = Utils.getProductType(productType);
    final userData = Provider.of<UserNotifier>(context).userData;

    return Column(
      children: [
        ViewCategoryIcon(
          title: title,
          onPressed: () {
            onTap(productType);
          },
        ),
        const SizedBox(
          height: 15,
        ),

        //Карусель аватаров
        StreamBuilder(
          stream: AppSupabase.client
              .from(AppSupabase.strClothes)
              .stream(primaryKey: ['id']).eq('type', strType),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final currentList = snapshot.data as List<Map<String, dynamic>>;

              var list = currentList
                  .where(
                      (x) => userData.clothesIdList.contains(x['id']) == isCupboard,)
                  .toList();

              return SizedBox(
                height: isAvatarBody ? 87.sp : 82.sp,
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: Res.s10),
                      child: StoreAvatarContainer(
                        currentNote: list[index],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
