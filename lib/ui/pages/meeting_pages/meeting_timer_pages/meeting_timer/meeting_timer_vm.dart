import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_pause_dialog.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_sheet_success.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';

class MeetingTimerViewModel extends ViewModel {
  final BuildContext context;
  MeetingTimerViewModel(this.context) {
    maxSeconds = duration.inSeconds;
    valueNotifier = ValueNotifier(0.0);

    strMinutes = twoDigits(duration.inMinutes.remainder(60));
    strSeconds = twoDigits(duration.inSeconds.remainder(60));
  }

  Duration duration = const Duration(seconds: 1);
  Timer? timer;
  int maxSeconds = 0;
  late String strMinutes;
  late String strSeconds;
  late ValueNotifier<double> valueNotifier;
  bool isPaused = true;

  Future<bool> onWillPop() async {
    if (duration.inSeconds == maxSeconds) {
      return true;
    } else {
      showPauseDialog();
      return false;
    }
  }

  void onBackTap() {
    if (duration.inSeconds == maxSeconds) {
      context.router.pop();
    } else {
      showPauseDialog();
    }
  }

  void onGoTap() {
    if (isPaused) {
      startTimer();
    } else {
      showPauseDialog();
    }
  }

  void startTimer({
    bool resets = true,
  }) {
    isPaused = false;
    notifyListeners();

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    // if (mounted) {
    const addSeconds = -1;

    final seconds = duration.inSeconds + addSeconds;

    if (seconds < 0) {
      timer?.cancel();

      DialogUtils.openBottomSheetInfoWithIcon(
          context: context,
          icon: NetworkIcons.smile_dead,
          text1: 'Вы получили ',
          text2: 'жалобу',
          text3:
              'Ваш рейтинг понижен на ____.\nЕсли на вас поступят еще 2 жалобы, мы\nвынуждены будем вас заблокировать. ',
          textButton: 'Посмотреть',
          func: () {
            context.router.pop();
            openBottomSheetSuccess();
          });
    } else {
      duration = Duration(seconds: seconds);
    }

    valueNotifier.value = (1 - duration.inSeconds / maxSeconds) * 100;

    strMinutes = twoDigits(duration.inMinutes.remainder(60));
    strSeconds = twoDigits(duration.inSeconds.remainder(60));

    notifyListeners();
    // }
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0'); //9->09

  void pauseTimer({bool resets = true}) {
    isPaused = true;
    timer?.cancel();
    notifyListeners();
  }

  void showPauseDialog() {
    pauseTimer();
    showDialog<void>(
        context: context,
        builder: (BuildContext context) => MeetingTimerPauseDialog(
              startTimer: startTimer,
            ));
  }

  void openBottomSheetSuccess() {
    showModalBottomSheet<void>(
        backgroundColor: AppColors.black1A.withOpacity(0.5),
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return const MeetingTimerSheetSuccess();
        });
  }
}
