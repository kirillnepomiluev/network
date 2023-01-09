import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_empty_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_init_screen.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class CupboardScreen extends StatelessWidget {
  final ActiveProfileTabs activeTab;
  final ScrollController avatarScrollContr;
  final ScrollController hatScrollContr;
  const CupboardScreen({
    Key? key,
    required this.isCupboardInit, required this.activeTab, required this.avatarScrollContr, required this.hatScrollContr,
  }) : super(key: key);

  final bool isCupboardInit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: isCupboardInit
            ? CupboardInitScreen(
                activeTab: activeTab,
                avatarScrollContr: avatarScrollContr,
                hatScrollContr: hatScrollContr,
              )
            : const CupboardEmptyScreen(),
      ),
    );
  }
}
