import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_category_icon.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewAvatarsCarousel extends StatelessWidget {
  const ViewAvatarsCarousel({
    Key? key,
    required this.scrollController,
    required this.onPressed, required this.title, required this.type,
  }) : super(key: key);
  final ScrollController scrollController;
  final VoidCallback onPressed;
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    final bool isCostume = type=='costume';
    // final userID = AppSupabase.client.auth.currentUser!.id;
    return Column(
      children: [
        ViewCategoryIcon(
          title: title,
          onPressed: onPressed,
        ),
        const SizedBox(
          height: 15,
        ),

        //Карусель аватаров
        StreamBuilder(
            stream: AppSupabase.client
                .from(AppSupabase.strClothes)
                .stream(primaryKey: ['id'])
                .eq('type', type),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final list = snapshot.data as List<Map<String, dynamic>>;
                return SizedBox(
                  height:isCostume? 87.sp : 82.sp,
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
                      }),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),

      ],
    );
  }
}
