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

  /// `Чтобы восстановить доступ к своему аккаунту`
  String get toRecoveryAccess {
    return Intl.message(
      'Чтобы восстановить доступ к своему аккаунту',
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
  String get base {
    return Intl.message(
      'Базовый',
      name: 'base',
      desc: '',
      args: [],
    );
  }

  /// `Стандартный`
  String get standart {
    return Intl.message(
      'Стандартный',
      name: 'standart',
      desc: '',
      args: [],
    );
  }

  /// `Премиум`
  String get premium {
    return Intl.message(
      'Премиум',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `Выберете интересы`
  String get chooseInterests {
    return Intl.message(
      'Выберете интересы',
      name: 'chooseInterests',
      desc: '',
      args: [],
    );
  }

  /// `интересы`
  String get interests {
    return Intl.message(
      'интересы',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Пропустить`
  String get skip {
    return Intl.message(
      'Пропустить',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get toAdd {
    return Intl.message(
      'Добавить',
      name: 'toAdd',
      desc: '',
      args: [],
    );
  }

  /// `Выберете статус`
  String get chooseStatus {
    return Intl.message(
      'Выберете статус',
      name: 'chooseStatus',
      desc: '',
      args: [],
    );
  }

  /// `статус`
  String get status {
    return Intl.message(
      'статус',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Статус будет отображаться в вашем профиле`
  String get statusWillShowenInYourProfile {
    return Intl.message(
      'Статус будет отображаться в вашем профиле',
      name: 'statusWillShowenInYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Ввести свой статус`
  String get inputOwnStatus {
    return Intl.message(
      'Ввести свой статус',
      name: 'inputOwnStatus',
      desc: '',
      args: [],
    );
  }

  /// `Введите свой`
  String get inputOwn {
    return Intl.message(
      'Введите свой',
      name: 'inputOwn',
      desc: '',
      args: [],
    );
  }

  /// `сферу деятельности`
  String get ofOccupation {
    return Intl.message(
      'сферу деятельности',
      name: 'ofOccupation',
      desc: '',
      args: [],
    );
  }

  /// `Сфера деятельности будет отображаться в вашем профиле`
  String get occupationsWillBeShowedInProfile {
    return Intl.message(
      'Сфера деятельности будет отображаться в вашем профиле',
      name: 'occupationsWillBeShowedInProfile',
      desc: '',
      args: [],
    );
  }

  /// `Вы можете выбрать`
  String get youCanChoose {
    return Intl.message(
      'Вы можете выбрать',
      name: 'youCanChoose',
      desc: '',
      args: [],
    );
  }

  /// `варианта`
  String get ofOptions {
    return Intl.message(
      'варианта',
      name: 'ofOptions',
      desc: '',
      args: [],
    );
  }

  /// `Ввести свой вариант`
  String get inputOwnOption {
    return Intl.message(
      'Ввести свой вариант',
      name: 'inputOwnOption',
      desc: '',
      args: [],
    );
  }

  /// `свой вариант`
  String get ownOption {
    return Intl.message(
      'свой вариант',
      name: 'ownOption',
      desc: '',
      args: [],
    );
  }

  /// `Расскажите`
  String get tell {
    return Intl.message(
      'Расскажите',
      name: 'tell',
      desc: '',
      args: [],
    );
  }

  /// `о вас`
  String get aboutYou {
    return Intl.message(
      'о вас',
      name: 'aboutYou',
      desc: '',
      args: [],
    );
  }

  /// `Это информация будет отображаться в вашем профиле`
  String get thisInfoWillBeShowedInProfile {
    return Intl.message(
      'Это информация будет отображаться в вашем профиле',
      name: 'thisInfoWillBeShowedInProfile',
      desc: '',
      args: [],
    );
  }

  /// `Включите`
  String get turnOn {
    return Intl.message(
      'Включите',
      name: 'turnOn',
      desc: '',
      args: [],
    );
  }

  /// `геолокацию`
  String get ofGeolocation {
    return Intl.message(
      'геолокацию',
      name: 'ofGeolocation',
      desc: '',
      args: [],
    );
  }

  /// `Знакомьтесь и встречайтесь\nс людьми рядом с вами`
  String get metPeopleNear {
    return Intl.message(
      'Знакомьтесь и встречайтесь\nс людьми рядом с вами',
      name: 'metPeopleNear',
      desc: '',
      args: [],
    );
  }

  /// `Ваше местоположение будет использовано для показа потенциальных партнеров для встреч`
  String get yourLocationWillBeUsed {
    return Intl.message(
      'Ваше местоположение будет использовано для показа потенциальных партнеров для встреч',
      name: 'yourLocationWillBeUsed',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Шкаф`
  String get cupboard {
    return Intl.message(
      'Шкаф',
      name: 'cupboard',
      desc: '',
      args: [],
    );
  }

  /// `Друзья`
  String get friends {
    return Intl.message(
      'Друзья',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `Готов к встрече`
  String get readyToMeet {
    return Intl.message(
      'Готов к встрече',
      name: 'readyToMeet',
      desc: '',
      args: [],
    );
  }

  /// `рейтинг`
  String get rating {
    return Intl.message(
      'рейтинг',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Базовый уровень`
  String get baseLevel {
    return Intl.message(
      'Базовый уровень',
      name: 'baseLevel',
      desc: '',
      args: [],
    );
  }

  /// `баллов`
  String get ofPoints {
    return Intl.message(
      'баллов',
      name: 'ofPoints',
      desc: '',
      args: [],
    );
  }

  /// `встречи`
  String get meets {
    return Intl.message(
      'встречи',
      name: 'meets',
      desc: '',
      args: [],
    );
  }

  /// `Аватары`
  String get avatars {
    return Intl.message(
      'Аватары',
      name: 'avatars',
      desc: '',
      args: [],
    );
  }

  /// `Редкий`
  String get rare {
    return Intl.message(
      'Редкий',
      name: 'rare',
      desc: '',
      args: [],
    );
  }

  /// `Обычный`
  String get usual {
    return Intl.message(
      'Обычный',
      name: 'usual',
      desc: '',
      args: [],
    );
  }

  /// `Головные уборы`
  String get headwears {
    return Intl.message(
      'Головные уборы',
      name: 'headwears',
      desc: '',
      args: [],
    );
  }

  /// `пустой`
  String get empty {
    return Intl.message(
      'пустой',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Посетите магазин, чтобы купить новые\nпредметы для своего персонажа`
  String get visitStoreToBuyThingsForYourCharacter {
    return Intl.message(
      'Посетите магазин, чтобы купить новые\nпредметы для своего персонажа',
      name: 'visitStoreToBuyThingsForYourCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Посетить магазин`
  String get visitStore {
    return Intl.message(
      'Посетить магазин',
      name: 'visitStore',
      desc: '',
      args: [],
    );
  }

  /// `Для вас`
  String get forYou {
    return Intl.message(
      'Для вас',
      name: 'forYou',
      desc: '',
      args: [],
    );
  }

  /// `По близости`
  String get near {
    return Intl.message(
      'По близости',
      name: 'near',
      desc: '',
      args: [],
    );
  }

  /// `Личные запросы`
  String get personalRequests {
    return Intl.message(
      'Личные запросы',
      name: 'personalRequests',
      desc: '',
      args: [],
    );
  }

  /// `Онлайн`
  String get online {
    return Intl.message(
      'Онлайн',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Обменять`
  String get exchange {
    return Intl.message(
      'Обменять',
      name: 'exchange',
      desc: '',
      args: [],
    );
  }

  /// `Встретиться`
  String get toMeet {
    return Intl.message(
      'Встретиться',
      name: 'toMeet',
      desc: '',
      args: [],
    );
  }

  /// `Токены`
  String get tokens {
    return Intl.message(
      'Токены',
      name: 'tokens',
      desc: '',
      args: [],
    );
  }

  /// `Валюта`
  String get currency {
    return Intl.message(
      'Валюта',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Кошелек`
  String get wallet {
    return Intl.message(
      'Кошелек',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Сообщения`
  String get messages {
    return Intl.message(
      'Сообщения',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Приглашения`
  String get invitations {
    return Intl.message(
      'Приглашения',
      name: 'invitations',
      desc: '',
      args: [],
    );
  }

  /// `Партнеры`
  String get partners {
    return Intl.message(
      'Партнеры',
      name: 'partners',
      desc: '',
      args: [],
    );
  }

  /// `Деловая встреча`
  String get businessMeeting {
    return Intl.message(
      'Деловая встреча',
      name: 'businessMeeting',
      desc: '',
      args: [],
    );
  }

  /// `токенов`
  String get ofTokens {
    return Intl.message(
      'токенов',
      name: 'ofTokens',
      desc: '',
      args: [],
    );
  }

  /// `Токены за встречу`
  String get tokensForMeeting {
    return Intl.message(
      'Токены за встречу',
      name: 'tokensForMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Начать чат`
  String get toStartChat {
    return Intl.message(
      'Начать чат',
      name: 'toStartChat',
      desc: '',
      args: [],
    );
  }

  /// `Уведомления`
  String get notifications {
    return Intl.message(
      'Уведомления',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Список личных запросов`
  String get listOfPersonalRequests {
    return Intl.message(
      'Список личных запросов',
      name: 'listOfPersonalRequests',
      desc: '',
      args: [],
    );
  }

  /// `Создать новый запрос`
  String get createNewRequest {
    return Intl.message(
      'Создать новый запрос',
      name: 'createNewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Созданные раннее`
  String get createdBefore {
    return Intl.message(
      'Созданные раннее',
      name: 'createdBefore',
      desc: '',
      args: [],
    );
  }

  /// `Искать`
  String get toSearch {
    return Intl.message(
      'Искать',
      name: 'toSearch',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `По интересам`
  String get byInterests {
    return Intl.message(
      'По интересам',
      name: 'byInterests',
      desc: '',
      args: [],
    );
  }

  /// `По категориям встречи`
  String get byCategoriesOfMeeting {
    return Intl.message(
      'По категориям встречи',
      name: 'byCategoriesOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Создание личного запроса`
  String get creatingOfPersonalRequest {
    return Intl.message(
      'Создание личного запроса',
      name: 'creatingOfPersonalRequest',
      desc: '',
      args: [],
    );
  }

  /// `категорию встречи`
  String get ofCategoryOfMeeting {
    return Intl.message(
      'категорию встречи',
      name: 'ofCategoryOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Кратко опишите`
  String get shortlyDescribe {
    return Intl.message(
      'Кратко опишите',
      name: 'shortlyDescribe',
      desc: '',
      args: [],
    );
  }

  /// `какую встречу вы планируете`
  String get whatMeetingAreYouPlaning {
    return Intl.message(
      'какую встречу вы планируете',
      name: 'whatMeetingAreYouPlaning',
      desc: '',
      args: [],
    );
  }

  /// `Укажите период для`
  String get pointPeriodFor {
    return Intl.message(
      'Укажите период для',
      name: 'pointPeriodFor',
      desc: '',
      args: [],
    );
  }

  /// `планирования встречи`
  String get ofPlaningMeeting {
    return Intl.message(
      'планирования встречи',
      name: 'ofPlaningMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать дату начала`
  String get chooseDateOfStart {
    return Intl.message(
      'Выбрать дату начала',
      name: 'chooseDateOfStart',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать дату окончания`
  String get chooseDateOfEnd {
    return Intl.message(
      'Выбрать дату окончания',
      name: 'chooseDateOfEnd',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте`
  String get check {
    return Intl.message(
      'Проверьте',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `все параметры встречи`
  String get allParametrsOfMeeting {
    return Intl.message(
      'все параметры встречи',
      name: 'allParametrsOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Категория встречи`
  String get categoryOfMeeting {
    return Intl.message(
      'Категория встречи',
      name: 'categoryOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Описание встречи`
  String get descriptionOfMeeting {
    return Intl.message(
      'Описание встречи',
      name: 'descriptionOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Сфера деятельности`
  String get occupation {
    return Intl.message(
      'Сфера деятельности',
      name: 'occupation',
      desc: '',
      args: [],
    );
  }

  /// `Интересы`
  String get interestsTitle {
    return Intl.message(
      'Интересы',
      name: 'interestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Создать запрос`
  String get createRequest {
    return Intl.message(
      'Создать запрос',
      name: 'createRequest',
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
