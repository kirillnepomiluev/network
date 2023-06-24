import 'package:flutter/material.dart';
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

  int _radius = 2;
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
    // print('loadPartners $radius km');
    partnersList.clear();
    initialPage = 0;

    showPartnersLoading = true;
    notifyListeners();

    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    final id = userNotifier.userData.id;

    if (id != null) {
      final usersList = await UtilsGeo.getUsersByRadius(radius: radius);

      for (final item in usersList) {
        final userModel = UserModel.fromMap(item);
        if (userModel.id != id) {
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


    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   showPartnersLoading = false;
    //   notifyListeners();
    // });

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
