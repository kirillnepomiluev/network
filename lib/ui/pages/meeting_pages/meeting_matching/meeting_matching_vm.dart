import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class MeetingMatchingViewModel extends ViewModel {
  MeetingMatchingViewModel(this.context, this.meetingModel){
    // meetingModel = MeetingModel.fromMap(meetingMap);
  }
  final BuildContext context;
  final MeetingModel meetingModel;
  // MeetingModel meetingModel = MeetingModel.emptyModel();

  List<String> questionsList = [
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    'Какой-нибудь вопрос?',
    'Зададим вопрос по-сложнее?))))',
    'Какой-нибудь вопрос?',
  ];

  void onStartMeeting(){
    // context.router.push(const ChatPersonalViewRoute());
    context.router.push(MeetingTimerViewRoute(meetingID: meetingModel.id));
  }

  Future<void> onDenyMeeting() async {

    await AppSupabase.client
        .from(AppSupabase.strMeetings)
        .update({'status': 'denied'}).eq('id', meetingModel.id);

    context.router.pop();

    // context.router.push(MeetingTimerViewRoute(meetingID: meetingMap['id']));
  }

}