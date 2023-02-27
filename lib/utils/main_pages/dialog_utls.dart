import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/meeting_rate_interrupt_dialog.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_complaint_sheet.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class DialogUtils{

  static void showScaffoldMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }


  static void openBottomSheetInfoWithIcon({
    required BuildContext context,
    required IconData icon,
    required String text1,
    required String text2,
    required String text3,
    required String textButton,
    final VoidCallback? func,
  }) {
    showModalBottomSheet<void>(
        backgroundColor: AppColors.black1A.withOpacity(0.5),
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),),
        context: context,
        builder: (BuildContext context) {
          return BottomSheetInfoWithIcon(
            icon: icon,
            text1: text1,
            text2: text2,
            text3: text3,
            textButton: textButton,
            func: func,
          );
        },);
  }

  static void showMeetingRateInterruptDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) => const MeetingRateInterruptDialog(),);
  }


}

