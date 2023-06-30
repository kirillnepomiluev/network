import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/settings_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final userData = Provider.of<UserNotifier>(context).userData;
class UserModel {

  final String? id;
  final String bodyURL;
  final int personID;
  final String name;
  final String phone;
  final String email;
  final DateTime createdDate;
  final DateTime? birthdayDate;
  final int? age;
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
  final String? location;
  final double? distMeters;
  final int level;
  // final String levelText;
  final String avatarURL;

  UserModel({
    this.avatarURL = AppConstants.baseAvatarUrl,
    this.bodyURL = AppConstants.baseBodyUrl,

    this.id,
    this.personID = -1,
    this.level = 0,
    // this.levelText = '',
    this.age,
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
    this.location,
    this.distMeters,
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

  factory UserModel.fromMap(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    DateTime? birthdayDate = DateTime.tryParse(dataMap['birthday_date']);
    int? age = _getAge(birthdayDate);
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

    final level = dataMap['level'];
    // final levelText = level<1? "Hasn't costume" : 'Level $level';

    final rating = getRating(dataMap);

    return UserModel(
      avatarURL: dataMap['avatar_url']??AppConstants.baseAvatarUrl,
      id: dataMap['id'],
      distMeters: dataMap['dist_meters'],
      bodyURL: dataMap['body_url']??'',
      personID: dataMap['person_id'],
      level: level,
      // levelText: levelText,
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
      location: dataMap['location'],
    );

  }

  static int? _getAge(birthdayDate) {
    // int age = '';
    int? age;
    if (birthdayDate != null) {
      final currentYear = DateTime.now().year;
      final lastDate =
          DateTime(currentYear, birthdayDate.month, birthdayDate.day);
      final difInYears = (currentYear - birthdayDate.year).toInt();
      if (lastDate.compareTo(birthdayDate) >= 0) {
        age = difInYears;
      } else {
        age = difInYears - 1;
      }
    }
    return age;
  }

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

  Future<void> signOut(BuildContext context, SettingsNotifier settingsNotifier) async {

    // settingsNotifier.clearPartnersList();

    await AppSupabase.client.auth.signOut();

    if(userListener != null){
      userListener!.cancel();
    }

    currentUserID = '';
    userData = UserModel.emptyModel();
    context.router.push(const StartViewRoute());
  }

  static const id1 = '6c4ba474-d378-4b64-84de-729873895b11';
  static const id2 = '8a3c903d-5be8-4551-98bb-5cef4f9ab142';
  static const id3 = 'b5fc9702-3b39-48aa-ab77-3e33b4420bf9';
  static const id4 = 'd54726fd-a7d5-447b-b43b-dcac85097776';
  static const id5 = 'c9e44e05-7ed0-4c95-8f81-d023ab2ca443';
  static const testID = '';
  final id = testID.isNotEmpty ? testID :  AppSupabase.client.auth.currentUser != null? AppSupabase.client.auth.currentUser!.id : null;
  Future<void> firstUpdateData() async {
    // final id = testID.isNotEmpty ? testID : AppSupabase.client.auth.currentUser!.id;

    if(id==null) {
      return;
    }

    print('firstUpdateData');
    final data = await AppSupabase.client
        .from(AppSupabase.strUsers)
        .select()
        .eq('id', id);

    final userDataMap = data[0];

    userData = UserModel.fromMap(userDataMap);
    notifyListeners();
  }

  StreamSubscription<List<Map<String, dynamic>>>? userListener;

  String _bodyURL = '';

  Future<void> setUserDataFunc({bool isInit = false}) async {
    print('setUserDataFunc');
    if(id==null) {
      return;
    }
    // if (AppSupabase.client.auth.currentUser == null) {
    //   return;
    // }
    // final id = testID.isNotEmpty ? testID : AppSupabase.client.auth.currentUser!.id;

      userListener = AppSupabase.client
          .from(AppSupabase.strUsers)
          .stream(primaryKey: ['id'])
          .eq('id', id)
          .listen((List<Map<String, dynamic>> data) async {
            Map<String, dynamic> userDataMap = data.first;

            if(_bodyURL.isEmpty || userData.avatarBodyID != userDataMap['avatar_body_id']){
              await AppSupabase.client
                  .from(AppSupabase.strClothes)
                  .select('*')
                  .eq('id', userData.avatarBodyID).single().then((value) {
                _bodyURL = value['image_url'];
              });
            }

            userDataMap.addAll({
              'body_url' : _bodyURL
            });

            userData = UserModel.fromMap(userDataMap);

            print('Обновили данные');
            notifyListeners();
      });

  }

  Future<void> locationUpdateData({
    required double lat,
    required double long,
  }) async {
    updateData(
        newData: {'lat': lat, 'long': long, 'location': 'POINT($lat $long)'});
  }

  Future<void> updateData({String routeName = '', required Map<String, dynamic> newData}) async {
    // final id = userData.id;

    if (id == null) {
      print('Нельзя обновить данные - не авторизован');
    } else {
      try {

        print('${routeName.isEmpty?'': 'routeName $routeName - '}update data $id - $newData');

        await AppSupabase.client
            .from(AppSupabase.strUsers)
            .update(newData)
            .eq('id', id);
      } catch (error) {
        print('updateData error - $error');
      }
    }
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
