import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/generated/l10n.dart';
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
    this.level = '',
    required this.interests,
    this.status = '',
    required this.occupation,
    this.familyStatus = '',
    this.hideFamilyStatus = false,
    this.hideMeetingsGoal = false,
    this.about = '',
    this.points = 0,
    this.rating = 5.0,
    this.energy = 0,
    this.recoverySpeed = 1.0,
    this.meetingsCount = 0,
    this.messagesCountDay = 0,
    this.likesCountDay = 0,
    this.meetingsGoal = '',
    this.verified = false,
    this.online = false,
    this.walletTokens = 0,
    required this.mapData,
    this.avatarBodyID = 1,
    this.avatarHeadID = 3,
    required this.avatarBodyCupboard,
    required this.avatarHeadCupboard,
    required this.clothesIdList,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    final birthdayDate = DateTime.tryParse(map['birthday_date']);
    String age = _getAge(birthdayDate);
    final mapLevel = map['level'];
    String level = '';
    if (mapLevel == 'base') {
      level = AppString().base;
    } else if (mapLevel == 'standart') {
      level = AppString().standart;
    } else {
      level = AppString().premium;
    }

    List avatarBodyCupboard = map['avatar_body_cupboard'];
    List avatarHeadCupboard = map['avatar_head_cupboard'];
    List clothesIdList = [...avatarBodyCupboard, ...avatarHeadCupboard];

    return UserModel(
      userID: map['id'],
      personID: map['person_id'],
      name: map['name'],
      phone: map['phone']??'',
      email: map['email']??'',
      createdDate: DateTime.parse(map['created_date']),
      birthdayDate: birthdayDate,
      age: age,
      hideAge: map['hide_age'],
      sex: map['sex'],
      hideSex: map['hide_sex'],
      level: level,
      interests: map['interests'],
      status: map['status'],
      occupation: map['occupation'],
      familyStatus: map['family_status'],
      about: map['about'],
      points: map['points'],
      rating: map['rating'],
      energy: map['energy'],
      recoverySpeed: map['recovery_speed'],
      meetingsCount: map['meetings_count'],
      messagesCountDay: map['messages_count_day'],
      likesCountDay: map['likes_count_day'],
      meetingsGoal: map['meetings_goal'],
      verified: map['verified'],
      online: map['online'],
      walletTokens: map['wallet_tokens'],
      mapData: map,
      hideFamilyStatus: map['hide_family_status'],
      hideMeetingsGoal: map['hide_meetings_goal'],
      avatarBodyID: map['avatar_body_id'],
      avatarHeadID: map['avatar_head_id'],
      avatarBodyCupboard: avatarBodyCupboard,
      avatarHeadCupboard: avatarHeadCupboard,
      clothesIdList: clothesIdList,
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
  final String level;
  final List interests;
  final String status;
  final List occupation;
  final String familyStatus;
  final String about;
  final int points;
  final double rating;
  final int energy;
  final double recoverySpeed;
  final int meetingsCount;
  final int messagesCountDay;
  final int likesCountDay;
  final String meetingsGoal;
  final bool verified;
  final bool online;
  final int walletTokens;
  final Map<String, dynamic> mapData;
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
  UserModel userData = UserModel(
    createdDate: DateTime.now(),
    interests: [],
    occupation: [],
    mapData: {},
    avatarHeadCupboard: [],
    avatarBodyCupboard: [],
    clothesIdList: [],
  );

  Future<void> setUserDataFunc({bool isInit = false}) async {
    if (AppSupabase.client.auth.currentUser == null) {
      return;
    }

    final userID = AppSupabase.client.auth.currentUser!.id;

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
          print('Ошибка в Data -> setUserDataFunc: $e');
        });
  }

  Future<void> updateData({required Map<String, dynamic> newData}) async {
    if (AppSupabase.client.auth.currentUser == null) {
      print('Нельзя обновить данные - не авторизован');
    } else {
      final id = AppSupabase.client.auth.currentUser!.id;

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
}

UserNotifier initData() {
  UserNotifier userNotifier = UserNotifier();
  AppSupabase.client.auth.onAuthStateChange.listen((data) {
    final AuthChangeEvent event = data.event;
    if (event == AuthChangeEvent.signedIn) {
      print('авторизован');
      userNotifier.setUserDataFunc();
      // settingsNotifier.setSettings();
    } else {
      print('не авторизован');
    }
  });
  return userNotifier;
}

//import 'dart:convert';
//
// List<ToDo> toDoFromJson(String str) => List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));
//
// String toDoToJson(List<ToDo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ToDo {
//   ToDo({
//     required this.id,
//     required this.createdAt,
//     required this.title,
//     required this.description,
//   });
//
//   final int id;
//   final DateTime createdAt;
//   final String title;
//   final String description;
//
//   factory ToDo.fromJson(Map<String, dynamic> map) => ToDo(
//     id: map["id"],
//     createdAt: DateTime.parse(map["created_at"]),
//     title: map["title"],
//     description: map["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "created_at": createdAt.toIso8601String(),
//     "title": title,
//     "description": description,
//   };
// }
