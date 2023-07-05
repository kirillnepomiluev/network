import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/clothes_carousel/clothes_carousels_view.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_top.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/choose_interface.dart';


class CupboardScreen extends StatelessWidget {
  const CupboardScreen({
    Key? key,
    required this.isCupboardInit,
    required this.activeTab,
    required this.avatarScrollContr,
    required this.hatScrollContr, required this.changeTab,
  }) : super(key: key);
  final ActiveProfileTabs activeTab;
  final ScrollController avatarScrollContr;
  final ScrollController hatScrollContr;
  final bool isCupboardInit;
  final Function(ActiveProfileTabs) changeTab;

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HomeProfileTop(),
              ChooseProfileScreen(
                activeProfileTab: activeTab,
                changeTab: changeTab,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // CupboardScreenUpdateRow(onlyUpdate: false),
                    ClothesCarousels(
                      isCupboard: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
