import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/utils/utils_geo.dart';
import 'package:provider/provider.dart';


//Для управления данными настроек
class SettingsNotifier with ChangeNotifier {
  Future<void> setSettings(BuildContext context) async {
    loadPartners(context);
  }

  int initialPage = 0;
  List partnersList = [];

  void setPage(int index) {
    initialPage = index;
  }

  Future<void> loadPartners(BuildContext context) async {
    print('loadPartners');
    if (partnersList.isEmpty) {
      final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      final id = userNotifier.userData.id;
      if(id != null){

        partnersList = await UtilsGeo.getUsersByRadius();

        // partnersList = await AppSupabase.client
        //     .from(AppSupabase.strUsers)
        //     .select()
        //     .neq('id', id)
        //     .order('level');
      }
    }
    notifyListeners();
  }
}

SettingsNotifier initSettings(BuildContext context) {
  SettingsNotifier settingsData = SettingsNotifier();
  settingsData.setSettings(context);
  return settingsData;
}
