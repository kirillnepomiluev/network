// ignore_for_file: cast_nullable_to_non_nullable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
                  AppTextStyles.primary22.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            if (isCupboard)
              IconButton(
                onPressed: () {
                  context.router.push(const OrdersViewRoute());
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                iconSize: Res.s24,
              )
          ],
        ),


        // ViewCategoryIcon(
        //   title: title,
        //   onPressed: () {
        //     onTap(productType);
        //   },
        // ),

        const SizedBox(
          height: 15,
        ),

        //Карусель аватаров
        StreamBuilder(
          stream: AppSupabase.client
              .from(AppSupabase.strClothes)
              .stream(primaryKey: ['id']).eq('type', strType).order('level', ascending: !isCupboard),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final currentList = snapshot.data as List<Map<String, dynamic>>;

              var list = currentList
                  .where((x) {
                    return userData.avatarBodyCupboard.contains(x['id'])==isCupboard;
              })
                  .toList();

              final contHeight = isAvatarBody ? 101.sp : 82.sp;

              return SizedBox(
                height: contHeight,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  // padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: Res.s10),
                      child: StoreAvatarContainer(
                        currentNote: list[index],
                        isCupboard: isCupboard,
                        contHeight: contHeight,
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
