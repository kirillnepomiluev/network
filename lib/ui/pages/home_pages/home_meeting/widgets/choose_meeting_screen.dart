import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/settings_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_tab.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseMeetingScreen extends StatelessWidget {
  const ChooseMeetingScreen({
    Key? key,
    required this.activeTab,
    required this.changeTab,
  }) : super(key: key);
  final ActiveMeetingTabs activeTab;
  final Function(ActiveMeetingTabs) changeTab;

  @override
  Widget build(BuildContext context) {
    final SettingsNotifier settingsNotifier =
        Provider.of<SettingsNotifier>(context);
    final partnersList = settingsNotifier.partnersList;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // MeetingTab(
        //   text: AppString.of(context).forYou,
        //   activeTab: activeTab,
        //   changeTab: changeTab,
        //   tabName: ActiveMeetingTabs.forYou,
        // ),
        // MeetingTab(
        //   text: AppString.of(context).near,
        //   activeTab: activeTab,
        //   changeTab: changeTab,
        //   tabName: ActiveMeetingTabs.near,
        // ),

        IconButton(
          onPressed: () {
            settingsNotifier.onRadiusChoosed(context);
          },
          icon: const Icon(
            Icons.update,
            color: Colors.white,
          ),
          iconSize: Res.s26,
        ),
        AppDropdownDynamic(
          optionsList: settingsNotifier.radiusList,
          strChoosed: settingsNotifier.radius,
          onOptionChoosed: (newValue) {
            settingsNotifier.onRadiusChoosed(context, newRadius: newValue);
          },
        ),

        Flexible(
          child: AppButton(
            borderRadius: AppBorderRadius.r15,
            textStyle:
                AppTextStyles.black11.copyWith(fontWeight: FontWeight.w500),
            width: 60.sp, //158
            height: 30.sp, //50
            onPressed: () {
              context.router.push(const MeetingRequestsListViewRoute());
            },
            text: AppString.of(context).personalRequests,
          ),
        )
      ],
    );
  }
}

class AppDropdownDynamic extends StatelessWidget {
  final List<dynamic> optionsList;
  final dynamic strChoosed;
  final Function(dynamic) onOptionChoosed;
  final double? width;
  final double? height;
  final String label;
  final Color? borderColor;
  const AppDropdownDynamic({
    Key? key,
    required this.optionsList,
    required this.strChoosed,
    required this.onOptionChoosed,
    this.width,
    this.height,
    this.label = '',
    this.borderColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isWebMobile =
        (window.physicalSize / window.devicePixelRatio).width < 450;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    AppTextStyles.black.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        Container(
          width: width ?? (42.sp), //234
          height: height ?? (Res.s57), //48
          padding: EdgeInsets.only(right: Res.s15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: borderColor ?? Colors.black, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
              isExpanded: true,
              value: strChoosed,
              style: const TextStyle(color: Colors.black),
              selectedItemBuilder: (BuildContext context) {
                return optionsList.map<Widget>((dynamic item) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$item км',
                      // item.toString(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.black
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  );
                }).toList();
              },
              items:
                  optionsList.map<DropdownMenuItem<dynamic>>((dynamic value) {
                return DropdownMenuItem<dynamic>(
                  value: value,
                  child: Text(
                      '$value км'
                      // value.toString()
                      , textAlign: TextAlign.center),
                );
              }).toList(),
              onChanged: onOptionChoosed,
            ),
          ),
        ),
      ],
    );
  }
}
