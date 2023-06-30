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

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `The key to communication\n - is`
  String get mainThingInRelationsIs {
    return Intl.message(
      'The key to communication\n - is',
      name: 'mainThingInRelationsIs',
      desc: '',
      args: [],
    );
  }

  /// `connections`
  String get relations {
    return Intl.message(
      'connections',
      name: 'relations',
      desc: '',
      args: [],
    );
  }

  /// `Make`
  String get execute {
    return Intl.message(
      'Make',
      name: 'execute',
      desc: '',
      args: [],
    );
  }

  /// `enter`
  String get enter {
    return Intl.message(
      'enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by phone`
  String get signInByPhone {
    return Intl.message(
      'Sign in by phone',
      name: 'signInByPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by email`
  String get signInByEmail {
    return Intl.message(
      'Sign in by email',
      name: 'signInByEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by Google`
  String get signInByGoogle {
    return Intl.message(
      'Sign in by Google',
      name: 'signInByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by Facebook`
  String get signInByFacebook {
    return Intl.message(
      'Sign in by Facebook',
      name: 'signInByFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Input`
  String get input {
    return Intl.message(
      'Input',
      name: 'input',
      desc: '',
      args: [],
    );
  }

  /// `the code`
  String get code {
    return Intl.message(
      'the code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Sent to phone number`
  String get sentToPhoneNumber {
    return Intl.message(
      'Sent to phone number',
      name: 'sentToPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `your number`
  String get yourPhoneNumber {
    return Intl.message(
      'your number',
      name: 'yourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get sendCode {
    return Intl.message(
      'Send code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Recovery`
  String get recovery {
    return Intl.message(
      'Recovery',
      name: 'recovery',
      desc: '',
      args: [],
    );
  }

  /// `of account`
  String get ofAccount {
    return Intl.message(
      'of account',
      name: 'ofAccount',
      desc: '',
      args: [],
    );
  }

  /// `Input email address`
  String get inputEmailAddress {
    return Intl.message(
      'Input email address',
      name: 'inputEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Input address`
  String get inputAddress {
    return Intl.message(
      'Input address',
      name: 'inputAddress',
      desc: '',
      args: [],
    );
  }

  /// `of email`
  String get ofEmail {
    return Intl.message(
      'of email',
      name: 'ofEmail',
      desc: '',
      args: [],
    );
  }

  /// `to regain access to your account`
  String get toRecoveryAccess {
    return Intl.message(
      'to regain access to your account',
      name: 'toRecoveryAccess',
      desc: '',
      args: [],
    );
  }

  /// `restore access`
  String get recoveryAccess {
    return Intl.message(
      'restore access',
      name: 'recoveryAccess',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get weCongratulate {
    return Intl.message(
      'Congratulations!',
      name: 'weCongratulate',
      desc: '',
      args: [],
    );
  }

  /// `You successfully signed up in our app!!`
  String get youSuccessfullySignedUp {
    return Intl.message(
      'You successfully signed up in our app!!',
      name: 'youSuccessfullySignedUp',
      desc: '',
      args: [],
    );
  }

  /// `Rule`
  String get rule {
    return Intl.message(
      'Rule',
      name: 'rule',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `your name`
  String get yourName {
    return Intl.message(
      'your name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `It will be displayed in app`
  String get soWillDisplayInNetwork {
    return Intl.message(
      'It will be displayed in app',
      name: 'soWillDisplayInNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get toContinue {
    return Intl.message(
      'Continue',
      name: 'toContinue',
      desc: '',
      args: [],
    );
  }

  /// `birthday`
  String get ofBirthDay {
    return Intl.message(
      'birthday',
      name: 'ofBirthDay',
      desc: '',
      args: [],
    );
  }

  /// `You can hide your age`
  String get youCanHideYourAge {
    return Intl.message(
      'You can hide your age',
      name: 'youCanHideYourAge',
      desc: '',
      args: [],
    );
  }

  /// `Hide age`
  String get hideAge {
    return Intl.message(
      'Hide age',
      name: 'hideAge',
      desc: '',
      args: [],
    );
  }

  /// `sex`
  String get sex {
    return Intl.message(
      'sex',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `You can hide your sex`
  String get youCanHideYourSex {
    return Intl.message(
      'You can hide your sex',
      name: 'youCanHideYourSex',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Hide sex`
  String get hideSex {
    return Intl.message(
      'Hide sex',
      name: 'hideSex',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Base`
  String get base {
    return Intl.message(
      'Base',
      name: 'base',
      desc: '',
      args: [],
    );
  }

  /// `Standart`
  String get standart {
    return Intl.message(
      'Standart',
      name: 'standart',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `Choose your interests`
  String get chooseInterests {
    return Intl.message(
      'Choose your interests',
      name: 'chooseInterests',
      desc: '',
      args: [],
    );
  }

  /// `your interests`
  String get interests {
    return Intl.message(
      'your interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get toAdd {
    return Intl.message(
      'Add',
      name: 'toAdd',
      desc: '',
      args: [],
    );
  }

  /// `Choose status`
  String get chooseStatus {
    return Intl.message(
      'Choose status',
      name: 'chooseStatus',
      desc: '',
      args: [],
    );
  }

  /// `status`
  String get status {
    return Intl.message(
      'status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `The status will be displayed on your profile`
  String get statusWillShowenInYourProfile {
    return Intl.message(
      'The status will be displayed on your profile',
      name: 'statusWillShowenInYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Input your status`
  String get inputOwnStatus {
    return Intl.message(
      'Input your status',
      name: 'inputOwnStatus',
      desc: '',
      args: [],
    );
  }

  /// `Input your`
  String get inputOwn {
    return Intl.message(
      'Input your',
      name: 'inputOwn',
      desc: '',
      args: [],
    );
  }

  /// `occupation`
  String get ofOccupation {
    return Intl.message(
      'occupation',
      name: 'ofOccupation',
      desc: '',
      args: [],
    );
  }

  /// `Occupation will be displayed on your profile`
  String get occupationsWillBeShowedInProfile {
    return Intl.message(
      'Occupation will be displayed on your profile',
      name: 'occupationsWillBeShowedInProfile',
      desc: '',
      args: [],
    );
  }

  /// `You can choose`
  String get youCanChoose {
    return Intl.message(
      'You can choose',
      name: 'youCanChoose',
      desc: '',
      args: [],
    );
  }

  /// `options`
  String get ofOptions {
    return Intl.message(
      'options',
      name: 'ofOptions',
      desc: '',
      args: [],
    );
  }

  /// `Input your option`
  String get inputOwnOption {
    return Intl.message(
      'Input your option',
      name: 'inputOwnOption',
      desc: '',
      args: [],
    );
  }

  /// `your option`
  String get ownOption {
    return Intl.message(
      'your option',
      name: 'ownOption',
      desc: '',
      args: [],
    );
  }

  /// `Tell us`
  String get tell {
    return Intl.message(
      'Tell us',
      name: 'tell',
      desc: '',
      args: [],
    );
  }

  /// `about you`
  String get aboutYou {
    return Intl.message(
      'about you',
      name: 'aboutYou',
      desc: '',
      args: [],
    );
  }

  /// `This info will be displayed on your profile`
  String get thisInfoWillBeShowedInProfile {
    return Intl.message(
      'This info will be displayed on your profile',
      name: 'thisInfoWillBeShowedInProfile',
      desc: '',
      args: [],
    );
  }

  /// `Turn on`
  String get turnOn {
    return Intl.message(
      'Turn on',
      name: 'turnOn',
      desc: '',
      args: [],
    );
  }

  /// `geolocation`
  String get ofGeolocation {
    return Intl.message(
      'geolocation',
      name: 'ofGeolocation',
      desc: '',
      args: [],
    );
  }

  /// `Meet people near you`
  String get metPeopleNear {
    return Intl.message(
      'Meet people near you',
      name: 'metPeopleNear',
      desc: '',
      args: [],
    );
  }

  /// `Your location will be used to show potential meeting partners`
  String get yourLocationWillBeUsed {
    return Intl.message(
      'Your location will be used to show potential meeting partners',
      name: 'yourLocationWillBeUsed',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Cupboard`
  String get cupboard {
    return Intl.message(
      'Cupboard',
      name: 'cupboard',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `Ready to meet`
  String get readyToMeet {
    return Intl.message(
      'Ready to meet',
      name: 'readyToMeet',
      desc: '',
      args: [],
    );
  }

  /// `rating`
  String get rating {
    return Intl.message(
      'rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Base level`
  String get baseLevel {
    return Intl.message(
      'Base level',
      name: 'baseLevel',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get ofPoints {
    return Intl.message(
      'points',
      name: 'ofPoints',
      desc: '',
      args: [],
    );
  }

  /// `meetings`
  String get meets {
    return Intl.message(
      'meetings',
      name: 'meets',
      desc: '',
      args: [],
    );
  }

  /// `Avatars`
  String get avatars {
    return Intl.message(
      'Avatars',
      name: 'avatars',
      desc: '',
      args: [],
    );
  }

  /// `Rare`
  String get rare {
    return Intl.message(
      'Rare',
      name: 'rare',
      desc: '',
      args: [],
    );
  }

  /// `Usual`
  String get usual {
    return Intl.message(
      'Usual',
      name: 'usual',
      desc: '',
      args: [],
    );
  }

  /// `Headwears`
  String get headwears {
    return Intl.message(
      'Headwears',
      name: 'headwears',
      desc: '',
      args: [],
    );
  }

  /// `empty`
  String get empty {
    return Intl.message(
      'empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Visit the store to buy new\nitems for your character`
  String get visitStoreToBuyThingsForYourCharacter {
    return Intl.message(
      'Visit the store to buy new\nitems for your character',
      name: 'visitStoreToBuyThingsForYourCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Visit the store`
  String get visitStore {
    return Intl.message(
      'Visit the store',
      name: 'visitStore',
      desc: '',
      args: [],
    );
  }

  /// `For you`
  String get forYou {
    return Intl.message(
      'For you',
      name: 'forYou',
      desc: '',
      args: [],
    );
  }

  /// `Near`
  String get near {
    return Intl.message(
      'Near',
      name: 'near',
      desc: '',
      args: [],
    );
  }

  /// `Personal requests`
  String get personalRequests {
    return Intl.message(
      'Personal requests',
      name: 'personalRequests',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Exchange`
  String get exchange {
    return Intl.message(
      'Exchange',
      name: 'exchange',
      desc: '',
      args: [],
    );
  }

  /// `To meet`
  String get toMeet {
    return Intl.message(
      'To meet',
      name: 'toMeet',
      desc: '',
      args: [],
    );
  }

  /// `Tokens`
  String get tokens {
    return Intl.message(
      'Tokens',
      name: 'tokens',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Invitations`
  String get invitations {
    return Intl.message(
      'Invitations',
      name: 'invitations',
      desc: '',
      args: [],
    );
  }

  /// `Partners`
  String get partners {
    return Intl.message(
      'Partners',
      name: 'partners',
      desc: '',
      args: [],
    );
  }

  /// `Business meeting`
  String get businessMeeting {
    return Intl.message(
      'Business meeting',
      name: 'businessMeeting',
      desc: '',
      args: [],
    );
  }

  /// `tokens`
  String get ofTokens {
    return Intl.message(
      'tokens',
      name: 'ofTokens',
      desc: '',
      args: [],
    );
  }

  /// `Tokens for meeting`
  String get tokensForMeeting {
    return Intl.message(
      'Tokens for meeting',
      name: 'tokensForMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Start chat`
  String get toStartChat {
    return Intl.message(
      'Start chat',
      name: 'toStartChat',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `List of personal requests`
  String get listOfPersonalRequests {
    return Intl.message(
      'List of personal requests',
      name: 'listOfPersonalRequests',
      desc: '',
      args: [],
    );
  }

  /// `Create new request`
  String get createNewRequest {
    return Intl.message(
      'Create new request',
      name: 'createNewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Created earlier`
  String get createdBefore {
    return Intl.message(
      'Created earlier',
      name: 'createdBefore',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get toSearch {
    return Intl.message(
      'Search',
      name: 'toSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `by interests`
  String get byInterests {
    return Intl.message(
      'by interests',
      name: 'byInterests',
      desc: '',
      args: [],
    );
  }

  /// `By types of meeting`
  String get byCategoriesOfMeeting {
    return Intl.message(
      'By types of meeting',
      name: 'byCategoriesOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Create a personal request`
  String get creatingOfPersonalRequest {
    return Intl.message(
      'Create a personal request',
      name: 'creatingOfPersonalRequest',
      desc: '',
      args: [],
    );
  }

  /// `type of meeting`
  String get ofCategoryOfMeeting {
    return Intl.message(
      'type of meeting',
      name: 'ofCategoryOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Briefly describe`
  String get shortlyDescribe {
    return Intl.message(
      'Briefly describe',
      name: 'shortlyDescribe',
      desc: '',
      args: [],
    );
  }

  /// `what meeting are you planning`
  String get whatMeetingAreYouPlaning {
    return Intl.message(
      'what meeting are you planning',
      name: 'whatMeetingAreYouPlaning',
      desc: '',
      args: [],
    );
  }

  /// `Specify the period for`
  String get pointPeriodFor {
    return Intl.message(
      'Specify the period for',
      name: 'pointPeriodFor',
      desc: '',
      args: [],
    );
  }

  /// `planning of the meeting`
  String get ofPlaningMeeting {
    return Intl.message(
      'planning of the meeting',
      name: 'ofPlaningMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Choose start date`
  String get chooseDateOfStart {
    return Intl.message(
      'Choose start date',
      name: 'chooseDateOfStart',
      desc: '',
      args: [],
    );
  }

  /// `Choose end date`
  String get chooseDateOfEnd {
    return Intl.message(
      'Choose end date',
      name: 'chooseDateOfEnd',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `all the parameters of the meeting`
  String get allParametrsOfMeeting {
    return Intl.message(
      'all the parameters of the meeting',
      name: 'allParametrsOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get categoryOfMeeting {
    return Intl.message(
      'Type',
      name: 'categoryOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionOfMeeting {
    return Intl.message(
      'Description',
      name: 'descriptionOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Occupation`
  String get occupation {
    return Intl.message(
      'Occupation',
      name: 'occupation',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interestsTitle {
    return Intl.message(
      'Interests',
      name: 'interestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a request`
  String get createRequest {
    return Intl.message(
      'Create a request',
      name: 'createRequest',
      desc: '',
      args: [],
    );
  }

  /// `Standart level`
  String get standartLevel {
    return Intl.message(
      'Standart level',
      name: 'standartLevel',
      desc: '',
      args: [],
    );
  }

  /// `Write`
  String get toWrite {
    return Intl.message(
      'Write',
      name: 'toWrite',
      desc: '',
      args: [],
    );
  }

  /// `No costume`
  String get haveNotCostume {
    return Intl.message(
      'No costume',
      name: 'haveNotCostume',
      desc: '',
      args: [],
    );
  }

  /// `Meetings`
  String get meetings {
    return Intl.message(
      'Meetings',
      name: 'meetings',
      desc: '',
      args: [],
    );
  }

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message(
      'km',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get meetingCreated {
    return Intl.message(
      'Created',
      name: 'meetingCreated',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get meetingCancelled {
    return Intl.message(
      'Cancelled',
      name: 'meetingCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get meetingExpired {
    return Intl.message(
      'Expired',
      name: 'meetingExpired',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get meetingAccepted {
    return Intl.message(
      'Accepted',
      name: 'meetingAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Denied`
  String get meetingDenied {
    return Intl.message(
      'Denied',
      name: 'meetingDenied',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get meetingActive {
    return Intl.message(
      'Active',
      name: 'meetingActive',
      desc: '',
      args: [],
    );
  }

  /// `Interrupted`
  String get meetingInterrupted {
    return Intl.message(
      'Interrupted',
      name: 'meetingInterrupted',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get meetingDone {
    return Intl.message(
      'Done',
      name: 'meetingDone',
      desc: '',
      args: [],
    );
  }

  /// `Partner feedback`
  String get partner_feedback {
    return Intl.message(
      'Partner feedback',
      name: 'partner_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback`
  String get your_feedback {
    return Intl.message(
      'Your feedback',
      name: 'your_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Chatting`
  String get Chatting {
    return Intl.message(
      'Chatting',
      name: 'Chatting',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `a partner`
  String get ofPartner {
    return Intl.message(
      'a partner',
      name: 'ofPartner',
      desc: '',
      args: [],
    );
  }

  /// `Дата встречи`
  String get dateOfMeeting {
    return Intl.message(
      'Дата встречи',
      name: 'dateOfMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Партнер`
  String get partner {
    return Intl.message(
      'Партнер',
      name: 'partner',
      desc: '',
      args: [],
    );
  }

  /// `Profile photo`
  String get profilePhoto {
    return Intl.message(
      'Profile photo',
      name: 'profilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Change the photo`
  String get changeThePhoto {
    return Intl.message(
      'Change the photo',
      name: 'changeThePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Choose new photo`
  String get chooseNewPhoto {
    return Intl.message(
      'Choose new photo',
      name: 'chooseNewPhoto',
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
