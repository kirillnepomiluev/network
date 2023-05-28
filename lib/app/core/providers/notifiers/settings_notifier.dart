import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/utils/utils_geo.dart';
import 'package:provider/provider.dart';


//Для управления данными настроек
class SettingsNotifier with ChangeNotifier {
  Future<void> setSettings(BuildContext context) async {
    _radius = _radiusList.first;
    loadPartners(context);
  }

  int initialPage = 0;
  List<UserModel> _partnersList = [];
  List<UserModel> get partnersList => _partnersList;
  void setPage(int index) {
    initialPage = index;
  }

  int _radius = 1;
  int get radius => _radius;

  final List<int> _radiusList = [1,2,3,4,5];
  List<int> get radiusList => _radiusList;

  bool showPartnersLoading = true;

  //Регистрация выпадающий список
  void onRadiusChoosed(BuildContext context, {int? newRadius}) async {

    if(newRadius!=null){
      _radius = newRadius;
    }


    print('onRadiusChoosed $newRadius');
    showPartnersLoading = true;
    notifyListeners();

    partnersList.clear();
    initialPage = 0;
    await loadPartners(context, radius: _radius);

  }


  Future<void> loadPartners(BuildContext context, {num radius = 1}) async {
    print('loadPartners');
      final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      final id = userNotifier.userData.id;

      if(id != null){
        final usersList = await UtilsGeo.getUsersByRadius(radius: radius);

        for(final item in usersList){
          final userModel = UserModel.fromJson(item);
          if(userModel.id != id){
            partnersList.add(userModel);
          }
        }

        // _partnersList.where((element) => )

        // partnersList = await AppSupabase.client
        //     .from(AppSupabase.strUsers)
        //     .select()
        //     .neq('id', id)
        //     .order('level');
      }

    showPartnersLoading = false;
    notifyListeners();
  }
}

SettingsNotifier initSettings(BuildContext context) {
  SettingsNotifier settingsData = SettingsNotifier();
  settingsData.setSettings(context);
  return settingsData;
}
