import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class MeetingModel {
  int creatorLevel;
  int partnerLevel;
  int id;
  String creatorID;
  String partnerID;
  UserModel creatorModel;
  UserModel partnerModel;
  DateTime createdDate;
  String type; //Общение, Деловая
  String title;
  String description;
  List occupation;
  List interests;
  DateTime scheduledDate;
  DateTime? startDate;
  DateTime? endDate;
  int durationMaxSeconds;
  int durationFactSeconds;
  int questionsCount;
  int questionsMissedCount;
  int questionsAnsweredCount;
  List questionsList; //List<Map<String, dynamic>>
  String status;
  String statusText;
  int? creatorRating;
  int? partnerRating;
  int? rateFromCreator;
  String? fbFromCreator;
  int? rateFromPartner;
  String? fbFromPartner;
  String createdDateText;
  String scheduledDateText;
  bool creatorEntered;
  bool partnerEntered;
  bool isEmpty;
  int reward;

  MeetingModel({
    this.reward = 0,
    this.isEmpty = true,
    this.createdDateText = '',
    this.scheduledDateText = '',
    this.creatorLevel = 0,
    this.partnerLevel = 0,
    required this.id,
    this.creatorID = '',
    this.partnerID = '',
    required this.creatorModel,
    required this.partnerModel,
    required this.createdDate,
    this.type = 'Общение',
    this.title = '',
    this.description = '',
    required this.occupation,
    required this.interests,
    this.status =
        'created', //created/cancelled/expired    accepted/denied/   active/interrupted/done
    this.statusText = 'created',
    required this.scheduledDate,
    this.startDate,
    this.endDate,
    this.durationMaxSeconds = 1200,
    this.durationFactSeconds = 0,
    this.questionsCount = 0,
    this.questionsMissedCount = 0,
    this.questionsAnsweredCount = 0,
    required this.questionsList,
    this.creatorRating,
    this.partnerRating,
    this.rateFromCreator,
    this.fbFromCreator,
    this.rateFromPartner,
    this.fbFromPartner,
    this.creatorEntered = false,
    this.partnerEntered = false,
  });

  static Future<MeetingModel> create(Map<String, dynamic> dataMap, BuildContext context) async {
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    final userID = userData.id;
    final String creatorID = dataMap['creator_id'] ?? '';
    final String partnerID = dataMap['partner_id'] ?? '';
    UserModel creatorModel = UserModel.emptyModel();
    UserModel partnerModel = UserModel.emptyModel();
    if (userID != null) {
      final isCreator = userID == creatorID;
      final searchID = isCreator ? partnerID : creatorID;


      final searchData = await AppSupabase.client
          .from(AppSupabase.strUsers)
          .select()
          .eq('id', searchID)
          .single();

      // print('create isCreator $isCreator searchID $searchID searchData ${searchData['name']} userData ${userData.name}');

      if (isCreator) {
        creatorModel = userData;
        partnerModel = UserModel.fromMap(searchData);
      } else {
        creatorModel = UserModel.fromMap(searchData);
        partnerModel = userData;
      }
    }

    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    DateTime? meetingStartDate = Utils.getDate(dataMap['start_date'] ?? '');
    DateTime? meetingEndDate = Utils.getDate(dataMap['end_date'] ?? '');
    DateTime scheduledDate = Utils.getDate(dataMap['scheduled_date'])!;
    final status = dataMap['status'];
    final statusText = getStatusText(status);

    final localizations = MaterialLocalizations.of(context);
    // final createdDateText = localizations.formatShortDate(createdDate);
    final createdDateText = localizations.formatCompactDate(createdDate);
    final scheduledDateText = localizations.formatShortDate(scheduledDate);

    return MeetingModel(
      reward: dataMap['reward'],
      isEmpty: false,
      createdDateText: createdDateText,
      scheduledDateText: scheduledDateText,
      id: dataMap['id'],
      creatorID: creatorID,
      partnerID: partnerID,
      creatorModel: creatorModel,
      partnerModel: partnerModel,
      createdDate: createdDate,
      type: dataMap['type'],
      title: dataMap['title'],
      description: dataMap['description'],
      occupation: dataMap['occupation'],
      interests: dataMap['interests'],
      scheduledDate: scheduledDate,
      startDate: meetingStartDate,
      endDate: meetingEndDate,
      durationMaxSeconds: dataMap['duration_max_seconds'],
      durationFactSeconds: dataMap['duration_fact_seconds'],
      questionsCount: dataMap['questions_count'],
      questionsMissedCount: dataMap['questions_missed_count'],
      questionsAnsweredCount: dataMap['questions_answered_count'],
      questionsList: dataMap['questions_list'] ?? [],
      status: status,
      statusText: statusText,
      creatorRating: dataMap['creator_rating'],
      partnerRating: dataMap['partner_rating'],
      rateFromCreator: dataMap['rate_from_creator'],
      fbFromCreator: dataMap['fb_from_creator'],
      rateFromPartner: dataMap['rate_from_partner'],
      fbFromPartner: dataMap['fb_from_partner'],
      creatorEntered: dataMap['creator_entered'],
      partnerEntered: dataMap['partner_entered'],
      creatorLevel: dataMap['creator_level'],
      partnerLevel: dataMap['partner_level'],
    );
  }

  factory MeetingModel.fromMap(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    DateTime? meetingStartDate = Utils.getDate(dataMap['start_date'] ?? '');
    DateTime? meetingEndDate = Utils.getDate(dataMap['end_date'] ?? '');
    DateTime scheduledDate = Utils.getDate(dataMap['scheduled_date'])!;
    final status = dataMap['status'];
    final statusText = getStatusText(status);

    return MeetingModel(
        isEmpty: false,
        id: dataMap['id'],
        creatorID: dataMap['creator_id'],
        partnerID: dataMap['partner_id'] ?? '',
        creatorModel: UserModel.emptyModel(),
        partnerModel: UserModel.emptyModel(),
        createdDate: createdDate,
        type: dataMap['type'],
        title: dataMap['title'],
        description: dataMap['description'],
        occupation: dataMap['occupation'],
        interests: dataMap['interests'],
        scheduledDate: scheduledDate,
        startDate: meetingStartDate,
        endDate: meetingEndDate,
        durationMaxSeconds: dataMap['duration_max_seconds'],
        durationFactSeconds: dataMap['duration_fact_seconds'],
        questionsCount: dataMap['questions_count'],
        questionsMissedCount: dataMap['questions_missed_count'],
        questionsAnsweredCount: dataMap['questions_answered_count'],
        questionsList: dataMap['questions_list'] ?? [],
        status: status,
        statusText: statusText,
        creatorRating: dataMap['creator_rating'],
        partnerRating: dataMap['partner_rating'],
        rateFromCreator: dataMap['rate_from_creator'],
        fbFromCreator: dataMap['fb_from_creator'],
        rateFromPartner: dataMap['rate_from_partner'],
        fbFromPartner: dataMap['fb_from_partner'],
        creatorEntered: dataMap['creator_entered'],
        partnerEntered: dataMap['partner_entered']);
  }

  factory MeetingModel.emptyModel() {
    return MeetingModel(
        id: 0,
        creatorModel: UserModel.emptyModel(),
        partnerModel: UserModel.emptyModel(),
        createdDate: DateTime.now(),
        scheduledDate: DateTime.now(),
        occupation: [],
        interests: [],
        questionsList: []);
  }

  static String getStatusText(String status) {
    String statusText = '';

    switch (status) {
      case 'created':
        statusText = 'создана';
        break;
      case 'cancelled':
        statusText = 'отменено';
        break;
      case 'expired':
        statusText = 'просрочена';
        break;
      case 'accepted':
        statusText = 'принята';
        break;
      case 'denied':
        statusText = 'отклонена';
        break;
      case 'active':
        statusText = 'активна';
        break;
      case 'interrupted':
        statusText = 'прервана';
        break;
      case 'done':
        statusText = 'завершена';
        break;
    }

    return statusText;
  }

  Future<void> updateData({required Map<String, dynamic> newData}) async {
    try {
      await AppSupabase.client
          .from(AppSupabase.strMeetings)
          .update(newData)
          .eq('id', id);
    } catch (error) {
      print('updateData error - $error');
    }
  }
}
