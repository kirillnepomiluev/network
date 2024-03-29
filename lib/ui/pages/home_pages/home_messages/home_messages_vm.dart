import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class HomeMessagesViewModel extends ViewModel {
  HomeMessagesViewModel(this.context);
  final BuildContext context;


  List<Map<String, dynamic>> photoList = [
    <String, dynamic>{
      'name' :   'Джоли',
      'status' :   'Запланирована встреча',
      'url' :   'assets/images/avatars/avatar_0.png',
      'online' : false,
    },

    <String, dynamic>{
      'name' : 'Станислав',
      'status' : 'Встреча проведена',
      'url' :  'assets/images/avatars/avatar_2.png',
      'online' : true,
    },

    <String, dynamic>{
      'name' : 'Меган',
      'status' : 'Приглашение на встречу',
      'url' :  'assets/images/avatars/avatar_1.png',
      'online' : false,
    },

    <String, dynamic>{
      'name' : 'Игорь',
      'status' :  'Запланирована встреча',
      'url' :  'assets/images/avatars/avatar_2.png',
      'online' : true,
    },

    <String, dynamic>{
      'name' :   'Джоли',
      'status' :   'Запланирована встреча',
      'url' :   'assets/images/avatars/avatar_0.png',
      'online' : false,
    },

    <String, dynamic>{
      'name' :   'Джоли',
      'status' :   'Запланирована встреча',
      'url' :   'assets/images/avatars/avatar_1.png',
      'online' : false,
    },

  ];

}