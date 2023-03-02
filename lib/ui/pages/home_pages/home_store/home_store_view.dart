import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/home_store_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/partner_cupboard_row.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_avatars_carousel.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/view_headwears_carousel.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class HomeStoreView extends StatelessWidget {
  const HomeStoreView({Key? key, this.isPartnerCupboard = false})
      : super(key: key);
  final bool isPartnerCupboard;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreMainViewModel>(
      createModelDataEx: () => StoreMainViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: mediaTop,
                  left: 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isPartnerCupboard)
                        PartnerCupboardRow(
                          onNotificationIconTap: model.onNotificationIconTap,
                        ),

                      const SizedBox(
                        height: 10,
                      ),

                      //Аватары
                      ViewAvatarsCarousel(
                        title: AppString.of(context).avatars,
                        onPressed: model.onViewAvatarsTap,
                        scrollController: model.avatarScrollContr,
                        type: 'costume',
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //Головные уборы
                      ViewAvatarsCarousel(
                        title: AppString.of(context).headwears,
                        onPressed: model.onViewHeadWaresTap,
                        scrollController: model.headwearScrollContr,
                        type: 'headwear',
                      ),

                      // ViewHeadwearsCarousel(
                      //   onPressed: model.onViewHeadWaresTap,
                      //   scrollController: model.headwearScrollContr,
                      // ),

                      const SizedBox(
                        height: 85,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
