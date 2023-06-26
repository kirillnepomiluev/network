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

  //   1.  'What is your favorite, brightest and most fun childhood memory?
  //   2.  'What amuses and makes you laugh the most?
  //   3.  'What are three things about you that will surprise me?
  //   4.  'What should be considered normal and should be allowed?
  //   5.  'What do people not know about you?
  //   6.  'What are you looking forward to in the future?
  //   7.  'Do you have a secret ability?
  //   8.  'What do you do at home when there is no one and nothing to do?
  //   9.  'What are you thinking about now?
  //   10. 'Where and where do you see yourself in 5 years? And in 10 years?
  //   11. Do you listen more to the voice of the heart or the mind?
  //   12. Do you have a second half? Don't you or just don't want to?
  //   13. Tell me all the most important things about yourself in a minute?
  //   14. What turns you on and likes in the opposite sex?
  //   15. What nicknames have you had or do you have?
  //   16. What goal and dream are you working on now?
  //   17. What are you most proud of in life?
  //   18. What bad habits do you have?
  //   19. What drives you crazy for no reason?
  //   20. What does your dream vacation look like?

  List<MeetingQuestionModel> questionsListNew = [];

  createQuestionList(){

    for(int i=0; i<questionsList.length; i++){
      final answerList = [];
      questionsListNew.add(MeetingQuestionModel(id: i+1, title: questionsList[i], answersList: []));
    }

  }


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

class MeetingQuestionModel{
  final int id;
  final String title;
  final List<MeetingAnswerModel> answersList;

  MeetingQuestionModel({required this.id, required this.title, required this.answersList});
}

class MeetingAnswerModel{
  final int id;
  final String title;

  MeetingAnswerModel({required this.id, required this.title});
}