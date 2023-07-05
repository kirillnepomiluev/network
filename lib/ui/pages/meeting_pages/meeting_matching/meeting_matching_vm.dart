import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';


class MeetingMatchingViewModel extends ViewModel {
  MeetingMatchingViewModel(this.context, this.meetingModel){
    // meetingModel = MeetingModel.fromMap(meetingMap);
    status = meetingModel.status;
  }
  final BuildContext context;
  final MeetingModel meetingModel;
  // MeetingModel meetingModel = MeetingModel.emptyModel();

  // bool showLoading = false;
  // late UserModel creatorModel;
  // late UserModel partnerModel;
  // Future<void> getInit() async {
  //   final userData = Provider.of<UserNotifier>(context, listen: false).userData;
  //
  //   bool isCreator = false;
  //   String searchID = '';
  //
  //   if(meetingModel.creatorID==userData.id){
  //     isCreator = true;
  //     creatorModel = userData;
  //   }
  //
  //
  //   final partnerData = await AppSupabase.client
  //       .from(AppSupabase.strUsers)
  //       .select()
  //       .eq('id', meetingModel.partnerID).single();
  // }

  String status = 'created';

  List<String> questionsList = [
    // 'Какой-нибудь вопрос?',
    // 'Зададим вопрос по-сложнее?))))',
    // 'А еще вопрос может быть длинным придлинным и на него тоже нужно ответить?',
    // 'Какой-нибудь вопрос?',
    // 'Зададим вопрос по-сложнее?))))',
    // 'Какой-нибудь вопрос?',
    'What is your favorite, brightest and most fun childhood memory?',
    'What amuses and makes you laugh the most?',
    'What are three things about you that will surprise me?',
    'What should be considered normal and should be allowed?',
    'What do people not know about you?',
    'What are you looking forward to in the future?',
    'Do you have a secret ability?',
    'What do you do at home when there is no one and nothing to do?',
    'What are you thinking about now?',
    'Where and where do you see yourself in 5 years? And in 10 years?',
  ];



  Future<void> onAcceptMeeting() async {
    status = 'accepted';
    notifyListeners();

    await AppSupabase.client
        .from(AppSupabase.strMeetings)
        .update({'status': 'accepted'}).eq('id', meetingModel.id);
  }

  void onStartMeeting(){
    context.router.push(MeetingTimerViewRoute(meetingID: meetingModel.id!));
  }


  Future<void> onRejectMeeting() async {

    status = 'rejected';
    notifyListeners();

    await AppSupabase.client
        .from(AppSupabase.strMeetings)
        .update({'status': 'rejected'}).eq('id', meetingModel.id);

  }

}

