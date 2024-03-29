import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class MeetingAnswersViewModel extends ViewModel {
  MeetingAnswersViewModel(this.context, this.meetingModel){
    groupValue = answersList.first;
  }
  final BuildContext context;
  final MeetingModel meetingModel;

  final List<String> answersList = [
    'Вариант ответа A',
    'Вариант ответа B',
    'Вариант ответа C',
  ];

  late String groupValue;


  final _controller = TextEditingController();

  int missedCount = 3;

  final int questionCount = 3;
  int questionIndex = 0;
  double progress = 0.00;
  bool showSendButton = false;

  void sendFunction({bool isMissing = false}) {
    if (isMissing && missedCount > 0) {
      missedCount--;
    }

    _controller.clear();

    showSendButton = false;

    if ((questionIndex + 1) == questionCount) {
      context.router.push( MeetingAnswersSuccessViewRoute(meetingModel: meetingModel));
    } else {
      groupValue = 'Вариант ответа A';
      progress = (questionIndex + 1) / questionCount;
      questionIndex++;
    }

   notifyListeners();
  }


  void onAnswerTap(String? newValue) {
      groupValue = newValue!;
      notifyListeners();
  }

}