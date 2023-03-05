import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/clothes_carousel/clothes_carousels_view.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class CupboardScreen extends StatelessWidget {
  const CupboardScreen({
    Key? key,
    required this.isCupboardInit, required this.activeTab, required this.avatarScrollContr, required this.hatScrollContr,
  }) : super(key: key);
  final ActiveProfileTabs activeTab;
  final ScrollController avatarScrollContr;
  final ScrollController hatScrollContr;

  final bool isCupboardInit;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15, left: 16, right: 16),
      child: SingleChildScrollView(
        child:
        ClothesCarousels(
          isCupboard: true,
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
