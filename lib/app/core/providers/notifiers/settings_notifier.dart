import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/utils/utils_geo.dart';
import 'package:provider/provider.dart';

//Для управления данными настроек
class SettingsNotifier with ChangeNotifier {
  Future<void> setSettings(BuildContext context) async {
    onRadiusChoosed(context);
    // _radius = _radiusList[1];
    // loadPartners(context, radius: _radius);
  }

  int initialPage = 0;
  final List<UserModel> _partnersList = [];
  List<UserModel> get partnersList => _partnersList;
  void setPage(int index) {
    initialPage = index;
  }

  int _radius = 5;
  int get radius => _radius;

  final List<int> _radiusList = [1, 2, 3, 4, 5];
  List<int> get radiusList => _radiusList;

  bool showPartnersLoading = true;

  //Регистрация выпадающий список

  // void clearPartnersList(){
  //   _partnersList.clear();
  //   notifyListeners();
  // }

  Future<void> onRadiusChoosed(BuildContext context, {int? newRadius}) async {
    if (newRadius != null) {
      _radius = newRadius;
    }
    await loadPartners(context, radius: _radius);
  }

  Future<void> loadPartners(BuildContext context, {required num radius}) async {
    print('loadPartners $radius km');
    partnersList.clear();
    initialPage = 0;

    showPartnersLoading = true;
    notifyListeners();

    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    final id = userData.id;

    final location = userData.location;

    if (id != null && location != null) {

      final myLat = userData.lat!;
      final myLong = userData.long!;
      // const myLat = 53.1299150;
      // const myLong = 48.4251995; //7 после точки

      // final usersList = await UtilsGeo.getUsersByRadius(radius: radius, myLat: myLat, myLong: myLong);
      // final usersList = [];

    final usersList = await AppSupabase.client
          .from(AppSupabase.strUsers)
          .select('*');

    print('usersList $usersList');

      for (final item in usersList) {

        final lat = item['lat'];
        final long = item['long'];

        if(lat!=null && long!=null){
          final distMeters = UtilsGeo.culcDistance(lat1: myLat, long1: myLong, lat2: lat, long2: long);
          item['dist_meters'] = distMeters;


          final restricted = radius*1000;
          if(distMeters<restricted){
            final userModel = await UserModel.create(item);

            print('distMeters ${userModel.distMeters} restricted $restricted');

            if (userModel.id != id) {
              partnersList.add(userModel);
            }
          }

        }

      }
    }

    showPartnersLoading = false;
    notifyListeners();
  }
}

SettingsNotifier initSettings(BuildContext context) {
  SettingsNotifier settingsData = SettingsNotifier();
  // ignore: cascade_invocations
  settingsData.setSettings(context);
  return settingsData;
}
