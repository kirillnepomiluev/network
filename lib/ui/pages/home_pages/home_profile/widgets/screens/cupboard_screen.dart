import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_screen_update_row.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/clothes_carousel/clothes_carousels_view.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:provider/provider.dart';

class CupboardScreen extends StatelessWidget {
  const CupboardScreen({
    Key? key,
    required this.isCupboardInit,
    required this.activeTab,
    required this.avatarScrollContr,
    required this.hatScrollContr,
  }) : super(key: key);
  final ActiveProfileTabs activeTab;
  final ScrollController avatarScrollContr;
  final ScrollController hatScrollContr;

  final bool isCupboardInit;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            CupboardScreenUpdateRow(onlyUpdate: false),
            ClothesCarousels(
              isCupboard: true,
            ),
          ],
        ),

        // Container(
        //   child:  isCupboardInit
        //       ? CupboardInitScreen(
        //     activeTab: activeTab,
        //     avatarScrollContr: avatarScrollContr,
        //     hatScrollContr: hatScrollContr,
        //   )
        //   // : const CupboardEmptyScreen(),
        //       : const ClothesCarousels(
        //     isCupboard: true,
        //   ),
        // ),
      ),
    );
  }
}
