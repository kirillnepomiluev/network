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
import 'package:auto_route/auto_route.dart' as _i58;
import 'package:flutter/material.dart' as _i59;
import 'package:network_app/app/core/models/meeting_model.dart' as _i60;
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart'
    as _i61;
import 'package:network_app/blockchain/connect_metamask_view.dart' as _i3;
import 'package:network_app/blockchain/contract_test_view.dart' as _i2;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart'
    as _i4;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_email/login_email_view.dart'
    as _i6;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_view.dart'
    as _i5;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_view.dart'
    as _i8;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_view.dart'
    as _i7;
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_view.dart'
    as _i9;
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_view.dart'
    as _i10;
import 'package:network_app/ui/pages/auth_pages/start/start_view.dart' as _i1;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_birth_date_view.dart'
    as _i14;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_interests/choose_interests_view.dart'
    as _i17;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_view.dart'
    as _i16;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_occupation/choose_occupation_view.dart'
    as _i20;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex_view.dart'
    as _i15;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status_view.dart'
    as _i18;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/geolocation/geolocation_turn_on_view.dart'
    as _i23;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_about_you/input_about_you_view.dart'
    as _i22;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_view.dart'
    as _i13;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_occupation/input_occupation_view.dart'
    as _i21;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_status/input_status_view.dart'
    as _i19;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/reg_success/reg_succes_view.dart'
    as _i12;
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_view.dart'
    as _i24;
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_view.dart'
    as _i28;
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_view.dart'
    as _i25;
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/orders_view.dart'
    as _i52;
import 'package:network_app/ui/pages/home_pages/home_store/home_store_view.dart'
    as _i27;
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart'
    as _i63;
import 'package:network_app/ui/pages/home_pages/home_view.dart' as _i11;
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_view.dart'
    as _i26;
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meeting_invitations_view.dart'
    as _i31;
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_view.dart'
    as _i32;
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/meeting_notifications_view.dart'
    as _i30;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_parameters_view.dart'
    as _i41;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_date/choose_meeting_date_view.dart'
    as _i40;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_interests/choose_meeting_interests_view.dart'
    as _i39;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_occupations/choose_meeting_occupations_view.dart'
    as _i37;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_person/choose_meeting_person_view.dart'
    as _i35;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_type/choose_meeting_type_view.dart'
    as _i34;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/input_meeting_description/input_meeting_description_view.dart'
    as _i36;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/input_meeting_occupation/input_meeting_occupation.dart'
    as _i38;
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/meeting_requests_list_view.dart'
    as _i33;
import 'package:network_app/ui/pages/meeting_pages/meeting_search/meeting_search_view.dart'
    as _i29;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_view.dart'
    as _i44;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers_success/meeting_answers_success_view.dart'
    as _i45;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_complaint/meeting_complaint_view.dart'
    as _i46;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_view.dart'
    as _i43;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_first/meeting_rate_fisrt_view.dart'
    as _i47;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/meeting_rate_second_view.dart'
    as _i48;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_view.dart'
    as _i42;
import 'package:network_app/ui/pages/messages_pages/chat_personal/chat_personal_view.dart'
    as _i57;
import 'package:network_app/ui/pages/profile_pages/choose_categories/choose_categories_view.dart'
    as _i51;
import 'package:network_app/ui/pages/profile_pages/edit_field/edit_field_view.dart'
    as _i50;
import 'package:network_app/ui/pages/profile_pages/person_profile/person_profile_view.dart'
    as _i49;
import 'package:network_app/ui/pages/store_pages/store_category/store_category_view.dart'
    as _i55;
import 'package:network_app/ui/pages/store_pages/store_product/store_product_view.dart'
    as _i56;
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart'
    as _i53;
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange_success/wallet_exchange_success_view.dart'
    as _i54;
import 'package:network_app/utils/main_pages/main_enums.dart' as _i62;

class AppRouter extends _i58.RootStackRouter {
  AppRouter([_i59.GlobalKey<_i59.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i58.PageFactory> pagesMap = {
    StartViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartView(),
      );
    },
    ContractTestViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContractTestView(),
      );
    },
    ConnectMetamaskViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ConnectMetamaskView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginView(),
      );
    },
    LoginMultipleViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginMultipleView(),
      );
    },
    LoginEmailViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginEmailView(),
      );
    },
    InputPhoneViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.InputPhoneView(),
      );
    },
    InputOtpViewRoute.name: (routeData) {
      final args = routeData.argsAs<InputOtpViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.InputOtpView(
          key: args.key,
          strPhone: args.strPhone,
        ),
      );
    },
    RecoveryViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.RecoveryView(),
      );
    },
    RecoveryEmailViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.RecoveryEmailView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeViewRouteArgs>(
          orElse: () => const HomeViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.HomeView(
          key: args.key,
          initIndex: args.initIndex,
          isCupboard: args.isCupboard,
        ),
      );
    },
    RegSuccessViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.RegSuccessView(),
      );
    },
    InputNameViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.InputNameView(),
      );
    },
    ChooseBirthDateViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseBirthDateViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.ChooseBirthDateView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    ChooseSexViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.ChooseSexView(),
      );
    },
    ChooseLevelViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.ChooseLevelView(),
      );
    },
    ChooseInterestsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseInterestsViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i17.ChooseInterestsView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    ChooseStatusViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseStatusViewRouteArgs>(
          orElse: () => const ChooseStatusViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.ChooseStatusView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    InputStatusViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.InputStatusView(),
      );
    },
    ChooseOccupationViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseOccupationViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i20.ChooseOccupationView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    InputOccupationViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.InputOccupationView(),
      );
    },
    InputAboutYouViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.InputAboutYouView(),
      );
    },
    GeolocationTurnOnViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.GeolocationTurnOnView(),
      );
    },
    HomeMeetingViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.HomeMeetingView(),
      );
    },
    HomeProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeProfileViewRouteArgs>(
          orElse: () => const HomeProfileViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.HomeProfileView(
          key: args.key,
          isCupboardInit: args.isCupboardInit,
        ),
      );
    },
    HomeWalletViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.HomeWalletView(),
      );
    },
    HomeStoreViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeStoreViewRouteArgs>(
          orElse: () => const HomeStoreViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.HomeStoreView(
          key: args.key,
          isPartnerCupboard: args.isPartnerCupboard,
        ),
      );
    },
    HomeMessagesViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.HomeMessagesView(),
      );
    },
    MeetingSearchViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingSearchViewRouteArgs>(
          orElse: () => const MeetingSearchViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i29.MeetingSearchView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    MeetingNotificationsViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.MeetingNotificationsView(),
      );
    },
    MeetingInvitationsViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i31.MeetingInvitationsView(),
      );
    },
    MeetingMatchingViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingMatchingViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i32.MeetingMatchingView(
          key: args.key,
          meetingModel: args.meetingModel,
          creatorModel: args.creatorModel,
          partnerModel: args.partnerModel,
        ),
      );
    },
    MeetingRequestsListViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.MeetingRequestsListView(),
      );
    },
    ChooseMeetingTypeViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseMeetingTypeViewRouteArgs>(
          orElse: () => const ChooseMeetingTypeViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i34.ChooseMeetingTypeView(
          key: args.key,
          partnerModel: args.partnerModel,
        ),
      );
    },
    ChooseMeetingPersonViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i35.ChooseMeetingPersonView(),
      );
    },
    InputDescriptionMeetingViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i36.InputDescriptionMeetingView(),
      );
    },
    ChooseMeetingOccupationsViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i37.ChooseMeetingOccupationsView(),
      );
    },
    InputMeetingOccupationViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i38.InputMeetingOccupationView(),
      );
    },
    ChooseMeetingInterestsViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i39.ChooseMeetingInterestsView(),
      );
    },
    ChooseMeetingDateViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i40.ChooseMeetingDateView(),
      );
    },
    CheckMeetingParametersViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i41.CheckMeetingParametersView(),
      );
    },
    MeetingTimerViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingTimerViewRouteArgs>(
          orElse: () => const MeetingTimerViewRouteArgs());
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i42.MeetingTimerView(
          key: args.key,
          isTimer: args.isTimer,
          meetingID: args.meetingID,
        ),
      );
    },
    MeetingQuestionsViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingQuestionsViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i43.MeetingQuestionsView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingAnswersViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingAnswersViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i44.MeetingAnswersView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingAnswersSuccessViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingAnswersSuccessViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i45.MeetingAnswersSuccessView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingComplaintViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i46.MeetingComplaintView(),
      );
    },
    MeetingRateFirstViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingRateFirstViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i47.MeetingRateFirstView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    MeetingRateSecondViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingRateSecondViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i48.MeetingRateSecondView(
          key: args.key,
          meetingModel: args.meetingModel,
        ),
      );
    },
    PersonProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<PersonProfileViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i49.PersonProfileView(
          key: args.key,
          partnerModel: args.partnerModel,
        ),
      );
    },
    EditFieldViewRoute.name: (routeData) {
      final args = routeData.argsAs<EditFieldViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i50.EditFieldView(
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
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i51.ChooseCategoriesView(
          key: args.key,
          isAuth: args.isAuth,
          keyName: args.keyName,
          isMeeting: args.isMeeting,
        ),
      );
    },
    OrdersViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i52.OrdersView(),
      );
    },
    WalletExchangeViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i53.WalletExchangeView(),
      );
    },
    WalletExchangeSuccessViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i54.WalletExchangeSuccessView(),
      );
    },
    StoreCategoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoreCategoryViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i55.StoreCategoryView(
          key: args.key,
          productType: args.productType,
          isCupboard: args.isCupboard,
        ),
      );
    },
    StoreProductViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoreProductViewRouteArgs>();
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i56.StoreProductView(
          key: args.key,
          clotheModel: args.clotheModel,
        ),
      );
    },
    ChatPersonalViewRoute.name: (routeData) {
      return _i58.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i57.ChatPersonalView(),
      );
    },
  };

  @override
  List<_i58.RouteConfig> get routes => [
        _i58.RouteConfig(
          StartViewRoute.name,
          path: '/',
        ),
        _i58.RouteConfig(
          ContractTestViewRoute.name,
          path: '/contract-test-view',
        ),
        _i58.RouteConfig(
          ConnectMetamaskViewRoute.name,
          path: '/connect-metamask-view',
        ),
        _i58.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
        _i58.RouteConfig(
          LoginMultipleViewRoute.name,
          path: '/login-multiple-view',
        ),
        _i58.RouteConfig(
          LoginEmailViewRoute.name,
          path: '/login-email-view',
        ),
        _i58.RouteConfig(
          InputPhoneViewRoute.name,
          path: '/input-phone-view',
        ),
        _i58.RouteConfig(
          InputOtpViewRoute.name,
          path: '/input-otp-view',
        ),
        _i58.RouteConfig(
          RecoveryViewRoute.name,
          path: '/recovery-view',
        ),
        _i58.RouteConfig(
          RecoveryEmailViewRoute.name,
          path: '/recovery-email-view',
        ),
        _i58.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i58.RouteConfig(
          RegSuccessViewRoute.name,
          path: '/reg-success-view',
        ),
        _i58.RouteConfig(
          InputNameViewRoute.name,
          path: '/input-name-view',
        ),
        _i58.RouteConfig(
          ChooseBirthDateViewRoute.name,
          path: '/choose-birth-date-view',
        ),
        _i58.RouteConfig(
          ChooseSexViewRoute.name,
          path: '/choose-sex-view',
        ),
        _i58.RouteConfig(
          ChooseLevelViewRoute.name,
          path: '/choose-level-view',
        ),
        _i58.RouteConfig(
          ChooseInterestsViewRoute.name,
          path: '/choose-interests-view',
        ),
        _i58.RouteConfig(
          ChooseStatusViewRoute.name,
          path: '/choose-status-view',
        ),
        _i58.RouteConfig(
          InputStatusViewRoute.name,
          path: '/input-status-view',
        ),
        _i58.RouteConfig(
          ChooseOccupationViewRoute.name,
          path: '/choose-occupation-view',
        ),
        _i58.RouteConfig(
          InputOccupationViewRoute.name,
          path: '/input-occupation-view',
        ),
        _i58.RouteConfig(
          InputAboutYouViewRoute.name,
          path: '/input-about-you-view',
        ),
        _i58.RouteConfig(
          GeolocationTurnOnViewRoute.name,
          path: '/geolocation-turn-on-view',
        ),
        _i58.RouteConfig(
          HomeMeetingViewRoute.name,
          path: '/home-meeting-view',
        ),
        _i58.RouteConfig(
          HomeProfileViewRoute.name,
          path: '/home-profile-view',
        ),
        _i58.RouteConfig(
          HomeWalletViewRoute.name,
          path: '/home-wallet-view',
        ),
        _i58.RouteConfig(
          HomeStoreViewRoute.name,
          path: '/home-store-view',
        ),
        _i58.RouteConfig(
          HomeMessagesViewRoute.name,
          path: '/home-messages-view',
        ),
        _i58.RouteConfig(
          MeetingSearchViewRoute.name,
          path: '/meeting-search-view',
        ),
        _i58.RouteConfig(
          MeetingNotificationsViewRoute.name,
          path: '/meeting-notifications-view',
        ),
        _i58.RouteConfig(
          MeetingInvitationsViewRoute.name,
          path: '/meeting-invitations-view',
        ),
        _i58.RouteConfig(
          MeetingMatchingViewRoute.name,
          path: '/meeting-matching-view',
        ),
        _i58.RouteConfig(
          MeetingRequestsListViewRoute.name,
          path: '/meeting-requests-list-view',
        ),
        _i58.RouteConfig(
          ChooseMeetingTypeViewRoute.name,
          path: '/choose-meeting-type-view',
        ),
        _i58.RouteConfig(
          ChooseMeetingPersonViewRoute.name,
          path: '/choose-meeting-person-view',
        ),
        _i58.RouteConfig(
          InputDescriptionMeetingViewRoute.name,
          path: '/input-description-meeting-view',
        ),
        _i58.RouteConfig(
          ChooseMeetingOccupationsViewRoute.name,
          path: '/choose-meeting-occupations-view',
        ),
        _i58.RouteConfig(
          InputMeetingOccupationViewRoute.name,
          path: '/input-meeting-occupation-view',
        ),
        _i58.RouteConfig(
          ChooseMeetingInterestsViewRoute.name,
          path: '/choose-meeting-interests-view',
        ),
        _i58.RouteConfig(
          ChooseMeetingDateViewRoute.name,
          path: '/choose-meeting-date-view',
        ),
        _i58.RouteConfig(
          CheckMeetingParametersViewRoute.name,
          path: '/check-meeting-parameters-view',
        ),
        _i58.RouteConfig(
          MeetingTimerViewRoute.name,
          path: '/meeting-timer-view',
        ),
        _i58.RouteConfig(
          MeetingQuestionsViewRoute.name,
          path: '/meeting-questions-view',
        ),
        _i58.RouteConfig(
          MeetingAnswersViewRoute.name,
          path: '/meeting-answers-view',
        ),
        _i58.RouteConfig(
          MeetingAnswersSuccessViewRoute.name,
          path: '/meeting-answers-success-view',
        ),
        _i58.RouteConfig(
          MeetingComplaintViewRoute.name,
          path: '/meeting-complaint-view',
        ),
        _i58.RouteConfig(
          MeetingRateFirstViewRoute.name,
          path: '/meeting-rate-first-view',
        ),
        _i58.RouteConfig(
          MeetingRateSecondViewRoute.name,
          path: '/meeting-rate-second-view',
        ),
        _i58.RouteConfig(
          PersonProfileViewRoute.name,
          path: '/person-profile-view',
        ),
        _i58.RouteConfig(
          EditFieldViewRoute.name,
          path: '/edit-field-view',
        ),
        _i58.RouteConfig(
          ChooseCategoriesViewRoute.name,
          path: '/choose-categories-view',
        ),
        _i58.RouteConfig(
          OrdersViewRoute.name,
          path: '/orders-view',
        ),
        _i58.RouteConfig(
          WalletExchangeViewRoute.name,
          path: '/wallet-exchange-view',
        ),
        _i58.RouteConfig(
          WalletExchangeSuccessViewRoute.name,
          path: '/wallet-exchange-success-view',
        ),
        _i58.RouteConfig(
          StoreCategoryViewRoute.name,
          path: '/store-category-view',
        ),
        _i58.RouteConfig(
          StoreProductViewRoute.name,
          path: '/store-product-view',
        ),
        _i58.RouteConfig(
          ChatPersonalViewRoute.name,
          path: '/chat-personal-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartView]
class StartViewRoute extends _i58.PageRouteInfo<void> {
  const StartViewRoute()
      : super(
          StartViewRoute.name,
          path: '/',
        );

  static const String name = 'StartViewRoute';
}

/// generated route for
/// [_i2.ContractTestView]
class ContractTestViewRoute extends _i58.PageRouteInfo<void> {
  const ContractTestViewRoute()
      : super(
          ContractTestViewRoute.name,
          path: '/contract-test-view',
        );

  static const String name = 'ContractTestViewRoute';
}

/// generated route for
/// [_i3.ConnectMetamaskView]
class ConnectMetamaskViewRoute extends _i58.PageRouteInfo<void> {
  const ConnectMetamaskViewRoute()
      : super(
          ConnectMetamaskViewRoute.name,
          path: '/connect-metamask-view',
        );

  static const String name = 'ConnectMetamaskViewRoute';
}

/// generated route for
/// [_i4.LoginView]
class LoginViewRoute extends _i58.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginViewRoute';
}

/// generated route for
/// [_i5.LoginMultipleView]
class LoginMultipleViewRoute extends _i58.PageRouteInfo<void> {
  const LoginMultipleViewRoute()
      : super(
          LoginMultipleViewRoute.name,
          path: '/login-multiple-view',
        );

  static const String name = 'LoginMultipleViewRoute';
}

/// generated route for
/// [_i6.LoginEmailView]
class LoginEmailViewRoute extends _i58.PageRouteInfo<void> {
  const LoginEmailViewRoute()
      : super(
          LoginEmailViewRoute.name,
          path: '/login-email-view',
        );

  static const String name = 'LoginEmailViewRoute';
}

/// generated route for
/// [_i7.InputPhoneView]
class InputPhoneViewRoute extends _i58.PageRouteInfo<void> {
  const InputPhoneViewRoute()
      : super(
          InputPhoneViewRoute.name,
          path: '/input-phone-view',
        );

  static const String name = 'InputPhoneViewRoute';
}

/// generated route for
/// [_i8.InputOtpView]
class InputOtpViewRoute extends _i58.PageRouteInfo<InputOtpViewRouteArgs> {
  InputOtpViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final String strPhone;

  @override
  String toString() {
    return 'InputOtpViewRouteArgs{key: $key, strPhone: $strPhone}';
  }
}

/// generated route for
/// [_i9.RecoveryView]
class RecoveryViewRoute extends _i58.PageRouteInfo<void> {
  const RecoveryViewRoute()
      : super(
          RecoveryViewRoute.name,
          path: '/recovery-view',
        );

  static const String name = 'RecoveryViewRoute';
}

/// generated route for
/// [_i10.RecoveryEmailView]
class RecoveryEmailViewRoute extends _i58.PageRouteInfo<void> {
  const RecoveryEmailViewRoute()
      : super(
          RecoveryEmailViewRoute.name,
          path: '/recovery-email-view',
        );

  static const String name = 'RecoveryEmailViewRoute';
}

/// generated route for
/// [_i11.HomeView]
class HomeViewRoute extends _i58.PageRouteInfo<HomeViewRouteArgs> {
  HomeViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final int initIndex;

  final bool isCupboard;

  @override
  String toString() {
    return 'HomeViewRouteArgs{key: $key, initIndex: $initIndex, isCupboard: $isCupboard}';
  }
}

/// generated route for
/// [_i12.RegSuccessView]
class RegSuccessViewRoute extends _i58.PageRouteInfo<void> {
  const RegSuccessViewRoute()
      : super(
          RegSuccessViewRoute.name,
          path: '/reg-success-view',
        );

  static const String name = 'RegSuccessViewRoute';
}

/// generated route for
/// [_i13.InputNameView]
class InputNameViewRoute extends _i58.PageRouteInfo<void> {
  const InputNameViewRoute()
      : super(
          InputNameViewRoute.name,
          path: '/input-name-view',
        );

  static const String name = 'InputNameViewRoute';
}

/// generated route for
/// [_i14.ChooseBirthDateView]
class ChooseBirthDateViewRoute
    extends _i58.PageRouteInfo<ChooseBirthDateViewRouteArgs> {
  ChooseBirthDateViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseBirthDateViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i15.ChooseSexView]
class ChooseSexViewRoute extends _i58.PageRouteInfo<void> {
  const ChooseSexViewRoute()
      : super(
          ChooseSexViewRoute.name,
          path: '/choose-sex-view',
        );

  static const String name = 'ChooseSexViewRoute';
}

/// generated route for
/// [_i16.ChooseLevelView]
class ChooseLevelViewRoute extends _i58.PageRouteInfo<void> {
  const ChooseLevelViewRoute()
      : super(
          ChooseLevelViewRoute.name,
          path: '/choose-level-view',
        );

  static const String name = 'ChooseLevelViewRoute';
}

/// generated route for
/// [_i17.ChooseInterestsView]
class ChooseInterestsViewRoute
    extends _i58.PageRouteInfo<ChooseInterestsViewRouteArgs> {
  ChooseInterestsViewRoute({
    _i59.Key? key,
    required bool isAuth,
  }) : super(
          ChooseInterestsViewRoute.name,
          path: '/choose-interests-view',
          args: ChooseInterestsViewRouteArgs(
            key: key,
            isAuth: isAuth,
          ),
        );

  static const String name = 'ChooseInterestsViewRoute';
}

class ChooseInterestsViewRouteArgs {
  const ChooseInterestsViewRouteArgs({
    this.key,
    required this.isAuth,
  });

  final _i59.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseInterestsViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i18.ChooseStatusView]
class ChooseStatusViewRoute
    extends _i58.PageRouteInfo<ChooseStatusViewRouteArgs> {
  ChooseStatusViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseStatusViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i19.InputStatusView]
class InputStatusViewRoute extends _i58.PageRouteInfo<void> {
  const InputStatusViewRoute()
      : super(
          InputStatusViewRoute.name,
          path: '/input-status-view',
        );

  static const String name = 'InputStatusViewRoute';
}

/// generated route for
/// [_i20.ChooseOccupationView]
class ChooseOccupationViewRoute
    extends _i58.PageRouteInfo<ChooseOccupationViewRouteArgs> {
  ChooseOccupationViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseOccupationViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i21.InputOccupationView]
class InputOccupationViewRoute extends _i58.PageRouteInfo<void> {
  const InputOccupationViewRoute()
      : super(
          InputOccupationViewRoute.name,
          path: '/input-occupation-view',
        );

  static const String name = 'InputOccupationViewRoute';
}

/// generated route for
/// [_i22.InputAboutYouView]
class InputAboutYouViewRoute extends _i58.PageRouteInfo<void> {
  const InputAboutYouViewRoute()
      : super(
          InputAboutYouViewRoute.name,
          path: '/input-about-you-view',
        );

  static const String name = 'InputAboutYouViewRoute';
}

/// generated route for
/// [_i23.GeolocationTurnOnView]
class GeolocationTurnOnViewRoute extends _i58.PageRouteInfo<void> {
  const GeolocationTurnOnViewRoute()
      : super(
          GeolocationTurnOnViewRoute.name,
          path: '/geolocation-turn-on-view',
        );

  static const String name = 'GeolocationTurnOnViewRoute';
}

/// generated route for
/// [_i24.HomeMeetingView]
class HomeMeetingViewRoute extends _i58.PageRouteInfo<void> {
  const HomeMeetingViewRoute()
      : super(
          HomeMeetingViewRoute.name,
          path: '/home-meeting-view',
        );

  static const String name = 'HomeMeetingViewRoute';
}

/// generated route for
/// [_i25.HomeProfileView]
class HomeProfileViewRoute
    extends _i58.PageRouteInfo<HomeProfileViewRouteArgs> {
  HomeProfileViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isCupboardInit;

  @override
  String toString() {
    return 'HomeProfileViewRouteArgs{key: $key, isCupboardInit: $isCupboardInit}';
  }
}

/// generated route for
/// [_i26.HomeWalletView]
class HomeWalletViewRoute extends _i58.PageRouteInfo<void> {
  const HomeWalletViewRoute()
      : super(
          HomeWalletViewRoute.name,
          path: '/home-wallet-view',
        );

  static const String name = 'HomeWalletViewRoute';
}

/// generated route for
/// [_i27.HomeStoreView]
class HomeStoreViewRoute extends _i58.PageRouteInfo<HomeStoreViewRouteArgs> {
  HomeStoreViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isPartnerCupboard;

  @override
  String toString() {
    return 'HomeStoreViewRouteArgs{key: $key, isPartnerCupboard: $isPartnerCupboard}';
  }
}

/// generated route for
/// [_i28.HomeMessagesView]
class HomeMessagesViewRoute extends _i58.PageRouteInfo<void> {
  const HomeMessagesViewRoute()
      : super(
          HomeMessagesViewRoute.name,
          path: '/home-messages-view',
        );

  static const String name = 'HomeMessagesViewRoute';
}

/// generated route for
/// [_i29.MeetingSearchView]
class MeetingSearchViewRoute
    extends _i58.PageRouteInfo<MeetingSearchViewRouteArgs> {
  MeetingSearchViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'MeetingSearchViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i30.MeetingNotificationsView]
class MeetingNotificationsViewRoute extends _i58.PageRouteInfo<void> {
  const MeetingNotificationsViewRoute()
      : super(
          MeetingNotificationsViewRoute.name,
          path: '/meeting-notifications-view',
        );

  static const String name = 'MeetingNotificationsViewRoute';
}

/// generated route for
/// [_i31.MeetingInvitationsView]
class MeetingInvitationsViewRoute extends _i58.PageRouteInfo<void> {
  const MeetingInvitationsViewRoute()
      : super(
          MeetingInvitationsViewRoute.name,
          path: '/meeting-invitations-view',
        );

  static const String name = 'MeetingInvitationsViewRoute';
}

/// generated route for
/// [_i32.MeetingMatchingView]
class MeetingMatchingViewRoute
    extends _i58.PageRouteInfo<MeetingMatchingViewRouteArgs> {
  MeetingMatchingViewRoute({
    _i59.Key? key,
    required _i60.MeetingModel meetingModel,
    required _i61.UserModel creatorModel,
    required _i61.UserModel partnerModel,
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

  final _i59.Key? key;

  final _i60.MeetingModel meetingModel;

  final _i61.UserModel creatorModel;

  final _i61.UserModel partnerModel;

  @override
  String toString() {
    return 'MeetingMatchingViewRouteArgs{key: $key, meetingModel: $meetingModel, creatorModel: $creatorModel, partnerModel: $partnerModel}';
  }
}

/// generated route for
/// [_i33.MeetingRequestsListView]
class MeetingRequestsListViewRoute extends _i58.PageRouteInfo<void> {
  const MeetingRequestsListViewRoute()
      : super(
          MeetingRequestsListViewRoute.name,
          path: '/meeting-requests-list-view',
        );

  static const String name = 'MeetingRequestsListViewRoute';
}

/// generated route for
/// [_i34.ChooseMeetingTypeView]
class ChooseMeetingTypeViewRoute
    extends _i58.PageRouteInfo<ChooseMeetingTypeViewRouteArgs> {
  ChooseMeetingTypeViewRoute({
    _i59.Key? key,
    _i61.UserModel? partnerModel,
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

  final _i59.Key? key;

  final _i61.UserModel? partnerModel;

  @override
  String toString() {
    return 'ChooseMeetingTypeViewRouteArgs{key: $key, partnerModel: $partnerModel}';
  }
}

/// generated route for
/// [_i35.ChooseMeetingPersonView]
class ChooseMeetingPersonViewRoute extends _i58.PageRouteInfo<void> {
  const ChooseMeetingPersonViewRoute()
      : super(
          ChooseMeetingPersonViewRoute.name,
          path: '/choose-meeting-person-view',
        );

  static const String name = 'ChooseMeetingPersonViewRoute';
}

/// generated route for
/// [_i36.InputDescriptionMeetingView]
class InputDescriptionMeetingViewRoute extends _i58.PageRouteInfo<void> {
  const InputDescriptionMeetingViewRoute()
      : super(
          InputDescriptionMeetingViewRoute.name,
          path: '/input-description-meeting-view',
        );

  static const String name = 'InputDescriptionMeetingViewRoute';
}

/// generated route for
/// [_i37.ChooseMeetingOccupationsView]
class ChooseMeetingOccupationsViewRoute extends _i58.PageRouteInfo<void> {
  const ChooseMeetingOccupationsViewRoute()
      : super(
          ChooseMeetingOccupationsViewRoute.name,
          path: '/choose-meeting-occupations-view',
        );

  static const String name = 'ChooseMeetingOccupationsViewRoute';
}

/// generated route for
/// [_i38.InputMeetingOccupationView]
class InputMeetingOccupationViewRoute extends _i58.PageRouteInfo<void> {
  const InputMeetingOccupationViewRoute()
      : super(
          InputMeetingOccupationViewRoute.name,
          path: '/input-meeting-occupation-view',
        );

  static const String name = 'InputMeetingOccupationViewRoute';
}

/// generated route for
/// [_i39.ChooseMeetingInterestsView]
class ChooseMeetingInterestsViewRoute extends _i58.PageRouteInfo<void> {
  const ChooseMeetingInterestsViewRoute()
      : super(
          ChooseMeetingInterestsViewRoute.name,
          path: '/choose-meeting-interests-view',
        );

  static const String name = 'ChooseMeetingInterestsViewRoute';
}

/// generated route for
/// [_i40.ChooseMeetingDateView]
class ChooseMeetingDateViewRoute extends _i58.PageRouteInfo<void> {
  const ChooseMeetingDateViewRoute()
      : super(
          ChooseMeetingDateViewRoute.name,
          path: '/choose-meeting-date-view',
        );

  static const String name = 'ChooseMeetingDateViewRoute';
}

/// generated route for
/// [_i41.CheckMeetingParametersView]
class CheckMeetingParametersViewRoute extends _i58.PageRouteInfo<void> {
  const CheckMeetingParametersViewRoute()
      : super(
          CheckMeetingParametersViewRoute.name,
          path: '/check-meeting-parameters-view',
        );

  static const String name = 'CheckMeetingParametersViewRoute';
}

/// generated route for
/// [_i42.MeetingTimerView]
class MeetingTimerViewRoute
    extends _i58.PageRouteInfo<MeetingTimerViewRouteArgs> {
  MeetingTimerViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isTimer;

  final int meetingID;

  @override
  String toString() {
    return 'MeetingTimerViewRouteArgs{key: $key, isTimer: $isTimer, meetingID: $meetingID}';
  }
}

/// generated route for
/// [_i43.MeetingQuestionsView]
class MeetingQuestionsViewRoute
    extends _i58.PageRouteInfo<MeetingQuestionsViewRouteArgs> {
  MeetingQuestionsViewRoute({
    _i59.Key? key,
    required _i60.MeetingModel meetingModel,
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

  final _i59.Key? key;

  final _i60.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingQuestionsViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i44.MeetingAnswersView]
class MeetingAnswersViewRoute
    extends _i58.PageRouteInfo<MeetingAnswersViewRouteArgs> {
  MeetingAnswersViewRoute({
    _i59.Key? key,
    required _i60.MeetingModel meetingModel,
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

  final _i59.Key? key;

  final _i60.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingAnswersViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i45.MeetingAnswersSuccessView]
class MeetingAnswersSuccessViewRoute
    extends _i58.PageRouteInfo<MeetingAnswersSuccessViewRouteArgs> {
  MeetingAnswersSuccessViewRoute({
    _i59.Key? key,
    required _i60.MeetingModel meetingModel,
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

  final _i59.Key? key;

  final _i60.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingAnswersSuccessViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i46.MeetingComplaintView]
class MeetingComplaintViewRoute extends _i58.PageRouteInfo<void> {
  const MeetingComplaintViewRoute()
      : super(
          MeetingComplaintViewRoute.name,
          path: '/meeting-complaint-view',
        );

  static const String name = 'MeetingComplaintViewRoute';
}

/// generated route for
/// [_i47.MeetingRateFirstView]
class MeetingRateFirstViewRoute
    extends _i58.PageRouteInfo<MeetingRateFirstViewRouteArgs> {
  MeetingRateFirstViewRoute({
    _i59.Key? key,
    required _i60.MeetingModel meetingModel,
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

  final _i59.Key? key;

  final _i60.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingRateFirstViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i48.MeetingRateSecondView]
class MeetingRateSecondViewRoute
    extends _i58.PageRouteInfo<MeetingRateSecondViewRouteArgs> {
  MeetingRateSecondViewRoute({
    _i59.Key? key,
    required _i60.MeetingModel meetingModel,
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

  final _i59.Key? key;

  final _i60.MeetingModel meetingModel;

  @override
  String toString() {
    return 'MeetingRateSecondViewRouteArgs{key: $key, meetingModel: $meetingModel}';
  }
}

/// generated route for
/// [_i49.PersonProfileView]
class PersonProfileViewRoute
    extends _i58.PageRouteInfo<PersonProfileViewRouteArgs> {
  PersonProfileViewRoute({
    _i59.Key? key,
    required _i61.UserModel partnerModel,
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

  final _i59.Key? key;

  final _i61.UserModel partnerModel;

  @override
  String toString() {
    return 'PersonProfileViewRouteArgs{key: $key, partnerModel: $partnerModel}';
  }
}

/// generated route for
/// [_i50.EditFieldView]
class EditFieldViewRoute extends _i58.PageRouteInfo<EditFieldViewRouteArgs> {
  EditFieldViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

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
/// [_i51.ChooseCategoriesView]
class ChooseCategoriesViewRoute
    extends _i58.PageRouteInfo<ChooseCategoriesViewRouteArgs> {
  ChooseCategoriesViewRoute({
    _i59.Key? key,
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

  final _i59.Key? key;

  final bool isAuth;

  final String keyName;

  final bool isMeeting;

  @override
  String toString() {
    return 'ChooseCategoriesViewRouteArgs{key: $key, isAuth: $isAuth, keyName: $keyName, isMeeting: $isMeeting}';
  }
}

/// generated route for
/// [_i52.OrdersView]
class OrdersViewRoute extends _i58.PageRouteInfo<void> {
  const OrdersViewRoute()
      : super(
          OrdersViewRoute.name,
          path: '/orders-view',
        );

  static const String name = 'OrdersViewRoute';
}

/// generated route for
/// [_i53.WalletExchangeView]
class WalletExchangeViewRoute extends _i58.PageRouteInfo<void> {
  const WalletExchangeViewRoute()
      : super(
          WalletExchangeViewRoute.name,
          path: '/wallet-exchange-view',
        );

  static const String name = 'WalletExchangeViewRoute';
}

/// generated route for
/// [_i54.WalletExchangeSuccessView]
class WalletExchangeSuccessViewRoute extends _i58.PageRouteInfo<void> {
  const WalletExchangeSuccessViewRoute()
      : super(
          WalletExchangeSuccessViewRoute.name,
          path: '/wallet-exchange-success-view',
        );

  static const String name = 'WalletExchangeSuccessViewRoute';
}

/// generated route for
/// [_i55.StoreCategoryView]
class StoreCategoryViewRoute
    extends _i58.PageRouteInfo<StoreCategoryViewRouteArgs> {
  StoreCategoryViewRoute({
    _i59.Key? key,
    required _i62.StoreProductType productType,
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

  final _i59.Key? key;

  final _i62.StoreProductType productType;

  final bool isCupboard;

  @override
  String toString() {
    return 'StoreCategoryViewRouteArgs{key: $key, productType: $productType, isCupboard: $isCupboard}';
  }
}

/// generated route for
/// [_i56.StoreProductView]
class StoreProductViewRoute
    extends _i58.PageRouteInfo<StoreProductViewRouteArgs> {
  StoreProductViewRoute({
    _i59.Key? key,
    required _i63.ClotheModel clotheModel,
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

  final _i59.Key? key;

  final _i63.ClotheModel clotheModel;

  @override
  String toString() {
    return 'StoreProductViewRouteArgs{key: $key, clotheModel: $clotheModel}';
  }
}

/// generated route for
/// [_i57.ChatPersonalView]
class ChatPersonalViewRoute extends _i58.PageRouteInfo<void> {
  const ChatPersonalViewRoute()
      : super(
          ChatPersonalViewRoute.name,
          path: '/chat-personal-view',
        );

  static const String name = 'ChatPersonalViewRoute';
}
