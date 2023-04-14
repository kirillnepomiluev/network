import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final userData = Provider.of<UserNotifier>(context).userData;

class UserModel {

  UserModel({
    this.userID,
    this.personID = -1,
    this.age = '',
    this.name = '',
    this.phone = '',
    this.email = '',
    required this.createdDate,
    this.birthdayDate,
    this.hideAge = false,
    this.sex = '',
    this.hideSex = false,
    this.levelText = '',
    required this.interests,
    this.status = '',
    required this.occupation,
    this.familyStatus = '',
    this.hideFamilyStatus = false,
    this.hideMeetingsGoal = false,
    this.about = '',
    this.points = 0,
    this.rating = '0.0',
    this.ratingCount = 0,
    this.ratingStars1 = 0,
    this.ratingStars2 = 0,
    this.ratingStars3 = 0,
    this.ratingStars4 = 0,
    this.ratingStars5 = 0,
    this.energy = 0,
    this.recoverySpeed = 1.0,
    this.meetingsCount = 0,
    this.messagesCountDay = 0,
    this.likesCountDay = 0,
    this.meetingsGoal = '',
    this.verified = false,
    this.online = false,
    this.walletTokens = 0,
    required this.dataMap,
    this.avatarBodyID = 1,
    this.avatarHeadID = 3,
    required this.avatarBodyCupboard,
    required this.avatarHeadCupboard,
    required this.clothesIdList,
  });

  factory UserModel.emptyModel() {
    return UserModel(
      createdDate: DateTime.now(),
      interests: [],
      occupation: [],
      dataMap: {},
      avatarHeadCupboard: [],
      avatarBodyCupboard: [],
      clothesIdList: [],
    );
  }

  static String getStarsKey(int rate){
    return 'rating_stars_$rate';
  }

  static String getRating(Map<String, dynamic> dataMap){
    double rating = 0.0;

    final stars1 = dataMap[getStarsKey(1)];
    final stars2 = dataMap[getStarsKey(2)];
    final stars3 = dataMap[getStarsKey(3)];
    final stars4 = dataMap[getStarsKey(4)];
    final stars5 = dataMap[getStarsKey(5)];

    //(5*252 + 4*124 + 3*40 + 2*29 + 1*33) / (252+124+40+29+33) = 4.11 and change
    // final stars1 = 33;
    // final stars2 = 29;
    // final stars3 = 40;
    // final stars4 = 124;
    // final stars5 = 252;

    final sumOne = stars1*1 + stars2*2 + stars3*3 + stars4*4 + stars5*5;
    final sumTwo = stars1 + stars2 + stars3 + stars4 + stars5;

    if(sumTwo>0){
      rating = sumOne/sumTwo;
    }

    print('before  sumOne $sumOne sumTwo $sumTwo rating $rating');

    return rating.toStringAsFixed(1);
  }

  factory UserModel.fromJson(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    DateTime? birthdayDate = DateTime.tryParse(dataMap['birthday_date']);
    String age = _getAge(birthdayDate);
    final mapLevel = dataMap['level'];
    String levelText = '';
    if (mapLevel == 'base') {
      levelText = AppString().base;
    } else if (mapLevel == 'standart') {
      levelText = AppString().standart;
    } else {
      levelText = AppString().premium;
    }

    List avatarBodyCupboard = dataMap['avatar_body_cupboard'];
    List avatarHeadCupboard = dataMap['avatar_head_cupboard'];
    List clothesIdList = [...avatarBodyCupboard, ...avatarHeadCupboard];


    final rating = getRating(dataMap);


    return UserModel(
      userID: dataMap['id'],
      personID: dataMap['person_id'],
      name: dataMap['name'],
      phone: dataMap['phone'] ?? '',
      email: dataMap['email'] ?? '',
      createdDate: createdDate,
      birthdayDate: birthdayDate,
      age: age,
      hideAge: dataMap['hide_age'],
      sex: dataMap['sex'],
      hideSex: dataMap['hide_sex'],
      levelText: levelText,
      interests: dataMap['interests'],
      status: dataMap['status'],
      occupation: dataMap['occupation'],
      familyStatus: dataMap['family_status'],
      about: dataMap['about'],
      points: dataMap['points'],
      rating: rating,
      ratingCount: dataMap['rating_count'],
      energy: dataMap['energy'],
      recoverySpeed: dataMap['recovery_speed'],
      meetingsCount: dataMap['meetings_count'],
      messagesCountDay: dataMap['messages_count_day'],
      likesCountDay: dataMap['likes_count_day'],
      meetingsGoal: dataMap['meetings_goal'],
      verified: dataMap['verified'],
      online: dataMap['online'],
      walletTokens: dataMap['wallet_tokens'],
      dataMap: dataMap,
      hideFamilyStatus: dataMap['hide_family_status'],
      hideMeetingsGoal: dataMap['hide_meetings_goal'],
      avatarBodyID: dataMap['avatar_body_id'],
      avatarHeadID: dataMap['avatar_head_id'],
      avatarBodyCupboard: avatarBodyCupboard,
      avatarHeadCupboard: avatarHeadCupboard,
      clothesIdList: clothesIdList,
      ratingStars1: dataMap['rating_stars_1'],
      ratingStars2: dataMap['rating_stars_2'],
      ratingStars3: dataMap['rating_stars_3'],
      ratingStars4: dataMap['rating_stars_4'],
      ratingStars5: dataMap['rating_stars_5'],
    );
  }

  static String _getAge(birthdayDate) {
    String age = '';
    if (birthdayDate != null) {
      final currentYear = DateTime.now().year;
      final lastDate =
          DateTime(currentYear, birthdayDate.month, birthdayDate.day);
      final difInYears = currentYear - birthdayDate.year;
      if (lastDate.compareTo(birthdayDate) >= 0) {
        age = difInYears.toString();
      } else {
        age = (difInYears - 1).toString();
      }
    }
    return age;
  }

  final String? userID;
  final int personID;
  final String name;
  final String phone;
  final String email;
  final DateTime createdDate;
  final DateTime? birthdayDate;
  final String age;
  final bool hideAge;
  final bool hideFamilyStatus;
  final bool hideMeetingsGoal;
  final String sex;
  final bool hideSex;
  final String levelText;
  final List interests;
  final String status;
  final List occupation;
  final String familyStatus;
  final String about;
  final int points;
  final String rating;
  final int ratingStars1;
  final int ratingStars2;
  final int ratingStars3;
  final int ratingStars4;
  final int ratingStars5;
  final int ratingCount;
  final int energy;
  final double recoverySpeed;
  final int meetingsCount;
  final int messagesCountDay;
  final int likesCountDay;
  final String meetingsGoal;
  final bool verified;
  final bool online;
  final int walletTokens;
  final Map<String, dynamic> dataMap;
  final int avatarBodyID;
  final int avatarHeadID;
  final List avatarBodyCupboard;
  final List avatarHeadCupboard;
  final List clothesIdList;

  @override
  String toString() {
    return '$userID - $name';
  }
  // List<UserModel> fromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
}

//Для управления данными авторизованного юзера (нельзя исп. на стр. входа, т.к. содержит в себе currentUser. Вызовет null exception)
class UserNotifier with ChangeNotifier {





  UserModel userData = UserModel.emptyModel();
  // UserModel(
  //   createdDate: DateTime.now(),
  //   interests: [],
  //   occupation: [],
  //   mapData: {},
  //   avatarHeadCupboard: [],
  //   avatarBodyCupboard: [],
  //   clothesIdList: [],
  // );


  String currentUserID = '';
  void setCurrentID(String newValue){
    currentUserID = newValue;
    // notifyListeners();
  }

  void signOut(BuildContext context){
    // AppSupabase.client.auth.signOut();
    currentUserID = '';
    userData = UserModel.emptyModel();
    context.router.push(const StartViewRoute());
  }

  Future<void> setUserDataFunc({bool isInit = false}) async {

    // if (AppSupabase.client.auth.currentUser == null) {
    //   return;
    // }
    // final userID = AppSupabase.client.auth.currentUser!.id;
    final userID = currentUserID;

    if(userID.isNotEmpty) {
      AppSupabase.client
          .from(AppSupabase.strUsers)
          .stream(primaryKey: ['id'])
          .eq('id', userID)
          .listen((List<Map<String, dynamic>> data) {
            Map<String, dynamic> userDataMap = data.first;
            // userData = UserModel(name: userDataMep['name']);
            userData = UserModel.fromJson(userDataMap);
            if (isInit == false) {
              notifyListeners();
            }
          })
          .onError((e) {
            print('Ошибка в setUserDataFunc: $e');
          });
    }else{

    }
  }

  Future<void> updateData({required Map<String, dynamic> newData}) async {
    // if (AppSupabase.client.auth.currentUser == null) {
    if (currentUserID.isEmpty) {
      print('Нельзя обновить данные - не авторизован');
    }
    else {
      // final id = AppSupabase.client.auth.currentUser!.id;
      final id = currentUserID;

      try {
        await AppSupabase.client
            .from(AppSupabase.strUsers)
            .update(newData)
            .eq('id', id);
      } catch (error) {
        print('updateData error - $error');
      }
    }

    // final response = await AppSupabase.client
    //     .from(AppSupabase.users)
    //     .select('*')
    //     .eq('id', id);
  }

  MeetingModel meetingDraft = MeetingModel.emptyModel();

}

UserNotifier initData() {
  UserNotifier userNotifier = UserNotifier();

  // AppSupabase.client.auth.onAuthStateChange.listen((data) {
  //   final AuthChangeEvent event = data.event;
  //   if (event == AuthChangeEvent.signedIn) {
  //     print('авторизован');
  //     userNotifier.setUserDataFunc();
  //     // settingsNotifier.setSettings();
  //   } else {
  //     print('не авторизован');
  //   }
  // });

  return userNotifier;
}

class MeetingModel {
  MeetingModel({
    required this.id,
    this.creatorID = '',
    this.partnerID = '',
    required this.createdDate,
    this.type = 'Общение',
    this.title = '',
    this.description = '',
    required this.occupation,
    required this.interests,
    // this.requestStartDate,
    // this.requestEndDate,
    this.requestStatus = 'created',
    this.meetingStatus = 'not started',
    required this.meetingPlaningDate,
    this.meetingStartDate,
    this.meetingEndDate,
    this.meetingDurationMaxSeconds = 1200,
    this.meetingDurationFactSeconds = 0,
    this.questionsCount = 0,
    this.questionsMissedCount = 0,
    this.questionsAnsweredCount = 0,
    required this.questionsList,
    this.creatorRating,
    this.partnerRating,
    // this.ratingGeneral,
    // this.ratingTalking,
    // this.ratingSympathy,
    // this.complainSentBy,
    // this.complainType,
    // this.complainDescription,
  });

  factory MeetingModel.emptyModel() {
    return MeetingModel(id: 0, createdDate: DateTime.now(), meetingPlaningDate: DateTime.now(), occupation: [], interests: [], questionsList: []);
  }

    factory MeetingModel.fromMap(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    // DateTime? requestStartDate = Utils.getDate(dataMap['request_start_date']);
    // DateTime? requestEndDate = Utils.getDate(dataMap['request_end_date']);
    DateTime? meetingStartDate = Utils.getDate(dataMap['meeting_start_date']??'');
    DateTime? meetingEndDate = Utils.getDate(dataMap['meeting_end_date']??'');
    DateTime? meetingPlaningDate = Utils.getDate(dataMap['meeting_planing_date']);

    return MeetingModel(
      id: dataMap['id'],
      creatorID: dataMap['creator_id'],
      partnerID: dataMap['partner_id']??'',
      createdDate: createdDate,
      type: dataMap['type'],
      title: dataMap['title'],
      description: dataMap['description'],
      occupation: dataMap['occupation'],
      interests: dataMap['interests'],
      // requestStartDate: requestStartDate,
      // requestEndDate: requestEndDate,
      meetingPlaningDate: meetingPlaningDate,
      meetingStartDate: meetingStartDate,
      meetingEndDate: meetingEndDate,
      meetingDurationMaxSeconds: dataMap['meeting_duration_max_seconds'],
      meetingDurationFactSeconds: dataMap['meeting_duration_fact_seconds'],
      questionsCount: dataMap['questions_count'],
      questionsMissedCount: dataMap['questions_missed_count'],
      questionsAnsweredCount: dataMap['questions_answered_count'],
      questionsList: dataMap['questions_list']??[],
      requestStatus: dataMap['request_status'],
      meetingStatus: dataMap['meeting_status'],
      creatorRating: dataMap['creator_rating'],
      partnerRating: dataMap['partner_rating'],
      // : dataMap['rating_general'],
      // ratingGeneral: dataMap['rating_general'],
      // ratingTalking: dataMap['rating_talking'],
      // ratingSympathy: dataMap['rating_sympathy'],
      // complainSentBy: dataMap['complain_sent_by'],
      // complainType: dataMap['complain_type'],
      // complainDescription: dataMap['complain_description'],
    );
  }

  int id;
  String creatorID;
  String partnerID;
  DateTime createdDate;
  String type; //Общение / Деловая
  String title;
  String description;
  List occupation;
  List interests;
  // DateTime? requestStartDate;
  // DateTime? requestEndDate;
  DateTime? meetingPlaningDate;
  DateTime? meetingStartDate;
  DateTime? meetingEndDate;
  int meetingDurationMaxSeconds;
  int meetingDurationFactSeconds;
  int questionsCount;
  int questionsMissedCount;
  int questionsAnsweredCount;
  List questionsList; //List<Map<String, dynamic>>
  String requestStatus;
  String meetingStatus;
  double? creatorRating;
  double? partnerRating;
  // double? ratingGeneral;
  // double? ratingTalking;
  // double? ratingSympathy;
  // String? complainSentBy; //creator or partner
  // String? complainType;
  // String? complainDescription;
}