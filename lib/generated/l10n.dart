// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppString {
  AppString();

  static AppString? _current;

  static AppString get current {
    assert(_current != null,
        'No instance of AppString was loaded. Try to initialize the AppString delegate before accessing AppString.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppString> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppString();
      AppString._current = instance;

      return instance;
    });
  }

  static AppString of(BuildContext context) {
    final instance = AppString.maybeOf(context);
    assert(instance != null,
        'No instance of AppString present in the widget tree. Did you add AppString.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppString? maybeOf(BuildContext context) {
    return Localizations.of<AppString>(context, AppString);
  }

  /// `Войти`
  String get signIn {
    return Intl.message(
      'Войти',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Главное в связах\n - это`
  String get mainThingInRelationsIs {
    return Intl.message(
      'Главное в связах\n - это',
      name: 'mainThingInRelationsIs',
      desc: '',
      args: [],
    );
  }

  /// `связи`
  String get relations {
    return Intl.message(
      'связи',
      name: 'relations',
      desc: '',
      args: [],
    );
  }

  /// `Выполните`
  String get execute {
    return Intl.message(
      'Выполните',
      name: 'execute',
      desc: '',
      args: [],
    );
  }

  /// `вход`
  String get enter {
    return Intl.message(
      'вход',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Войти по номеру телефона`
  String get signInByPhone {
    return Intl.message(
      'Войти по номеру телефона',
      name: 'signInByPhone',
      desc: '',
      args: [],
    );
  }

  /// `Войти с помошью почты`
  String get signInByEmail {
    return Intl.message(
      'Войти с помошью почты',
      name: 'signInByEmail',
      desc: '',
      args: [],
    );
  }

  /// `Войти через Google`
  String get signInByGoogle {
    return Intl.message(
      'Войти через Google',
      name: 'signInByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Войти через Facebook`
  String get signInByFacebook {
    return Intl.message(
      'Войти через Facebook',
      name: 'signInByFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Введите`
  String get input {
    return Intl.message(
      'Введите',
      name: 'input',
      desc: '',
      args: [],
    );
  }

  /// `код`
  String get code {
    return Intl.message(
      'код',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Отправленный на номер`
  String get sentToPhoneNumber {
    return Intl.message(
      'Отправленный на номер',
      name: 'sentToPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Повторить попытку`
  String get retry {
    return Intl.message(
      'Повторить попытку',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `ваш номер`
  String get yourPhoneNumber {
    return Intl.message(
      'ваш номер',
      name: 'yourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Отправить код`
  String get sendCode {
    return Intl.message(
      'Отправить код',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Восстановление`
  String get recovery {
    return Intl.message(
      'Восстановление',
      name: 'recovery',
      desc: '',
      args: [],
    );
  }

  /// `аккаунта`
  String get ofAccount {
    return Intl.message(
      'аккаунта',
      name: 'ofAccount',
      desc: '',
      args: [],
    );
  }

  /// `Введите адрес электронной почты`
  String get inputEmailAddress {
    return Intl.message(
      'Введите адрес электронной почты',
      name: 'inputEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Введите адрес`
  String get inputAddress {
    return Intl.message(
      'Введите адрес',
      name: 'inputAddress',
      desc: '',
      args: [],
    );
  }

  /// `электронной почты`
  String get ofEmail {
    return Intl.message(
      'электронной почты',
      name: 'ofEmail',
      desc: '',
      args: [],
    );
  }

  /// `Чтобы восстановить доступ\nк своему аккаунту`
  String get toRecoveryAccess {
    return Intl.message(
      'Чтобы восстановить доступ\nк своему аккаунту',
      name: 'toRecoveryAccess',
      desc: '',
      args: [],
    );
  }

  /// `Восстановить доступ`
  String get recoveryAccess {
    return Intl.message(
      'Восстановить доступ',
      name: 'recoveryAccess',
      desc: '',
      args: [],
    );
  }

  /// `Поздравляем!`
  String get weCongratulate {
    return Intl.message(
      'Поздравляем!',
      name: 'weCongratulate',
      desc: '',
      args: [],
    );
  }

  /// `Вы успешно зарегистрировались\nв нашем приложении!!`
  String get youSuccessfullySignedUp {
    return Intl.message(
      'Вы успешно зарегистрировались\nв нашем приложении!!',
      name: 'youSuccessfullySignedUp',
      desc: '',
      args: [],
    );
  }

  /// `Правило`
  String get rule {
    return Intl.message(
      'Правило',
      name: 'rule',
      desc: '',
      args: [],
    );
  }

  /// `Принять`
  String get accept {
    return Intl.message(
      'Принять',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `ваше имя`
  String get yourName {
    return Intl.message(
      'ваше имя',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Так оно будет отображаться в Network`
  String get soWillDisplayInNetwork {
    return Intl.message(
      'Так оно будет отображаться в Network',
      name: 'soWillDisplayInNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get toContinue {
    return Intl.message(
      'Продолжить',
      name: 'toContinue',
      desc: '',
      args: [],
    );
  }

  /// `дату рождения`
  String get ofBirthDay {
    return Intl.message(
      'дату рождения',
      name: 'ofBirthDay',
      desc: '',
      args: [],
    );
  }

  /// `Вы можете скрыть свой возраст`
  String get youCanHideYourAge {
    return Intl.message(
      'Вы можете скрыть свой возраст',
      name: 'youCanHideYourAge',
      desc: '',
      args: [],
    );
  }

  /// `Скрыть возраст`
  String get hideAge {
    return Intl.message(
      'Скрыть возраст',
      name: 'hideAge',
      desc: '',
      args: [],
    );
  }

  /// `пол`
  String get sex {
    return Intl.message(
      'пол',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `Выберете`
  String get choose {
    return Intl.message(
      'Выберете',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Вы можете скрыть свой пол`
  String get youCanHideYourSex {
    return Intl.message(
      'Вы можете скрыть свой пол',
      name: 'youCanHideYourSex',
      desc: '',
      args: [],
    );
  }

  /// `Женщина`
  String get female {
    return Intl.message(
      'Женщина',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Мужчина`
  String get male {
    return Intl.message(
      'Мужчина',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Скрыть пол`
  String get hideSex {
    return Intl.message(
      'Скрыть пол',
      name: 'hideSex',
      desc: '',
      args: [],
    );
  }

  /// `Уровень`
  String get level {
    return Intl.message(
      'Уровень',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Базовый`
  String get baseLevel {
    return Intl.message(
      'Базовый',
      name: 'baseLevel',
      desc: '',
      args: [],
    );
  }

  /// `Стандартный`
  String get standartLevel {
    return Intl.message(
      'Стандартный',
      name: 'standartLevel',
      desc: '',
      args: [],
    );
  }

  /// `Премиум`
  String get premiumLevel {
    return Intl.message(
      'Премиум',
      name: 'premiumLevel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppString> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppString> load(Locale locale) => AppString.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
