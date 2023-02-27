import 'package:flutter/material.dart';


//Для управления данными настроек
class SettingsNotifier with ChangeNotifier{

  void setSettings(){

  }

}

SettingsNotifier initSettings() {
  print('ssssssssssssss');
  SettingsNotifier settingsData = SettingsNotifier();
  // _settingsData.setSettings();

  return settingsData;
}

