import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';

class UserModel {
  UserModel({this.name = '', this.userID});
  final String? userID;
  final String name;
}

//Для управления данными авторизованного юзера (нельзя исп. на стр. входа, т.к. содержит в себе currentUser. Вызовет null exception)
class UserNotifier with ChangeNotifier {
  UserModel userData = UserModel();

  Future<void> setUserDataFunc({bool isInit = false}) async {
    print('setUserDataFunc');
    if (AppSupabase.client.auth.currentUser == null) {
      return;
    }
    final userID = AppSupabase.client.auth.currentUser!.id;

    AppSupabase.client
        .from(AppSupabase.users)
        .stream(primaryKey: ['id'])
        .eq('id', userID)
        .listen((List<Map<String, dynamic>> data) {
          Map<String, dynamic> userDataMep = data.first;
          userData = UserModel(name: userDataMep['name']);
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

      print('newData $newData');

      try {
        await AppSupabase.client
            .from(AppSupabase.users)
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
