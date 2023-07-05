import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/settings_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final userData = Provider.of<UserNotifier>(context).userData;


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

  static String? getID() => testID.isNotEmpty ? testID :  AppSupabase.client.auth.currentUser != null? AppSupabase.client.auth.currentUser!.id : null;

  Future<void> firstUpdateData() async {
    // final id = testID.isNotEmpty ? testID : AppSupabase.client.auth.currentUser!.id;

    final id = getID();
    print('firstUpdateData id $id');

    if(id==null) {
      return;
    }

    final data = await AppSupabase.client
        .from(AppSupabase.strUsers)
        .select()
        .eq('id', id);
    final userDataMap = data[0];
    userData = await UserModel.create(userDataMap);
    notifyListeners();
  }

  // Future<void> firstUpdateData() async {
  //   // final id = testID.isNotEmpty ? testID : AppSupabase.client.auth.currentUser!.id;
  //
  //   final id = getID();
  //   print('firstUpdateData id $id');
  //
  //   if(id==null) {
  //     return;
  //   }
  //
  //   final data = await AppSupabase.client
  //       .from(AppSupabase.strUsers)
  //       .select()
  //       .eq('id', id);
  //
  //   final userDataMap = data[0];
  //
  //   await AppSupabase.client
  //       .from(AppSupabase.strClothes)
  //       .select('*')
  //       .eq('id', userDataMap['avatar_body_id']).single().then((value) {
  //     // _bodyURL = value['image_url'];
  //
  //     userDataMap.addAll({
  //       'clothe_url' : value['image_url'],
  //       'clothe_level' :  value['level'],
  //     });
  //     // print('У костюма - ${userDataMap['avatar_body_id']} - level ${value['level']}');
  //   });
  //
  //   userData = UserModel.fromMap(userDataMap);
  //   notifyListeners();
  // }

  StreamSubscription<List<Map<String, dynamic>>>? userListener;

  Future<void> setUserDataFunc({bool isInit = false}) async {
    final id = getID();
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
            userData = await UserModel.create(userDataMap);

            print('Обновили данные - level ${userData.level}');
            notifyListeners();
      });

  }

  Future<void> locationUpdateData({
    required double lat,
    required double long,
  }) async {
    updateData(
        newData: {
          'lat': lat,
          'long': long,
          'location': 'POINT($long $lat)'
        });
  }

  Future<void> updateData({String routeName = '', required Map<String, dynamic> newData}) async {
    // final id = userData.id;

    final id = getID();
    print('updateData id $id');

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

    notifyListeners();
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
