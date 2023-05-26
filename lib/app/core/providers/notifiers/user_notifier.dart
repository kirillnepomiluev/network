import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final userData = Provider.of<UserNotifier>(context).userData;
class UserModel {
  UserModel({
    this.id,
    this.personID = -1,
    this.level = 0,
    this.age = '',
    this.name = '',
    this.phone = '',
    this.email = '',
    required this.createdDate,
    this.birthdayDate,
    this.hideAge = false,
    this.sex = '',
    this.hideSex = false,
    this.rankText = '',
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
    this.lat,
    this.long,
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

  static String getStarsKey(int rate) {
    return 'rate_$rate';
  }

  static String getRating(Map<String, dynamic> dataMap) {
    double rating = 0.0;

    final stars1 = dataMap[getStarsKey(1)];
    final stars2 = dataMap[getStarsKey(2)];
    final stars3 = dataMap[getStarsKey(3)];
    final stars4 = dataMap[getStarsKey(4)];
    final stars5 = dataMap[getStarsKey(5)];

    // (5*252 + 4*124 + 3*40 + 2*29 + 1*33) / (252+124+40+29+33) = 4.11 and change
    // final stars1 = 33;
    // final stars2 = 29;
    // final stars3 = 40;
    // final stars4 = 124;
    // final stars5 = 252;

    final sumOne =
        stars1 * 1 + stars2 * 2 + stars3 * 3 + stars4 * 4 + stars5 * 5;
    final sumTwo = stars1 + stars2 + stars3 + stars4 + stars5;

    if (sumTwo > 0) {
      rating = sumOne / sumTwo;
    }

    return rating.toStringAsFixed(1);
  }

  factory UserModel.fromJson(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    DateTime? birthdayDate = DateTime.tryParse(dataMap['birthday_date']);
    String age = _getAge(birthdayDate);
    // final mapRank = dataMap['level'];
    final mapRank = dataMap['rank'];
    String rankText = '';
    if (mapRank == 'base') {
      rankText = AppString().base;
    } else if (mapRank == 'standart') {
      rankText = AppString().standart;
    } else {
      rankText = AppString().premium;
    }

    List avatarBodyCupboard = dataMap['avatar_body_cupboard'];
    List avatarHeadCupboard = dataMap['avatar_head_cupboard'];
    List clothesIdList = [...avatarBodyCupboard, ...avatarHeadCupboard];

    final rating = getRating(dataMap);

    return UserModel(
      id: dataMap['id'],
      personID: dataMap['person_id'],
      level: dataMap['level'],
      name: dataMap['name'],
      phone: dataMap['phone'] ?? '',
      email: dataMap['email'] ?? '',
      createdDate: createdDate,
      birthdayDate: birthdayDate,
      age: age,
      hideAge: dataMap['hide_age'],
      sex: dataMap['sex'],
      hideSex: dataMap['hide_sex'],
      rankText: rankText,
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
      ratingStars1: dataMap[getStarsKey(1)],
      ratingStars2: dataMap[getStarsKey(2)],
      ratingStars3: dataMap[getStarsKey(3)],
      ratingStars4: dataMap[getStarsKey(4)],
      ratingStars5: dataMap[getStarsKey(5)],
      lat: dataMap['lat'],
      long: dataMap['long'],
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

  final String? id;
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
  final String rankText;
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
  final double? lat;
  final double? long;
  final int level;

  @override
  String toString() {
    return '$id - $name';
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
  void setCurrentID(String newValue) {
    currentUserID = newValue;
    // notifyListeners();
  }

  void signOut(BuildContext context) {
    AppSupabase.client.auth.signOut();
    currentUserID = '';
    userData = UserModel.emptyModel();
    context.router.push(const StartViewRoute());
  }

  // static final stream = AppSupabase.client
  //     .from(AppSupabase.strUsers)
  //     .select('*, clothes!users_avatar_body_id_fkey!inner(level)')
  //     .eq('id', AppSupabase.client.auth.currentUser!.id);

  Future<void> firstUpdateData() async {
    print('firstUpdateData');
    final data = await AppSupabase.client
        .from(AppSupabase.strUsers)
        .select()
        .eq('id', AppSupabase.client.auth.currentUser!.id);

    final userDataMap = data[0];

    userData = UserModel.fromJson(userDataMap);
    notifyListeners();
  }


  Future<void> setUserDataFunc({bool isInit = false}) async {
    // if (AppSupabase.client.auth.currentUser == null) {
    //   return;
    // }
    final userID = AppSupabase.client.auth.currentUser!.id;
    // final userID = currentUserID;

    if (userID.isNotEmpty) {
      AppSupabase.client
          .from(AppSupabase.strUsers)
          .stream(primaryKey: ['id'])
          .eq('id', userID)
          .listen((List<Map<String, dynamic>> data) {

            Map<String, dynamic> userDataMap = data.first;
            // userData = UserModel(name: userDataMep['name']);

            if(currentUserID==userDataMap['id']){
              userData = UserModel.fromJson(userDataMap);
              if (isInit == false) {
                notifyListeners();
              }
            }

          })
          .onError((e) {
            print('Ошибка в setUserDataFunc: $e');
          });
    } else {}
  }

  Future<void> updateData({required Map<String, dynamic> newData}) async {
    if (AppSupabase.client.auth.currentUser == null) {
    // if (currentUserID.isEmpty) {  //для теста при переключении
      print('Нельзя обновить данные - не авторизован');
    } else {
      final id = AppSupabase.client.auth.currentUser!.id;
      // final id = currentUserID;

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

  AppSupabase.client.auth.onAuthStateChange.listen((data) {
    final AuthChangeEvent event = data.event;
    if (event == AuthChangeEvent.signedIn) {
      print('initData авторизован');
      userNotifier.setUserDataFunc();
    } else {
      print('не авторизован');
    }
  });


  return userNotifier;
}

