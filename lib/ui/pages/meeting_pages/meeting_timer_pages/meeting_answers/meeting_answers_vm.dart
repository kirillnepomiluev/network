import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_vm.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';


class MeetingAnswersViewModel extends ViewModel {
  MeetingAnswersViewModel(this.context, this.meetingModel){
    // groupValue = answersList.first;
    final qusetionModel = meetingModel.questionsList[questionIndex] as MeetingQuestionModel;
    final answerList = qusetionModel.answersList.isEmpty? ['Yes', 'No', "I don't know"] : qusetionModel.answersList;
    groupValue = answerList.first;

    questionCount = meetingModel.questionsList.length;
  }
  final BuildContext context;
  final MeetingModel meetingModel;

  final List<String> answersList = [
    'Yes',
    'No',
    "I don't know",
  ];

  late String groupValue;
  final _controller = TextEditingController();
  int missedCount = 3;
  int questionCount = 3;
  int questionIndex = 0;
  double progress = 0.00;
  bool showSendButton = false;

  // final qusetionModel = meetingModel.questionsList[model.questionIndex] as MeetingQuestionModel;
  // final answerList = qusetionModel.answersList.isEmpty? ['Yes', 'No', "I don't know"] : qusetionModel.answersList;

  void sendFunction({bool isMissing = false}) {

    if (isMissing && missedCount > 0) {
      missedCount--;
    }

    _controller.clear();
    showSendButton = false;

    if ((questionIndex + 1) == questionCount) {
      context.router.push( MeetingAnswersSuccessViewRoute(meetingModel: meetingModel));
    } else {

      progress = (questionIndex + 1) / questionCount;
      questionIndex++;

      final qusetionModel = meetingModel.questionsList[questionIndex] as MeetingQuestionModel;
      final answerList = qusetionModel.answersList.isEmpty? ['Yes', 'No', "I don't know"] : qusetionModel.answersList;
      groupValue = answerList.first;

    }

   notifyListeners();
  }

  void onAnswerTap(String? newValue) {
      groupValue = newValue!;
      notifyListeners();
  }

}