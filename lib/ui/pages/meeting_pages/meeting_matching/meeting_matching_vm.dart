import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class MeetingMatchingViewModel extends ViewModel {
  final BuildContext context;
  MeetingMatchingViewModel(this.context);

  List<String> questionsList = [
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'Какой-нибудь вопрос?',
  ];

  void onStartChat(){
    context.router.push(const ChatPersonalViewRoute());
  }

}