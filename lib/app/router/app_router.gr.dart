// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i59;
import 'package:flutter/material.dart' as _i60;
import 'package:network_app/app/core/models/clothe_model.dart' as _i64;
import 'package:network_app/app/core/models/meeting_model.dart' as _i61;
import 'package:network_app/app/core/models/user_model.dart' as _i62;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart'
    as _i6;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_email/login_email_view.dart'
    as _i8;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_view.dart'
    as _i7;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_view.dart'
    as _i10;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_view.dart'
    as _i9;
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_view.dart'
    as _i11;
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_view.dart'
    as _i12;
import 'package:network_app/ui/pages/auth_pages/start/start_view.dart' as _i1;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_birth_date_view.dart'
    as _i16;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_view.dart'
    as _i18;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_occupation/choose_occupation_view.dart'
    as _i21;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex_view.dart'
    as _i17;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status_view.dart'
    as _i19;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/geolocation/geolocation_turn_on_view.dart'
    as _i24;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_about_you/input_about_you_view.dart'
    as _i23;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_view.dart'
    as _i15;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_occupation/input_occupation_view.dart'
    as _i22;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_status/input_status_view.dart'
    as _i20;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/reg_success/reg_succes_view.dart'
    as _i14;
import 'package:network_app/ui/pages/blockchain/connect_metamask_view.dart'
    as _i5;
import 'package:network_app/ui/pages/blockchain/contract_test_view.dart' as _i4;
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_view.dart'
    as _i25;
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_view.dart'
    as _i29;
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_view.dart'
    as _i26;
import 'package:network_app/ui/pages/home_pages/home_store/home_store_view.dart'
    as _i28;
import 'package:network_app/ui/pages/home_pages/home_view.dart' as _i13;
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_view.dart'
    as _i27;
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/check_meeting_parameters/check_meeting_parameters_view.dart'
    as _i40;
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_date/choose_meeting_date_view.dart'
    as _i39;
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_person/choose_meeting_person_view.dart'
    as _i37;
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_type/choose_meeting_type_view.dart'
    as _i36;
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/input_meeting_description/input_meeting_description_view.dart'
    as _i38;
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meeting_invitations_view.dart'
    as _i33;
import 'package:network_app/ui/pages/meeting_pages/meeting_invite_details/meeting_invite_details_view.dart'
    as _i30;
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_view.dart'
    as _i34;
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/meeting_notifications_view.dart'
    as _i32;
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/meeting_requests_list_view.dart'
    as _i35;
import 'package:network_app/ui/pages/meeting_pages/meeting_search/meeting_search_view.dart'
    as _i31;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_view.dart'
    as _i43;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers_success/meeting_answers_success_view.dart'
    as _i44;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_complaint/meeting_complaint_view.dart'
    as _i45;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_view.dart'
    as _i42;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_first/meeting_rate_fisrt_view.dart'
    as _i46;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/meeting_rate_second_view.dart'
    as _i47;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_view.dart'
    as _i41;
import 'package:network_app/ui/pages/messages_pages/chat_personal/chat_personal_view.dart'
    as _i56;
import 'package:network_app/ui/pages/profile_pages/choose_categories/choose_categories_view.dart'
    as _i50;
import 'package:network_app/ui/pages/profile_pages/edit_field/edit_field_view.dart'
    as _i49;
import 'package:network_app/ui/pages/profile_pages/orders/orders_view.dart'
    as _i51;
import 'package:network_app/ui/pages/profile_pages/person_profile/person_profile_view.dart'
    as _i48;
import 'package:network_app/ui/pages/settings_pages/avatar_edit/avatar_edit_view.dart'
    as _i58;
import 'package:network_app/ui/pages/settings_pages/settings_main/settings_main_view.dart'
    as _i57;
import 'package:network_app/ui/pages/store_pages/store_category/store_category_view.dart'
    as _i54;
import 'package:network_app/ui/pages/store_pages/store_product/store_product_view.dart'
    as _i55;
import 'package:network_app/ui/pages/wallet_pages/pages/create_or_import.dart'
    as _i3;
import 'package:network_app/ui/pages/wallet_pages/pages/wallet_login_page.dart'
    as _i2;
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart'
    as _i52;
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange_success/wallet_exchange_success_view.dart'
    as _i53;
import 'package:network_app/utils/main_pages/main_enums.dart' as _i63;

class AppRouter extends _i59.RootStackRouter {
  AppRouter([_i60.GlobalKey<_i60.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i59.PageFactory> pagesMap = {
    StartViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartView(),
      );
    },
    WalletLoginPageRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WalletLoginPage(),
      );
    },
    WalletCreateOrImportPageRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.WalletCreateOrImportPage(),
      );
    },
    ContractTestViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ContractTestView(),
      );
    },
    ConnectMetamaskViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ConnectMetamaskView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginView(),
      );
    },
    LoginMultipleViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginMultipleView(),
      );
    },
    LoginEmailViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginEmailView(),
      );
    },
    InputPhoneViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.InputPhoneView(),
      );
    },
    InputOtpViewRoute.name: (routeData) {
      final args = routeData.argsAs<InputOtpViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.InputOtpView(
          key: args.key,
          strPhone: args.strPhone,
        ),
      );
    },
    RecoveryViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.RecoveryView(),
      );
    },
    RecoveryEmailViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.RecoveryEmailView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeViewRouteArgs>(
          orElse: () => const HomeViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.HomeView(
          key: args.key,
          initIndex: args.initIndex,
          isCupboard: args.isCupboard,
        ),
      );
    },
    RegSuccessViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.RegSuccessView(),
      );
    },
    InputNameViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.InputNameView(),
      );
    },
    ChooseBirthDateViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseBirthDateViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.ChooseBirthDateView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    ChooseSexViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.ChooseSexView(),
      );
    },
    ChooseLevelViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ChooseLevelView(),
      );
    },
    ChooseStatusViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseStatusViewRouteArgs>(
          orElse: () => const ChooseStatusViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i19.ChooseStatusView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    InputStatusViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.InputStatusView(),
      );
    },
    ChooseOccupationViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseOccupationViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i21.ChooseOccupationView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    InputOccupationViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.InputOccupationView(),
      );
    },
    InputAboutYouViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.InputAboutYouView(),
      );
    },
    GeolocationTurnOnViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.GeolocationTurnOnView(),
      );
    },
    HomeMeetingViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i25.HomeMeetingView(),
      );
    },
    HomeProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeProfileViewRouteArgs>(
          orElse: () => const HomeProfileViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.HomeProfileView(
          key: args.key,
          isCupboardInit: args.isCupboardInit,
        ),
      );
    },
    HomeWalletViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i27.HomeWalletView(),
      );
    },
    HomeStoreViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeStoreViewRouteArgs>(
          orElse: () => const HomeStoreViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i28.HomeStoreView(
          key: args.key,
          isPartnerCupboard: args.isPartnerCupboard,
        ),
      );
    },
    HomeMessagesViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.HomeMessagesView(),
      );
    },
    MeetingInviteDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingInviteDetailsViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i30.MeetingInviteDetailsView(
          key: args.key,
          meetingModel: args.meetingModel,
          isInvitation: args.isInvitation,
        ),
      );
    },
    MeetingSearchViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingSearchViewRouteArgs>(
          orElse: () => const MeetingSearchViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.MeetingSearchView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    MeetingNotificationsViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i32.MeetingNotificationsView(),
      );
    },
    MeetingInvitationsViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.MeetingInvitationsView(),
      );
    },
    MeetingMatchingViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingMatchingViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i34.MeetingMatchingView(
          key: args.key,
          meetingModel: args.meetingModel,
          creatorModel: args.creatorModel,
          partnerModel: args.partnerModel,
        ),
      );
    },
    MeetingRequestsListViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i35.MeetingRequestsListView(),
      );
    },
    ChooseMeetingTypeViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseMeetingTypeViewRouteArgs>(
          orElse: () => const ChooseMeetingTypeViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i36.ChooseMeetingTypeView(
          key: args.key,
          partnerModel: args.partnerModel,
        ),
      );
    },
    ChooseMeetingPersonViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i37.ChooseMeetingPersonView(),
      );
    },
    InputDescriptionMeetingViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i38.InputDescriptionMeetingView(),
      );
    },
    ChooseMeetingDateViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i39.ChooseMeetingDateView(),
      );
    },
    CheckMeetingParametersViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i40.CheckMeetingParametersView(),
      );
    },
    MeetingTimerViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingTimerViewRouteArgs>(
          orElse: () => const MeetingTimerViewRouteArgs());
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i41.MeetingTimerView(
          key: args.key,
          isTimer: args.isTimer,
          meetingID: args.meetingID,
        ),
      );
    },
    MeetingQuestionsViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingQuestionsViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i42.MeetingQuestionsView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingAnswersViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingAnswersViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i43.MeetingAnswersView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingAnswersSuccessViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingAnswersSuccessViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i44.MeetingAnswersSuccessView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingComplaintViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i45.MeetingComplaintView(),
      );
    },
    MeetingRateFirstViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingRateFirstViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i46.MeetingRateFirstView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingRateSecondViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingRateSecondViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i47.MeetingRateSecondView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    PersonProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<PersonProfileViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i48.PersonProfileView(
          key: args.key,
          partnerModel: args.partnerModel,
        ),
      );
    },
    EditFieldViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditFieldViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i49.EditFieldView(
          key: args.key,
          text1: args.text1,
          text2: args.text2,
          description: args.description,
          keyName: args.keyName,
        ),
      );
    },
    ChooseCategoriesViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseCategoriesViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i50.ChooseCategoriesView(
          key: args.key,
          isAuth: args.isAuth,
          keyName: args.keyName,
          isMeeting: args.isMeeting,
        ),
      );
    },
    OrdersViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i51.OrdersView(),
      );
    },
    WalletExchangeViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i52.WalletExchangeView(),
      );
    },
    WalletExchangeSuccessViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i53.WalletExchangeSuccessView(),
      );
    },
    StoreCategoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoreCategoryViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i54.StoreCategoryView(
          key: args.key,
          productType: args.productType,
          isCupboard: args.isCupboard,
        ),
      );
    },
    StoreProductViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoreProductViewRouteArgs>();
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i55.StoreProductView(
          key: args.key,
          clotheModel: args.clotheModel,
        ),
      );
    },
    ChatPersonalViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i56.ChatPersonalView(),
      );
    },
    SettingsMainViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i57.SettingsMainView(),
      );
    },
    AvatarEditViewRoute.name: (routeData) {
      return _i59.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i58.AvatarEditView(),
      );
    },
  };

  @override
  List<_i59.RouteConfig> get routes => [
        _i59.RouteConfig(
          StartViewRoute.name,
          path: '/',
        ),
        _i59.RouteConfig(
          WalletLoginPageRoute.name,
          path: '/wallet-login-page',
        ),
        _i59.RouteConfig(
          WalletCreateOrImportPageRoute.name,
          path: '/wallet-create-or-import-page',
        ),
        _i59.RouteConfig(
          ContractTestViewRoute.name,
          path: '/contract-test-view',
        ),
        _i59.RouteConfig(
          ConnectMetamaskViewRoute.name,
          path: '/connect-metamask-view',
        ),
        _i59.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
        _i59.RouteConfig(
          LoginMultipleViewRoute.name,
          path: '/login-multiple-view',
        ),
        _i59.RouteConfig(
          LoginEmailViewRoute.name,
          path: '/login-email-view',
        ),
        _i59.RouteConfig(
          InputPhoneViewRoute.name,
          path: '/input-phone-view',
        ),
        _i59.RouteConfig(
          InputOtpViewRoute.name,
          path: '/input-otp-view',
        ),
        _i59.RouteConfig(
          RecoveryViewRoute.name,
          path: '/recovery-view',
        ),
        _i59.RouteConfig(
          RecoveryEmailViewRoute.name,
          path: '/recovery-email-view',
        ),
        _i59.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i59.RouteConfig(
          RegSuccessViewRoute.name,
          path: '/reg-success-view',
        ),
        _i59.RouteConfig(
          InputNameViewRoute.name,
          path: '/input-name-view',
        ),
        _i59.RouteConfig(
          ChooseBirthDateViewRoute.name,
          path: '/choose-birth-date-view',
        ),
        _i59.RouteConfig(
          ChooseSexViewRoute.name,
          path: '/choose-sex-view',
        ),
        _i59.RouteConfig(
          ChooseLevelViewRoute.name,
          path: '/choose-level-view',
        ),
        _i59.RouteConfig(
          ChooseStatusViewRoute.name,
          path: '/choose-status-view',
        ),
        _i59.RouteConfig(
          InputStatusViewRoute.name,
          path: '/input-status-view',
        ),
        _i59.RouteConfig(
          ChooseOccupationViewRoute.name,
          path: '/choose-occupation-view',
        ),
        _i59.RouteConfig(
          InputOccupationViewRoute.name,
          path: '/input-occupation-view',
        ),
        _i59.RouteConfig(
          InputAboutYouViewRoute.name,
          path: '/input-about-you-view',
        ),
        _i59.RouteConfig(
          GeolocationTurnOnViewRoute.name,
          path: '/geolocation-turn-on-view',
        ),
        _i59.RouteConfig(
          HomeMeetingViewRoute.name,
          path: '/home-meeting-view',
        ),
        _i59.RouteConfig(
          HomeProfileViewRoute.name,
          path: '/home-profile-view',
        ),
        _i59.RouteConfig(
          HomeWalletViewRoute.name,
          path: '/home-wallet-view',
        ),
        _i59.RouteConfig(
          HomeStoreViewRoute.name,
          path: '/home-store-view',
        ),
        _i59.RouteConfig(
          HomeMessagesViewRoute.name,
          path: '/home-messages-view',
        ),
        _i59.RouteConfig(
          MeetingInviteDetailsViewRoute.name,
          path: '/meeting-invite-details-view',
        ),
        _i59.RouteConfig(
          MeetingSearchViewRoute.name,
          path: '/meeting-search-view',
        ),
        _i59.RouteConfig(
          MeetingNotificationsViewRoute.name,
          path: '/meeting-notifications-view',
        ),
        _i59.RouteConfig(
          MeetingInvitationsViewRoute.name,
          path: '/meeting-invitations-view',
        ),
        _i59.RouteConfig(
          MeetingMatchingViewRoute.name,
          path: '/meeting-matching-view',
        ),
        _i59.RouteConfig(
          MeetingRequestsListViewRoute.name,
          path: '/meeting-requests-list-view',
        ),
        _i59.RouteConfig(
          ChooseMeetingTypeViewRoute.name,
          path: '/choose-meeting-type-view',
        ),
        _i59.RouteConfig(
          ChooseMeetingPersonViewRoute.name,
          path: '/choose-meeting-person-view',
        ),
        _i59.RouteConfig(
          InputDescriptionMeetingViewRoute.name,
          path: '/input-description-meeting-view',
        ),
        _i59.RouteConfig(
          ChooseMeetingDateViewRoute.name,
          path: '/choose-meeting-date-view',
        ),
        _i59.RouteConfig(
          CheckMeetingParametersViewRoute.name,
          path: '/check-meeting-parameters-view',
        ),
        _i59.RouteConfig(
          MeetingTimerViewRoute.name,
          path: '/meeting-timer-view',
        ),
        _i59.RouteConfig(
          MeetingQuestionsViewRoute.name,
          path: '/meeting-questions-view',
        ),
        _i59.RouteConfig(
          MeetingAnswersViewRoute.name,
          path: '/meeting-answers-view',
        ),
        _i59.RouteConfig(
          MeetingAnswersSuccessViewRoute.name,
          path: '/meeting-answers-success-view',
        ),
        _i59.RouteConfig(
          MeetingComplaintViewRoute.name,
          path: '/meeting-complaint-view',
        ),
        _i59.RouteConfig(
          MeetingRateFirstViewRoute.name,
          path: '/meeting-rate-first-view',
        ),
        _i59.RouteConfig(
          MeetingRateSecondViewRoute.name,
          path: '/meeting-rate-second-view',
        ),
        _i59.RouteConfig(
          PersonProfileViewRoute.name,
          path: '/person-profile-view',
        ),
        _i59.RouteConfig(
          EditFieldViewRoute.name,
          path: '/edit-field-view',
        ),
        _i59.RouteConfig(
          ChooseCategoriesViewRoute.name,
          path: '/choose-categories-view',
        ),
        _i59.RouteConfig(
          OrdersViewRoute.name,
          path: '/orders-view',
        ),
        _i59.RouteConfig(
          WalletExchangeViewRoute.name,
          path: '/wallet-exchange-view',
        ),
        _i59.RouteConfig(
          WalletExchangeSuccessViewRoute.name,
          path: '/wallet-exchange-success-view',
        ),
        _i59.RouteConfig(
          StoreCategoryViewRoute.name,
          path: '/store-category-view',
        ),
        _i59.RouteConfig(
          StoreProductViewRoute.name,
          path: '/store-product-view',
        ),
        _i59.RouteConfig(
          ChatPersonalViewRoute.name,
          path: '/chat-personal-view',
        ),
        _i59.RouteConfig(
          SettingsMainViewRoute.name,
          path: '/settings-main-view',
        ),
        _i59.RouteConfig(
          AvatarEditViewRoute.name,
          path: '/avatar-edit-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartView]
class StartViewRoute extends _i59.PageRouteInfo<void> {
  const StartViewRoute()
      : super(
          StartViewRoute.name,
          path: '/',
        );

  static const String name = 'StartViewRoute';
}

/// generated route for
/// [_i2.WalletLoginPage]
class WalletLoginPageRoute extends _i59.PageRouteInfo<void> {
  const WalletLoginPageRoute()
      : super(
          WalletLoginPageRoute.name,
          path: '/wallet-login-page',
        );

  static const String name = 'WalletLoginPageRoute';
}

/// generated route for
/// [_i3.WalletCreateOrImportPage]
class WalletCreateOrImportPageRoute extends _i59.PageRouteInfo<void> {
  const WalletCreateOrImportPageRoute()
      : super(
          WalletCreateOrImportPageRoute.name,
          path: '/wallet-create-or-import-page',
        );

  static const String name = 'WalletCreateOrImportPageRoute';
}

/// generated route for
/// [_i4.ContractTestView]
class ContractTestViewRoute extends _i59.PageRouteInfo<void> {
  const ContractTestViewRoute()
      : super(
          ContractTestViewRoute.name,
          path: '/contract-test-view',
        );

  static const String name = 'ContractTestViewRoute';
}

/// generated route for
/// [_i5.ConnectMetamaskView]
class ConnectMetamaskViewRoute extends _i59.PageRouteInfo<void> {
  const ConnectMetamaskViewRoute()
      : super(
          ConnectMetamaskViewRoute.name,
          path: '/connect-metamask-view',
        );

  static const String name = 'ConnectMetamaskViewRoute';
}

/// generated route for
/// [_i6.LoginView]
class LoginViewRoute extends _i59.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginViewRoute';
}

/// generated route for
/// [_i7.LoginMultipleView]
class LoginMultipleViewRoute extends _i59.PageRouteInfo<void> {
  const LoginMultipleViewRoute()
      : super(
          LoginMultipleViewRoute.name,
          path: '/login-multiple-view',
        );

  static const String name = 'LoginMultipleViewRoute';
}

/// generated route for
/// [_i8.LoginEmailView]
class LoginEmailViewRoute extends _i59.PageRouteInfo<void> {
  const LoginEmailViewRoute()
      : super(
          LoginEmailViewRoute.name,
          path: '/login-email-view',
        );

  static const String name = 'LoginEmailViewRoute';
}

/// generated route for
/// [_i9.InputPhoneView]
class InputPhoneViewRoute extends _i59.PageRouteInfo<void> {
  const InputPhoneViewRoute()
      : super(
          InputPhoneViewRoute.name,
          path: '/input-phone-view',
        );

  static const String name = 'InputPhoneViewRoute';
}

/// generated route for
/// [_i10.InputOtpView]
class InputOtpViewRoute extends _i59.PageRouteInfo<InputOtpViewRouteArgs> {
  InputOtpViewRoute({
    _i60.Key? key,
    required String strPhone,
  }) : super(
          InputOtpViewRoute.name,
          path: '/input-otp-view',
          args: InputOtpViewRouteArgs(
            key: key,
            strPhone: strPhone,
          ),
        );

  static const String name = 'InputOtpViewRoute';
}

class InputOtpViewRouteArgs {
  const InputOtpViewRouteArgs({
    this.key,
    required this.strPhone,
  });

  final _i60.Key? key;

  final String strPhone;

  @override
  String toString() {
    return 'InputOtpViewRouteArgs{key: $key, strPhone: $strPhone}';
  }
}

/// generated route for
/// [_i11.RecoveryView]
class RecoveryViewRoute extends _i59.PageRouteInfo<void> {
  const RecoveryViewRoute()
      : super(
          RecoveryViewRoute.name,
          path: '/recovery-view',
        );

  static const String name = 'RecoveryViewRoute';
}

/// generated route for
/// [_i12.RecoveryEmailView]
class RecoveryEmailViewRoute extends _i59.PageRouteInfo<void> {
  const RecoveryEmailViewRoute()
      : super(
          RecoveryEmailViewRoute.name,
          path: '/recovery-email-view',
        );

  static const String name = 'RecoveryEmailViewRoute';
}

/// generated route for
/// [_i13.HomeView]
class HomeViewRoute extends _i59.PageRouteInfo<HomeViewRouteArgs> {
  HomeViewRoute({
    _i60.Key? key,
    int initIndex = 0,
    bool isCupboard = false,
  }) : super(
          HomeViewRoute.name,
          path: '/home-view',
          args: HomeViewRouteArgs(
            key: key,
            initIndex: initIndex,
            isCupboard: isCupboard,
          ),
        );

  static const String name = 'HomeViewRoute';
}

class HomeViewRouteArgs {
  const HomeViewRouteArgs({
    this.key,
    this.initIndex = 0,
    this.isCupboard = false,
  });

  final _i60.Key? key;

  final int initIndex;

  final bool isCupboard;

  @override
  String toString() {
    return 'HomeViewRouteArgs{key: $key, initIndex: $initIndex, isCupboard: $isCupboard}';
  }
}

/// generated route for
/// [_i14.RegSuccessView]
class RegSuccessViewRoute extends _i59.PageRouteInfo<void> {
  const RegSuccessViewRoute()
      : super(
          RegSuccessViewRoute.name,
          path: '/reg-success-view',
        );

  static const String name = 'RegSuccessViewRoute';
}

/// generated route for
/// [_i15.InputNameView]
class InputNameViewRoute extends _i59.PageRouteInfo<void> {
  const InputNameViewRoute()
      : super(
          InputNameViewRoute.name,
          path: '/input-name-view',
        );

  static const String name = 'InputNameViewRoute';
}

/// generated route for
/// [_i16.ChooseBirthDateView]
class ChooseBirthDateViewRoute
    extends _i59.PageRouteInfo<ChooseBirthDateViewRouteArgs> {
  ChooseBirthDateViewRoute({
    _i60.Key? key,
    required bool isAuth,
  }) : super(
          ChooseBirthDateViewRoute.name,
          path: '/choose-birth-date-view',
          args: ChooseBirthDateViewRouteArgs(
            key: key,
            isAuth: isAuth,
          ),
        );

  static const String name = 'ChooseBirthDateViewRoute';
}

class ChooseBirthDateViewRouteArgs {
  const ChooseBirthDateViewRouteArgs({
    this.key,
    required this.isAuth,
  });

  final _i60.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseBirthDateViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i17.ChooseSexView]
class ChooseSexViewRoute extends _i59.PageRouteInfo<void> {
  const ChooseSexViewRoute()
      : super(
          ChooseSexViewRoute.name,
          path: '/choose-sex-view',
        );

  static const String name = 'ChooseSexViewRoute';
}

/// generated route for
/// [_i18.ChooseLevelView]
class ChooseLevelViewRoute extends _i59.PageRouteInfo<void> {
  const ChooseLevelViewRoute()
      : super(
          ChooseLevelViewRoute.name,
          path: '/choose-level-view',
        );

  static const String name = 'ChooseLevelViewRoute';
}

/// generated route for
/// [_i19.ChooseStatusView]
class ChooseStatusViewRoute
    extends _i59.PageRouteInfo<ChooseStatusViewRouteArgs> {
  ChooseStatusViewRoute({
    _i60.Key? key,
    bool isAuth = false,
  }) : super(
          ChooseStatusViewRoute.name,
          path: '/choose-status-view',
          args: ChooseStatusViewRouteArgs(
            key: key,
            isAuth: isAuth,
          ),
        );

  static const String name = 'ChooseStatusViewRoute';
}

class ChooseStatusViewRouteArgs {
  const ChooseStatusViewRouteArgs({
    this.key,
    this.isAuth = false,
  });

  final _i60.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseStatusViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i20.InputStatusView]
class InputStatusViewRoute extends _i59.PageRouteInfo<void> {
  const InputStatusViewRoute()
      : super(
          InputStatusViewRoute.name,
          path: '/input-status-view',
        );

  static const String name = 'InputStatusViewRoute';
}

/// generated route for
/// [_i21.ChooseOccupationView]
class ChooseOccupationViewRoute
    extends _i59.PageRouteInfo<ChooseOccupationViewRouteArgs> {
  ChooseOccupationViewRoute({
    _i60.Key? key,
    required bool isAuth,
  }) : super(
          ChooseOccupationViewRoute.name,
          path: '/choose-occupation-view',
          args: ChooseOccupationViewRouteArgs(
            key: key,
            isAuth: isAuth,
          ),
        );

  static const String name = 'ChooseOccupationViewRoute';
}

class ChooseOccupationViewRouteArgs {
  const ChooseOccupationViewRouteArgs({
    this.key,
    required this.isAuth,
  });

  final _i60.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseOccupationViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i22.InputOccupationView]
class InputOccupationViewRoute extends _i59.PageRouteInfo<void> {
  const InputOccupationViewRoute()
      : super(
          InputOccupationViewRoute.name,
          path: '/input-occupation-view',
        );

  static const String name = 'InputOccupationViewRoute';
}

/// generated route for
/// [_i23.InputAboutYouView]
class InputAboutYouViewRoute extends _i59.PageRouteInfo<void> {
  const InputAboutYouViewRoute()
      : super(
          InputAboutYouViewRoute.name,
          path: '/input-about-you-view',
        );

  static const String name = 'InputAboutYouViewRoute';
}

/// generated route for
/// [_i24.GeolocationTurnOnView]
class GeolocationTurnOnViewRoute extends _i59.PageRouteInfo<void> {
  const GeolocationTurnOnViewRoute()
      : super(
          GeolocationTurnOnViewRoute.name,
          path: '/geolocation-turn-on-view',
        );

  static const String name = 'GeolocationTurnOnViewRoute';
}

/// generated route for
/// [_i25.HomeMeetingView]
class HomeMeetingViewRoute extends _i59.PageRouteInfo<void> {
  const HomeMeetingViewRoute()
      : super(
          HomeMeetingViewRoute.name,
          path: '/home-meeting-view',
        );

  static const String name = 'HomeMeetingViewRoute';
}

/// generated route for
/// [_i26.HomeProfileView]
class HomeProfileViewRoute
    extends _i59.PageRouteInfo<HomeProfileViewRouteArgs> {
  HomeProfileViewRoute({
    _i60.Key? key,
    bool isCupboardInit = false,
  }) : super(
          HomeProfileViewRoute.name,
          path: '/home-profile-view',
          args: HomeProfileViewRouteArgs(
            key: key,
            isCupboardInit: isCupboardInit,
          ),
        );

  static const String name = 'HomeProfileViewRoute';
}

class HomeProfileViewRouteArgs {
  const HomeProfileViewRouteArgs({
    this.key,
    this.isCupboardInit = false,
  });

  final _i60.Key? key;

  final bool isCupboardInit;

  @override
  String toString() {
    return 'HomeProfileViewRouteArgs{key: $key, isCupboardInit: $isCupboardInit}';
  }
}

/// generated route for
/// [_i27.HomeWalletView]
class HomeWalletViewRoute extends _i59.PageRouteInfo<void> {
  const HomeWalletViewRoute()
      : super(
          HomeWalletViewRoute.name,
          path: '/home-wallet-view',
        );

  static const String name = 'HomeWalletViewRoute';
}

/// generated route for
/// [_i28.HomeStoreView]
class HomeStoreViewRoute extends _i59.PageRouteInfo<HomeStoreViewRouteArgs> {
  HomeStoreViewRoute({
    _i60.Key? key,
    bool isPartnerCupboard = false,
  }) : super(
          HomeStoreViewRoute.name,
          path: '/home-store-view',
          args: HomeStoreViewRouteArgs(
            key: key,
            isPartnerCupboard: isPartnerCupboard,
          ),
        );

  static const String name = 'HomeStoreViewRoute';
}

class HomeStoreViewRouteArgs {
  const HomeStoreViewRouteArgs({
    this.key,
    this.isPartnerCupboard = false,
  });

  final _i60.Key? key;

  final bool isPartnerCupboard;

  @override
  String toString() {
    return 'HomeStoreViewRouteArgs{key: $key, isPartnerCupboard: $isPartnerCupboard}';
  }
}

/// generated route for
/// [_i29.HomeMessagesView]
class HomeMessagesViewRoute extends _i59.PageRouteInfo<void> {
  const HomeMessagesViewRoute()
      : super(
          HomeMessagesViewRoute.name,
          path: '/home-messages-view',
        );

  static const String name = 'HomeMessagesViewRoute';
}

/// generated route for
/// [_i30.MeetingInviteDetailsView]
class MeetingInviteDetailsViewRoute
    extends _i59.PageRouteInfo<MeetingInviteDetailsViewRouteArgs> {
  MeetingInviteDetailsViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
    required bool isInvitation,
  }) : super(
          MeetingInviteDetailsViewRoute.name,
          path: '/meeting-invite-details-view',
          args: MeetingInviteDetailsViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
            isInvitation: isInvitation,
          ),
        );

  static const String name = 'MeetingInviteDetailsViewRoute';
}

class MeetingInviteDetailsViewRouteArgs {
  const MeetingInviteDetailsViewRouteArgs({
    this.key,
    required this.meetingModel,
    required this.isInvitation,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  final bool isInvitation;

  @override
  String toString() {
    return 'MeetingInviteDetailsViewRouteArgs{key: $key, meetingModel: $meetingModel, isInvitation: $isInvitation}';
  }
}

/// generated route for
/// [_i31.MeetingSearchView]
class MeetingSearchViewRoute
    extends _i59.PageRouteInfo<MeetingSearchViewRouteArgs> {
  MeetingSearchViewRoute({
    _i60.Key? key,
    bool isAuth = false,
  }) : super(
          MeetingSearchViewRoute.name,
          path: '/meeting-search-view',
          args: MeetingSearchViewRouteArgs(
            key: key,
            isAuth: isAuth,
          ),
        );

  static const String name = 'MeetingSearchViewRoute';
}

class MeetingSearchViewRouteArgs {
  const MeetingSearchViewRouteArgs({
    this.key,
    this.isAuth = false,
  });

  final _i60.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'MeetingSearchViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i32.MeetingNotificationsView]
class MeetingNotificationsViewRoute extends _i59.PageRouteInfo<void> {
  const MeetingNotificationsViewRoute()
      : super(
          MeetingNotificationsViewRoute.name,
          path: '/meeting-notifications-view',
        );

  static const String name = 'MeetingNotificationsViewRoute';
}

/// generated route for
/// [_i33.MeetingInvitationsView]
class MeetingInvitationsViewRoute extends _i59.PageRouteInfo<void> {
  const MeetingInvitationsViewRoute()
      : super(
          MeetingInvitationsViewRoute.name,
          path: '/meeting-invitations-view',
        );

  static const String name = 'MeetingInvitationsViewRoute';
}

/// generated route for
/// [_i34.MeetingMatchingView]
class MeetingMatchingViewRoute
    extends _i59.PageRouteInfo<MeetingMatchingViewRouteArgs> {
  MeetingMatchingViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
    required _i62.UserModel creatorModel,
    required _i62.UserModel partnerModel,
  }) : super(
          MeetingMatchingViewRoute.name,
          path: '/meeting-matching-view',
          args: MeetingMatchingViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
            creatorModel: creatorModel,
            partnerModel: partnerModel,
          ),
        );

  static const String name = 'MeetingMatchingViewRoute';
}

class MeetingMatchingViewRouteArgs {
  const MeetingMatchingViewRouteArgs({
    this.key,
    required this.meetingModel,
    required this.creatorModel,
    required this.partnerModel,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  final _i62.UserModel creatorModel;

  final _i62.UserModel partnerModel;

  @override
  String toString() {
    return 'MeetingMatchingViewRouteArgs{key: $key, meetingModel: $meetingModel, creatorModel: $creatorModel, partnerModel: $partnerModel}';
  }
}

/// generated route for
/// [_i35.MeetingRequestsListView]
class MeetingRequestsListViewRoute extends _i59.PageRouteInfo<void> {
  const MeetingRequestsListViewRoute()
      : super(
          MeetingRequestsListViewRoute.name,
          path: '/meeting-requests-list-view',
        );

  static const String name = 'MeetingRequestsListViewRoute';
}

/// generated route for
/// [_i36.ChooseMeetingTypeView]
class ChooseMeetingTypeViewRoute
    extends _i59.PageRouteInfo<ChooseMeetingTypeViewRouteArgs> {
  ChooseMeetingTypeViewRoute({
    _i60.Key? key,
    _i62.UserModel? partnerModel,
  }) : super(
          ChooseMeetingTypeViewRoute.name,
          path: '/choose-meeting-type-view',
          args: ChooseMeetingTypeViewRouteArgs(
            key: key,
            partnerModel: partnerModel,
          ),
        );

  static const String name = 'ChooseMeetingTypeViewRoute';
}

class ChooseMeetingTypeViewRouteArgs {
  const ChooseMeetingTypeViewRouteArgs({
    this.key,
    this.partnerModel,
  });

  final _i60.Key? key;

  final _i62.UserModel? partnerModel;

  @override
  String toString() {
    return 'ChooseMeetingTypeViewRouteArgs{key: $key, partnerModel: $partnerModel}';
  }
}

/// generated route for
/// [_i37.ChooseMeetingPersonView]
class ChooseMeetingPersonViewRoute extends _i59.PageRouteInfo<void> {
  const ChooseMeetingPersonViewRoute()
      : super(
          ChooseMeetingPersonViewRoute.name,
          path: '/choose-meeting-person-view',
        );

  static const String name = 'ChooseMeetingPersonViewRoute';
}

/// generated route for
/// [_i38.InputDescriptionMeetingView]
class InputDescriptionMeetingViewRoute extends _i59.PageRouteInfo<void> {
  const InputDescriptionMeetingViewRoute()
      : super(
          InputDescriptionMeetingViewRoute.name,
          path: '/input-description-meeting-view',
        );

  static const String name = 'InputDescriptionMeetingViewRoute';
}

/// generated route for
/// [_i39.ChooseMeetingDateView]
class ChooseMeetingDateViewRoute extends _i59.PageRouteInfo<void> {
  const ChooseMeetingDateViewRoute()
      : super(
          ChooseMeetingDateViewRoute.name,
          path: '/choose-meeting-date-view',
        );

  static const String name = 'ChooseMeetingDateViewRoute';
}

/// generated route for
/// [_i40.CheckMeetingParametersView]
class CheckMeetingParametersViewRoute extends _i59.PageRouteInfo<void> {
  const CheckMeetingParametersViewRoute()
      : super(
          CheckMeetingParametersViewRoute.name,
          path: '/check-meeting-parameters-view',
        );

  static const String name = 'CheckMeetingParametersViewRoute';
}

/// generated route for
/// [_i41.MeetingTimerView]
class MeetingTimerViewRoute
    extends _i59.PageRouteInfo<MeetingTimerViewRouteArgs> {
  MeetingTimerViewRoute({
    _i60.Key? key,
    bool isTimer = false,
    int meetingID = 0,
  }) : super(
          MeetingTimerViewRoute.name,
          path: '/meeting-timer-view',
          args: MeetingTimerViewRouteArgs(
            key: key,
            isTimer: isTimer,
            meetingID: meetingID,
          ),
        );

  static const String name = 'MeetingTimerViewRoute';
}

class MeetingTimerViewRouteArgs {
  const MeetingTimerViewRouteArgs({
    this.key,
    this.isTimer = false,
    this.meetingID = 0,
  });

  final _i60.Key? key;

  final bool isTimer;

  final int meetingID;

  @override
  String toString() {
    return 'MeetingTimerViewRouteArgs{key: $key, isTimer: $isTimer, meetingID: $meetingID}';
  }
}

/// generated route for
/// [_i42.MeetingQuestionsView]
class MeetingQuestionsViewRoute
    extends _i59.PageRouteInfo<MeetingQuestionsViewRouteArgs> {
  MeetingQuestionsViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
  }) : super(
          MeetingQuestionsViewRoute.name,
          path: '/meeting-questions-view',
          args: MeetingQuestionsViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
          ),
        );

  static const String name = 'MeetingQuestionsViewRoute';
}

class MeetingQuestionsViewRouteArgs {
  const MeetingQuestionsViewRouteArgs({
    this.key,
    required this.meetingModel,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingQuestionsViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i43.MeetingAnswersView]
class MeetingAnswersViewRoute
    extends _i59.PageRouteInfo<MeetingAnswersViewRouteArgs> {
  MeetingAnswersViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
  }) : super(
          MeetingAnswersViewRoute.name,
          path: '/meeting-answers-view',
          args: MeetingAnswersViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
          ),
        );

  static const String name = 'MeetingAnswersViewRoute';
}

class MeetingAnswersViewRouteArgs {
  const MeetingAnswersViewRouteArgs({
    this.key,
    required this.meetingModel,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingAnswersViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i44.MeetingAnswersSuccessView]
class MeetingAnswersSuccessViewRoute
    extends _i59.PageRouteInfo<MeetingAnswersSuccessViewRouteArgs> {
  MeetingAnswersSuccessViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
  }) : super(
          MeetingAnswersSuccessViewRoute.name,
          path: '/meeting-answers-success-view',
          args: MeetingAnswersSuccessViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
          ),
        );

  static const String name = 'MeetingAnswersSuccessViewRoute';
}

class MeetingAnswersSuccessViewRouteArgs {
  const MeetingAnswersSuccessViewRouteArgs({
    this.key,
    required this.meetingModel,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingAnswersSuccessViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i45.MeetingComplaintView]
class MeetingComplaintViewRoute extends _i59.PageRouteInfo<void> {
  const MeetingComplaintViewRoute()
      : super(
          MeetingComplaintViewRoute.name,
          path: '/meeting-complaint-view',
        );

  static const String name = 'MeetingComplaintViewRoute';
}

/// generated route for
/// [_i46.MeetingRateFirstView]
class MeetingRateFirstViewRoute
    extends _i59.PageRouteInfo<MeetingRateFirstViewRouteArgs> {
  MeetingRateFirstViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
  }) : super(
          MeetingRateFirstViewRoute.name,
          path: '/meeting-rate-first-view',
          args: MeetingRateFirstViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
          ),
        );

  static const String name = 'MeetingRateFirstViewRoute';
}

class MeetingRateFirstViewRouteArgs {
  const MeetingRateFirstViewRouteArgs({
    this.key,
    required this.meetingModel,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingRateFirstViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i47.MeetingRateSecondView]
class MeetingRateSecondViewRoute
    extends _i59.PageRouteInfo<MeetingRateSecondViewRouteArgs> {
  MeetingRateSecondViewRoute({
    _i60.Key? key,
    required _i61.MeetingModel meetingModel,
  }) : super(
          MeetingRateSecondViewRoute.name,
          path: '/meeting-rate-second-view',
          args: MeetingRateSecondViewRouteArgs(
            key: key,
            meetingModel: meetingModel,
          ),
        );

  static const String name = 'MeetingRateSecondViewRoute';
}

class MeetingRateSecondViewRouteArgs {
  const MeetingRateSecondViewRouteArgs({
    this.key,
    required this.meetingModel,
  });

  final _i60.Key? key;

  final _i61.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingRateSecondViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i48.PersonProfileView]
class PersonProfileViewRoute
    extends _i59.PageRouteInfo<PersonProfileViewRouteArgs> {
  PersonProfileViewRoute({
    _i60.Key? key,
    required _i62.UserModel partnerModel,
  }) : super(
          PersonProfileViewRoute.name,
          path: '/person-profile-view',
          args: PersonProfileViewRouteArgs(
            key: key,
            partnerModel: partnerModel,
          ),
        );

  static const String name = 'PersonProfileViewRoute';
}

class PersonProfileViewRouteArgs {
  const PersonProfileViewRouteArgs({
    this.key,
    required this.partnerModel,
  });

  final _i60.Key? key;

  final _i62.UserModel partnerModel;

  @override
  String toString() {
    return 'PersonProfileViewRouteArgs{key: $key, partnerModel: $partnerModel}';
  }
}

/// generated route for
/// [_i49.EditFieldView]
class EditFieldViewRoute extends _i59.PageRouteInfo<EditFieldViewRouteArgs> {
  EditFieldViewRoute({
    _i60.Key? key,
    required String text1,
    required String text2,
    required String description,
    required String keyName,
  }) : super(
          EditFieldViewRoute.name,
          path: '/edit-field-view',
          args: EditFieldViewRouteArgs(
            key: key,
            text1: text1,
            text2: text2,
            description: description,
            keyName: keyName,
          ),
        );

  static const String name = 'EditFieldViewRoute';
}

class EditFieldViewRouteArgs {
  const EditFieldViewRouteArgs({
    this.key,
    required this.text1,
    required this.text2,
    required this.description,
    required this.keyName,
  });

  final _i60.Key? key;

  final String text1;

  final String text2;

  final String description;

  final String keyName;

  @override
  String toString() {
    return 'EditFieldViewRouteArgs{key: $key, text1: $text1, text2: $text2, description: $description, keyName: $keyName}';
  }
}

/// generated route for
/// [_i50.ChooseCategoriesView]
class ChooseCategoriesViewRoute
    extends _i59.PageRouteInfo<ChooseCategoriesViewRouteArgs> {
  ChooseCategoriesViewRoute({
    _i60.Key? key,
    required bool isAuth,
    required String keyName,
    bool isMeeting = false,
  }) : super(
          ChooseCategoriesViewRoute.name,
          path: '/choose-categories-view',
          args: ChooseCategoriesViewRouteArgs(
            key: key,
            isAuth: isAuth,
            keyName: keyName,
            isMeeting: isMeeting,
          ),
        );

  static const String name = 'ChooseCategoriesViewRoute';
}

class ChooseCategoriesViewRouteArgs {
  const ChooseCategoriesViewRouteArgs({
    this.key,
    required this.isAuth,
    required this.keyName,
    this.isMeeting = false,
  });

  final _i60.Key? key;

  final bool isAuth;

  final String keyName;

  final bool isMeeting;

  @override
  String toString() {
    return 'ChooseCategoriesViewRouteArgs{key: $key, isAuth: $isAuth, keyName: $keyName, isMeeting: $isMeeting}';
  }
}

/// generated route for
/// [_i51.OrdersView]
class OrdersViewRoute extends _i59.PageRouteInfo<void> {
  const OrdersViewRoute()
      : super(
          OrdersViewRoute.name,
          path: '/orders-view',
        );

  static const String name = 'OrdersViewRoute';
}

/// generated route for
/// [_i52.WalletExchangeView]
class WalletExchangeViewRoute extends _i59.PageRouteInfo<void> {
  const WalletExchangeViewRoute()
      : super(
          WalletExchangeViewRoute.name,
          path: '/wallet-exchange-view',
        );

  static const String name = 'WalletExchangeViewRoute';
}

/// generated route for
/// [_i53.WalletExchangeSuccessView]
class WalletExchangeSuccessViewRoute extends _i59.PageRouteInfo<void> {
  const WalletExchangeSuccessViewRoute()
      : super(
          WalletExchangeSuccessViewRoute.name,
          path: '/wallet-exchange-success-view',
        );

  static const String name = 'WalletExchangeSuccessViewRoute';
}

/// generated route for
/// [_i54.StoreCategoryView]
class StoreCategoryViewRoute
    extends _i59.PageRouteInfo<StoreCategoryViewRouteArgs> {
  StoreCategoryViewRoute({
    _i60.Key? key,
    required _i63.StoreProductType productType,
    required bool isCupboard,
  }) : super(
          StoreCategoryViewRoute.name,
          path: '/store-category-view',
          args: StoreCategoryViewRouteArgs(
            key: key,
            productType: productType,
            isCupboard: isCupboard,
          ),
        );

  static const String name = 'StoreCategoryViewRoute';
}

class StoreCategoryViewRouteArgs {
  const StoreCategoryViewRouteArgs({
    this.key,
    required this.productType,
    required this.isCupboard,
  });

  final _i60.Key? key;

  final _i63.StoreProductType productType;

  final bool isCupboard;

  @override
  String toString() {
    return 'StoreCategoryViewRouteArgs{key: $key, productType: $productType, isCupboard: $isCupboard}';
  }
}

/// generated route for
/// [_i55.StoreProductView]
class StoreProductViewRoute
    extends _i59.PageRouteInfo<StoreProductViewRouteArgs> {
  StoreProductViewRoute({
    _i60.Key? key,
    required _i64.ClotheModel clotheModel,
  }) : super(
          StoreProductViewRoute.name,
          path: '/store-product-view',
          args: StoreProductViewRouteArgs(
            key: key,
            clotheModel: clotheModel,
          ),
        );

  static const String name = 'StoreProductViewRoute';
}

class StoreProductViewRouteArgs {
  const StoreProductViewRouteArgs({
    this.key,
    required this.clotheModel,
  });

  final _i60.Key? key;

  final _i64.ClotheModel clotheModel;

  @override
  String toString() {
    return 'StoreProductViewRouteArgs{key: $key, clotheModel: $clotheModel}';
  }
}

/// generated route for
/// [_i56.ChatPersonalView]
class ChatPersonalViewRoute extends _i59.PageRouteInfo<void> {
  const ChatPersonalViewRoute()
      : super(
          ChatPersonalViewRoute.name,
          path: '/chat-personal-view',
        );

  static const String name = 'ChatPersonalViewRoute';
}

/// generated route for
/// [_i57.SettingsMainView]
class SettingsMainViewRoute extends _i59.PageRouteInfo<void> {
  const SettingsMainViewRoute()
      : super(
          SettingsMainViewRoute.name,
          path: '/settings-main-view',
        );

  static const String name = 'SettingsMainViewRoute';
}

/// generated route for
/// [_i58.AvatarEditView]
class AvatarEditViewRoute extends _i59.PageRouteInfo<void> {
  const AvatarEditViewRoute()
      : super(
          AvatarEditViewRoute.name,
          path: '/avatar-edit-view',
        );

  static const String name = 'AvatarEditViewRoute';
}
