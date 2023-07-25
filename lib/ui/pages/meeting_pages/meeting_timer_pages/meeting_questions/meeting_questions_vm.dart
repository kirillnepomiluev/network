import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class MeetingQuestionsViewModel extends ViewModel {
  MeetingQuestionsViewModel(this.context);
  final BuildContext context;

  // List<String> questionsList = AppConstants.questionsList;

  List<MeetingQuestionModel> questionsListNew = [
    MeetingQuestionModel(id: 1, title: 'Do you like walking?', answersList: []),
    MeetingQuestionModel(id: 2, title: 'Do you have a cat or a dog?', answersList: ['A dog', 'A cat', 'Neither']),
    MeetingQuestionModel(id: 3, title: 'Do you believe in astrology?', answersList: []),
    MeetingQuestionModel(id: 4, title: 'Do you watch movies?', answersList: ['Rare', 'Sometimes', 'I love it']),
    MeetingQuestionModel(id: 5, title: 'Are you a confident person?', answersList: []),
    MeetingQuestionModel(id: 6, title: 'Do you follow fashion?', answersList: []),
    MeetingQuestionModel(id: 7, title: 'Are you a lark or an owl?', answersList: ['A lark', 'An owl', "I don't know"]),
    MeetingQuestionModel(id: 8, title: 'Do you know foreign languages?', answersList: []),
    // MeetingQuestionModel(id: 8, title: 'Are you easily angered?', answersList: []),
    // MeetingQuestionModel(id: 9, title: 'Do you like reading books?', answersList: []),
    // MeetingQuestionModel(id: 10, title: 'Are you a vegetarian?', answersList: []),

  ];

  void createQuestionList(){
    for(int i=0; i<AppConstants.questionsList.length; i++){
      questionsListNew.add(MeetingQuestionModel(id: i+1, title: AppConstants.questionsList[i], answersList: []));
    }
  }

// [
  //   'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
  //   'Какой-нибудь вопрос?',
  //   'Зададим вопрос по-сложнее?))))',
  //   'Какой-нибудь вопрос?',
  //   'Зададим вопрос по-сложнее?))))',
  //   'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
  //   'Какой-нибудь вопрос?',
  //   'Зададим вопрос по-сложнее?))))',
  //   'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
  //   'Зададим вопрос по-сложнее?))))',
  // ];
}




class MeetingQuestionModel{
  final int id;
  final String title;
  // final List<MeetingAnswerModel> answersList;
  final List<String> answersList;

  MeetingQuestionModel({required this.id, required this.title, required this.answersList});
}

class MeetingAnswerModel{
  final int id;
  final String title;

  MeetingAnswerModel({required this.id, required this.title});
}