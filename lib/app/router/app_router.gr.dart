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
import 'package:auto_route/auto_route.dart' as _i52;
import 'package:flutter/material.dart' as _i53;
import 'package:network_app/app/router/auth_guard.dart' as _i54;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart'
    as _i2;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_email/login_email_view.dart'
    as _i4;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_view.dart'
    as _i3;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_view.dart'
    as _i6;
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_view.dart'
    as _i5;
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_view.dart'
    as _i7;
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_view.dart'
    as _i8;
import 'package:network_app/ui/pages/auth_pages/start/start_view.dart' as _i1;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_birth_date_view.dart'
    as _i12;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_interests/choose_interests_view.dart'
    as _i15;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_view.dart'
    as _i14;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_occupation/choose_occupation_view.dart'
    as _i18;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex_view.dart'
    as _i13;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status_view.dart'
    as _i16;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/geolocation/geolocation_turn_on_view.dart'
    as _i21;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_about_you/input_about_you_view.dart'
    as _i20;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_view.dart'
    as _i11;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_occupation/input_occupation_view.dart'
    as _i19;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_status/input_status_view.dart'
    as _i17;
import 'package:network_app/ui/pages/auth_pages/welcome_pages/reg_success/reg_succes_view.dart'
    as _i10;
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_view.dart'
    as _i22;
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_view.dart'
    as _i26;
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_view.dart'
    as _i23;
import 'package:network_app/ui/pages/home_pages/home_store/home_store_view.dart'
    as _i25;
import 'package:network_app/ui/pages/home_pages/home_view.dart' as _i9;
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_view.dart'
    as _i24;
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meeting_invitations_view.dart'
    as _i29;
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_view.dart'
    as _i30;
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/meeting_notifications_view.dart'
    as _i28;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_parameters_view.dart'
    as _i38;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_categories/choose_meeting_categories_view.dart'
    as _i32;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_data/choose_meeting_data_view.dart'
    as _i37;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_interests/choose_meeting_interests_view.dart'
    as _i36;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_occupations/choose_meeting_occupations_view.dart'
    as _i34;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/input_meeting_description/input_meeting_description_view.dart'
    as _i33;
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/input_meeting_occupation/input_meeting_occupation.dart'
    as _i35;
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/meeting_requests_list_view.dart'
    as _i31;
import 'package:network_app/ui/pages/meeting_pages/meeting_search/meeting_search_view.dart'
    as _i27;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_view.dart'
    as _i41;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers_success/meeting_answers_success_view.dart'
    as _i42;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_complaint/meeting_complaint_view.dart'
    as _i43;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_view.dart'
    as _i40;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_first/meeting_rate_fisrt_view.dart'
    as _i44;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/meeting_rate_second_view.dart'
    as _i45;
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_view.dart'
    as _i39;
import 'package:network_app/ui/pages/messages_pages/chat_personal/chat_personal_view.dart'
    as _i51;
import 'package:network_app/ui/pages/profile_pages/person_profile/person_profile_view.dart'
    as _i46;
import 'package:network_app/ui/pages/store_pages/store_category/store_category_view.dart'
    as _i49;
import 'package:network_app/ui/pages/store_pages/store_product/store_product_view.dart'
    as _i50;
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart'
    as _i47;
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange_success/wallet_exchange_success_view.dart'
    as _i48;
import 'package:network_app/utils/main_pages/main_enums.dart' as _i55;

class AppRouter extends _i52.RootStackRouter {
  AppRouter({
    _i53.GlobalKey<_i53.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i54.AuthGuard authGuard;

  @override
  final Map<String, _i52.PageFactory> pagesMap = {
    StartViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginView(),
      );
    },
    LoginMultipleViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginMultipleView(),
      );
    },
    LoginEmailViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginEmailView(),
      );
    },
    InputPhoneViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.InputPhoneView(),
      );
    },
    InputOtpViewRoute.name: (routeData) {
      final args = routeData.argsAs<InputOtpViewRouteArgs>();
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.InputOtpView(
          key: args.key,
          strPhone: args.strPhone,
        ),
      );
    },
    RecoveryViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.RecoveryView(),
      );
    },
    RecoveryEmailViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.RecoveryEmailView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeViewRouteArgs>(
          orElse: () => const HomeViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i9.HomeView(
          key: args.key,
          initIndex: args.initIndex,
          isCupboard: args.isCupboard,
        ),
      );
    },
    RegSuccessViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegSuccessView(),
      );
    },
    InputNameViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.InputNameView(),
      );
    },
    ChooseBirthDateViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.ChooseBirthDateView(),
      );
    },
    ChooseSexViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.ChooseSexView(),
      );
    },
    ChooseLevelViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.ChooseLevelView(),
      );
    },
    ChooseInterestsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseInterestsViewRouteArgs>(
          orElse: () => const ChooseInterestsViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.ChooseInterestsView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    ChooseStatusViewRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseStatusViewRouteArgs>(
          orElse: () => const ChooseStatusViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.ChooseStatusView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    InputStatusViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.InputStatusView(),
      );
    },
    ChooseOccupationViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ChooseOccupationView(),
      );
    },
    InputOccupationViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.InputOccupationView(),
      );
    },
    InputAboutYouViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.InputAboutYouView(),
      );
    },
    GeolocationTurnOnViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.GeolocationTurnOnView(),
      );
    },
    HomeMeetingViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.HomeMeetingView(),
      );
    },
    HomeProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeProfileViewRouteArgs>(
          orElse: () => const HomeProfileViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i23.HomeProfileView(
          key: args.key,
          isCupboardInit: args.isCupboardInit,
        ),
      );
    },
    HomeWalletViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.HomeWalletView(),
      );
    },
    HomeStoreViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeStoreViewRouteArgs>(
          orElse: () => const HomeStoreViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.HomeStoreView(
          key: args.key,
          isPartnerCupboard: args.isPartnerCupboard,
        ),
      );
    },
    HomeMessagesViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.HomeMessagesView(),
      );
    },
    MeetingSearchViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingSearchViewRouteArgs>(
          orElse: () => const MeetingSearchViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.MeetingSearchView(
          key: args.key,
          isAuth: args.isAuth,
        ),
      );
    },
    MeetingNotificationsViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.MeetingNotificationsView(),
      );
    },
    MeetingInvitationsViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.MeetingInvitationsView(),
      );
    },
    MeetingMatchingViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.MeetingMatchingView(),
      );
    },
    MeetingRequestsListViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i31.MeetingRequestsListView(),
      );
    },
    ChooseMeetingCategoriesViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i32.ChooseMeetingCategoriesView(),
      );
    },
    InputDescriptionMeetingViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.InputDescriptionMeetingView(),
      );
    },
    ChooseMeetingOccupationsViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i34.ChooseMeetingOccupationsView(),
      );
    },
    InputMeetingOccupationViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i35.InputMeetingOccupationView(),
      );
    },
    ChooseMeetingInterestsViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i36.ChooseMeetingInterestsView(),
      );
    },
    ChooseMeetingDateViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i37.ChooseMeetingDateView(),
      );
    },
    CheckMeetingParametersViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i38.CheckMeetingParametersView(),
      );
    },
    MeetingTimerViewRoute.name: (routeData) {
      final args = routeData.argsAs<MeetingTimerViewRouteArgs>(
          orElse: () => const MeetingTimerViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i39.MeetingTimerView(
          key: args.key,
          isTimer: args.isTimer,
        ),
      );
    },
    MeetingQuestionsViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i40.MeetingQuestionsView(),
      );
    },
    MeetingAnswersViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i41.MeetingAnswersView(),
      );
    },
    MeetingAnswersSuccessViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i42.MeetingAnswersSuccessView(),
      );
    },
    MeetingComplaintViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i43.MeetingComplaintView(),
      );
    },
    MeetingRateFirstViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i44.MeetingRateFirstView(),
      );
    },
    MeetingRateSecondViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i45.MeetingRateSecondView(),
      );
    },
    PersonProfileViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i46.PersonProfileView(),
      );
    },
    WalletExchangeViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i47.WalletExchangeView(),
      );
    },
    WalletExchangeSuccessViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i48.WalletExchangeSuccessView(),
      );
    },
    StoreCategoryViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoreCategoryViewRouteArgs>();
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i49.StoreCategoryView(
          key: args.key,
          storeProductType: args.storeProductType,
        ),
      );
    },
    StoreProductViewRoute.name: (routeData) {
      final args = routeData.argsAs<StoreProductViewRouteArgs>(
          orElse: () => const StoreProductViewRouteArgs());
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i50.StoreProductView(
          key: args.key,
          title: args.title,
          imageURL: args.imageURL,
        ),
      );
    },
    ChatPersonalViewRoute.name: (routeData) {
      return _i52.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i51.ChatPersonalView(),
      );
    },
  };

  @override
  List<_i52.RouteConfig> get routes => [
        _i52.RouteConfig(
          StartViewRoute.name,
          path: '/',
        ),
        _i52.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
        _i52.RouteConfig(
          LoginMultipleViewRoute.name,
          path: '/login-multiple-view',
        ),
        _i52.RouteConfig(
          LoginEmailViewRoute.name,
          path: '/login-email-view',
        ),
        _i52.RouteConfig(
          InputPhoneViewRoute.name,
          path: '/input-phone-view',
        ),
        _i52.RouteConfig(
          InputOtpViewRoute.name,
          path: '/input-otp-view',
        ),
        _i52.RouteConfig(
          RecoveryViewRoute.name,
          path: '/recovery-view',
        ),
        _i52.RouteConfig(
          RecoveryEmailViewRoute.name,
          path: '/recovery-email-view',
        ),
        _i52.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i52.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
          guards: [authGuard],
          children: [
            _i52.RouteConfig(
              RegSuccessViewRoute.name,
              path: 'reg-success-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              InputNameViewRoute.name,
              path: 'input-name-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseBirthDateViewRoute.name,
              path: 'choose-birth-date-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseSexViewRoute.name,
              path: 'choose-sex-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseLevelViewRoute.name,
              path: 'choose-level-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseInterestsViewRoute.name,
              path: 'choose-interests-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseStatusViewRoute.name,
              path: 'choose-status-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              InputStatusViewRoute.name,
              path: 'input-status-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseOccupationViewRoute.name,
              path: 'choose-occupation-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              InputOccupationViewRoute.name,
              path: 'input-occupation-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              InputAboutYouViewRoute.name,
              path: 'input-about-you-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              GeolocationTurnOnViewRoute.name,
              path: 'geolocation-turn-on-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              HomeMeetingViewRoute.name,
              path: 'home-meeting-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              HomeProfileViewRoute.name,
              path: 'home-profile-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              HomeWalletViewRoute.name,
              path: 'home-wallet-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              HomeStoreViewRoute.name,
              path: 'home-store-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              HomeMessagesViewRoute.name,
              path: 'home-messages-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingSearchViewRoute.name,
              path: 'meeting-search-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingNotificationsViewRoute.name,
              path: 'meeting-notifications-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingInvitationsViewRoute.name,
              path: 'meeting-invitations-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingMatchingViewRoute.name,
              path: 'meeting-matching-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingRequestsListViewRoute.name,
              path: 'meeting-requests-list-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseMeetingCategoriesViewRoute.name,
              path: 'choose-meeting-categories-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              InputDescriptionMeetingViewRoute.name,
              path: 'input-description-meeting-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseMeetingOccupationsViewRoute.name,
              path: 'choose-meeting-occupations-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              InputMeetingOccupationViewRoute.name,
              path: 'input-meeting-occupation-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseMeetingInterestsViewRoute.name,
              path: 'choose-meeting-interests-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChooseMeetingDateViewRoute.name,
              path: 'choose-meeting-date-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              CheckMeetingParametersViewRoute.name,
              path: 'check-meeting-parameters-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingTimerViewRoute.name,
              path: 'meeting-timer-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingQuestionsViewRoute.name,
              path: 'meeting-questions-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingAnswersViewRoute.name,
              path: 'meeting-answers-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingAnswersSuccessViewRoute.name,
              path: 'meeting-answers-success-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingComplaintViewRoute.name,
              path: 'meeting-complaint-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingRateFirstViewRoute.name,
              path: 'meeting-rate-first-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              MeetingRateSecondViewRoute.name,
              path: 'meeting-rate-second-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              PersonProfileViewRoute.name,
              path: 'person-profile-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              WalletExchangeViewRoute.name,
              path: 'wallet-exchange-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              WalletExchangeSuccessViewRoute.name,
              path: 'wallet-exchange-success-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              StoreCategoryViewRoute.name,
              path: 'store-category-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              StoreProductViewRoute.name,
              path: 'store-product-view',
              parent: HomeViewRoute.name,
            ),
            _i52.RouteConfig(
              ChatPersonalViewRoute.name,
              path: 'chat-personal-view',
              parent: HomeViewRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.StartView]
class StartViewRoute extends _i52.PageRouteInfo<void> {
  const StartViewRoute()
      : super(
          StartViewRoute.name,
          path: '/',
        );

  static const String name = 'StartViewRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginViewRoute extends _i52.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginViewRoute';
}

/// generated route for
/// [_i3.LoginMultipleView]
class LoginMultipleViewRoute extends _i52.PageRouteInfo<void> {
  const LoginMultipleViewRoute()
      : super(
          LoginMultipleViewRoute.name,
          path: '/login-multiple-view',
        );

  static const String name = 'LoginMultipleViewRoute';
}

/// generated route for
/// [_i4.LoginEmailView]
class LoginEmailViewRoute extends _i52.PageRouteInfo<void> {
  const LoginEmailViewRoute()
      : super(
          LoginEmailViewRoute.name,
          path: '/login-email-view',
        );

  static const String name = 'LoginEmailViewRoute';
}

/// generated route for
/// [_i5.InputPhoneView]
class InputPhoneViewRoute extends _i52.PageRouteInfo<void> {
  const InputPhoneViewRoute()
      : super(
          InputPhoneViewRoute.name,
          path: '/input-phone-view',
        );

  static const String name = 'InputPhoneViewRoute';
}

/// generated route for
/// [_i6.InputOtpView]
class InputOtpViewRoute extends _i52.PageRouteInfo<InputOtpViewRouteArgs> {
  InputOtpViewRoute({
    _i53.Key? key,
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

  final _i53.Key? key;

  final String strPhone;

  @override
  String toString() {
    return 'InputOtpViewRouteArgs{key: $key, strPhone: $strPhone}';
  }
}

/// generated route for
/// [_i7.RecoveryView]
class RecoveryViewRoute extends _i52.PageRouteInfo<void> {
  const RecoveryViewRoute()
      : super(
          RecoveryViewRoute.name,
          path: '/recovery-view',
        );

  static const String name = 'RecoveryViewRoute';
}

/// generated route for
/// [_i8.RecoveryEmailView]
class RecoveryEmailViewRoute extends _i52.PageRouteInfo<void> {
  const RecoveryEmailViewRoute()
      : super(
          RecoveryEmailViewRoute.name,
          path: '/recovery-email-view',
        );

  static const String name = 'RecoveryEmailViewRoute';
}

/// generated route for
/// [_i9.HomeView]
class HomeViewRoute extends _i52.PageRouteInfo<HomeViewRouteArgs> {
  HomeViewRoute({
    _i53.Key? key,
    int initIndex = 0,
    bool isCupboard = false,
    List<_i52.PageRouteInfo>? children,
  }) : super(
          HomeViewRoute.name,
          path: '/home-view',
          args: HomeViewRouteArgs(
            key: key,
            initIndex: initIndex,
            isCupboard: isCupboard,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';
}

class HomeViewRouteArgs {
  const HomeViewRouteArgs({
    this.key,
    this.initIndex = 0,
    this.isCupboard = false,
  });

  final _i53.Key? key;

  final int initIndex;

  final bool isCupboard;

  @override
  String toString() {
    return 'HomeViewRouteArgs{key: $key, initIndex: $initIndex, isCupboard: $isCupboard}';
  }
}

/// generated route for
/// [_i10.RegSuccessView]
class RegSuccessViewRoute extends _i52.PageRouteInfo<void> {
  const RegSuccessViewRoute()
      : super(
          RegSuccessViewRoute.name,
          path: 'reg-success-view',
        );

  static const String name = 'RegSuccessViewRoute';
}

/// generated route for
/// [_i11.InputNameView]
class InputNameViewRoute extends _i52.PageRouteInfo<void> {
  const InputNameViewRoute()
      : super(
          InputNameViewRoute.name,
          path: 'input-name-view',
        );

  static const String name = 'InputNameViewRoute';
}

/// generated route for
/// [_i12.ChooseBirthDateView]
class ChooseBirthDateViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseBirthDateViewRoute()
      : super(
          ChooseBirthDateViewRoute.name,
          path: 'choose-birth-date-view',
        );

  static const String name = 'ChooseBirthDateViewRoute';
}

/// generated route for
/// [_i13.ChooseSexView]
class ChooseSexViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseSexViewRoute()
      : super(
          ChooseSexViewRoute.name,
          path: 'choose-sex-view',
        );

  static const String name = 'ChooseSexViewRoute';
}

/// generated route for
/// [_i14.ChooseLevelView]
class ChooseLevelViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseLevelViewRoute()
      : super(
          ChooseLevelViewRoute.name,
          path: 'choose-level-view',
        );

  static const String name = 'ChooseLevelViewRoute';
}

/// generated route for
/// [_i15.ChooseInterestsView]
class ChooseInterestsViewRoute
    extends _i52.PageRouteInfo<ChooseInterestsViewRouteArgs> {
  ChooseInterestsViewRoute({
    _i53.Key? key,
    bool isAuth = false,
  }) : super(
          ChooseInterestsViewRoute.name,
          path: 'choose-interests-view',
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
    this.isAuth = false,
  });

  final _i53.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseInterestsViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i16.ChooseStatusView]
class ChooseStatusViewRoute
    extends _i52.PageRouteInfo<ChooseStatusViewRouteArgs> {
  ChooseStatusViewRoute({
    _i53.Key? key,
    bool isAuth = false,
  }) : super(
          ChooseStatusViewRoute.name,
          path: 'choose-status-view',
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

  final _i53.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'ChooseStatusViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i17.InputStatusView]
class InputStatusViewRoute extends _i52.PageRouteInfo<void> {
  const InputStatusViewRoute()
      : super(
          InputStatusViewRoute.name,
          path: 'input-status-view',
        );

  static const String name = 'InputStatusViewRoute';
}

/// generated route for
/// [_i18.ChooseOccupationView]
class ChooseOccupationViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseOccupationViewRoute()
      : super(
          ChooseOccupationViewRoute.name,
          path: 'choose-occupation-view',
        );

  static const String name = 'ChooseOccupationViewRoute';
}

/// generated route for
/// [_i19.InputOccupationView]
class InputOccupationViewRoute extends _i52.PageRouteInfo<void> {
  const InputOccupationViewRoute()
      : super(
          InputOccupationViewRoute.name,
          path: 'input-occupation-view',
        );

  static const String name = 'InputOccupationViewRoute';
}

/// generated route for
/// [_i20.InputAboutYouView]
class InputAboutYouViewRoute extends _i52.PageRouteInfo<void> {
  const InputAboutYouViewRoute()
      : super(
          InputAboutYouViewRoute.name,
          path: 'input-about-you-view',
        );

  static const String name = 'InputAboutYouViewRoute';
}

/// generated route for
/// [_i21.GeolocationTurnOnView]
class GeolocationTurnOnViewRoute extends _i52.PageRouteInfo<void> {
  const GeolocationTurnOnViewRoute()
      : super(
          GeolocationTurnOnViewRoute.name,
          path: 'geolocation-turn-on-view',
        );

  static const String name = 'GeolocationTurnOnViewRoute';
}

/// generated route for
/// [_i22.HomeMeetingView]
class HomeMeetingViewRoute extends _i52.PageRouteInfo<void> {
  const HomeMeetingViewRoute()
      : super(
          HomeMeetingViewRoute.name,
          path: 'home-meeting-view',
        );

  static const String name = 'HomeMeetingViewRoute';
}

/// generated route for
/// [_i23.HomeProfileView]
class HomeProfileViewRoute
    extends _i52.PageRouteInfo<HomeProfileViewRouteArgs> {
  HomeProfileViewRoute({
    _i53.Key? key,
    bool isCupboardInit = false,
  }) : super(
          HomeProfileViewRoute.name,
          path: 'home-profile-view',
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

  final _i53.Key? key;

  final bool isCupboardInit;

  @override
  String toString() {
    return 'HomeProfileViewRouteArgs{key: $key, isCupboardInit: $isCupboardInit}';
  }
}

/// generated route for
/// [_i24.HomeWalletView]
class HomeWalletViewRoute extends _i52.PageRouteInfo<void> {
  const HomeWalletViewRoute()
      : super(
          HomeWalletViewRoute.name,
          path: 'home-wallet-view',
        );

  static const String name = 'HomeWalletViewRoute';
}

/// generated route for
/// [_i25.HomeStoreView]
class HomeStoreViewRoute extends _i52.PageRouteInfo<HomeStoreViewRouteArgs> {
  HomeStoreViewRoute({
    _i53.Key? key,
    bool isPartnerCupboard = false,
  }) : super(
          HomeStoreViewRoute.name,
          path: 'home-store-view',
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

  final _i53.Key? key;

  final bool isPartnerCupboard;

  @override
  String toString() {
    return 'HomeStoreViewRouteArgs{key: $key, isPartnerCupboard: $isPartnerCupboard}';
  }
}

/// generated route for
/// [_i26.HomeMessagesView]
class HomeMessagesViewRoute extends _i52.PageRouteInfo<void> {
  const HomeMessagesViewRoute()
      : super(
          HomeMessagesViewRoute.name,
          path: 'home-messages-view',
        );

  static const String name = 'HomeMessagesViewRoute';
}

/// generated route for
/// [_i27.MeetingSearchView]
class MeetingSearchViewRoute
    extends _i52.PageRouteInfo<MeetingSearchViewRouteArgs> {
  MeetingSearchViewRoute({
    _i53.Key? key,
    bool isAuth = false,
  }) : super(
          MeetingSearchViewRoute.name,
          path: 'meeting-search-view',
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

  final _i53.Key? key;

  final bool isAuth;

  @override
  String toString() {
    return 'MeetingSearchViewRouteArgs{key: $key, isAuth: $isAuth}';
  }
}

/// generated route for
/// [_i28.MeetingNotificationsView]
class MeetingNotificationsViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingNotificationsViewRoute()
      : super(
          MeetingNotificationsViewRoute.name,
          path: 'meeting-notifications-view',
        );

  static const String name = 'MeetingNotificationsViewRoute';
}

/// generated route for
/// [_i29.MeetingInvitationsView]
class MeetingInvitationsViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingInvitationsViewRoute()
      : super(
          MeetingInvitationsViewRoute.name,
          path: 'meeting-invitations-view',
        );

  static const String name = 'MeetingInvitationsViewRoute';
}

/// generated route for
/// [_i30.MeetingMatchingView]
class MeetingMatchingViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingMatchingViewRoute()
      : super(
          MeetingMatchingViewRoute.name,
          path: 'meeting-matching-view',
        );

  static const String name = 'MeetingMatchingViewRoute';
}

/// generated route for
/// [_i31.MeetingRequestsListView]
class MeetingRequestsListViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingRequestsListViewRoute()
      : super(
          MeetingRequestsListViewRoute.name,
          path: 'meeting-requests-list-view',
        );

  static const String name = 'MeetingRequestsListViewRoute';
}

/// generated route for
/// [_i32.ChooseMeetingCategoriesView]
class ChooseMeetingCategoriesViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseMeetingCategoriesViewRoute()
      : super(
          ChooseMeetingCategoriesViewRoute.name,
          path: 'choose-meeting-categories-view',
        );

  static const String name = 'ChooseMeetingCategoriesViewRoute';
}

/// generated route for
/// [_i33.InputDescriptionMeetingView]
class InputDescriptionMeetingViewRoute extends _i52.PageRouteInfo<void> {
  const InputDescriptionMeetingViewRoute()
      : super(
          InputDescriptionMeetingViewRoute.name,
          path: 'input-description-meeting-view',
        );

  static const String name = 'InputDescriptionMeetingViewRoute';
}

/// generated route for
/// [_i34.ChooseMeetingOccupationsView]
class ChooseMeetingOccupationsViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseMeetingOccupationsViewRoute()
      : super(
          ChooseMeetingOccupationsViewRoute.name,
          path: 'choose-meeting-occupations-view',
        );

  static const String name = 'ChooseMeetingOccupationsViewRoute';
}

/// generated route for
/// [_i35.InputMeetingOccupationView]
class InputMeetingOccupationViewRoute extends _i52.PageRouteInfo<void> {
  const InputMeetingOccupationViewRoute()
      : super(
          InputMeetingOccupationViewRoute.name,
          path: 'input-meeting-occupation-view',
        );

  static const String name = 'InputMeetingOccupationViewRoute';
}

/// generated route for
/// [_i36.ChooseMeetingInterestsView]
class ChooseMeetingInterestsViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseMeetingInterestsViewRoute()
      : super(
          ChooseMeetingInterestsViewRoute.name,
          path: 'choose-meeting-interests-view',
        );

  static const String name = 'ChooseMeetingInterestsViewRoute';
}

/// generated route for
/// [_i37.ChooseMeetingDateView]
class ChooseMeetingDateViewRoute extends _i52.PageRouteInfo<void> {
  const ChooseMeetingDateViewRoute()
      : super(
          ChooseMeetingDateViewRoute.name,
          path: 'choose-meeting-date-view',
        );

  static const String name = 'ChooseMeetingDateViewRoute';
}

/// generated route for
/// [_i38.CheckMeetingParametersView]
class CheckMeetingParametersViewRoute extends _i52.PageRouteInfo<void> {
  const CheckMeetingParametersViewRoute()
      : super(
          CheckMeetingParametersViewRoute.name,
          path: 'check-meeting-parameters-view',
        );

  static const String name = 'CheckMeetingParametersViewRoute';
}

/// generated route for
/// [_i39.MeetingTimerView]
class MeetingTimerViewRoute
    extends _i52.PageRouteInfo<MeetingTimerViewRouteArgs> {
  MeetingTimerViewRoute({
    _i53.Key? key,
    bool isTimer = false,
  }) : super(
          MeetingTimerViewRoute.name,
          path: 'meeting-timer-view',
          args: MeetingTimerViewRouteArgs(
            key: key,
            isTimer: isTimer,
          ),
        );

  static const String name = 'MeetingTimerViewRoute';
}

class MeetingTimerViewRouteArgs {
  const MeetingTimerViewRouteArgs({
    this.key,
    this.isTimer = false,
  });

  final _i53.Key? key;

  final bool isTimer;

  @override
  String toString() {
    return 'MeetingTimerViewRouteArgs{key: $key, isTimer: $isTimer}';
  }
}

/// generated route for
/// [_i40.MeetingQuestionsView]
class MeetingQuestionsViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingQuestionsViewRoute()
      : super(
          MeetingQuestionsViewRoute.name,
          path: 'meeting-questions-view',
        );

  static const String name = 'MeetingQuestionsViewRoute';
}

/// generated route for
/// [_i41.MeetingAnswersView]
class MeetingAnswersViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingAnswersViewRoute()
      : super(
          MeetingAnswersViewRoute.name,
          path: 'meeting-answers-view',
        );

  static const String name = 'MeetingAnswersViewRoute';
}

/// generated route for
/// [_i42.MeetingAnswersSuccessView]
class MeetingAnswersSuccessViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingAnswersSuccessViewRoute()
      : super(
          MeetingAnswersSuccessViewRoute.name,
          path: 'meeting-answers-success-view',
        );

  static const String name = 'MeetingAnswersSuccessViewRoute';
}

/// generated route for
/// [_i43.MeetingComplaintView]
class MeetingComplaintViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingComplaintViewRoute()
      : super(
          MeetingComplaintViewRoute.name,
          path: 'meeting-complaint-view',
        );

  static const String name = 'MeetingComplaintViewRoute';
}

/// generated route for
/// [_i44.MeetingRateFirstView]
class MeetingRateFirstViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingRateFirstViewRoute()
      : super(
          MeetingRateFirstViewRoute.name,
          path: 'meeting-rate-first-view',
        );

  static const String name = 'MeetingRateFirstViewRoute';
}

/// generated route for
/// [_i45.MeetingRateSecondView]
class MeetingRateSecondViewRoute extends _i52.PageRouteInfo<void> {
  const MeetingRateSecondViewRoute()
      : super(
          MeetingRateSecondViewRoute.name,
          path: 'meeting-rate-second-view',
        );

  static const String name = 'MeetingRateSecondViewRoute';
}

/// generated route for
/// [_i46.PersonProfileView]
class PersonProfileViewRoute extends _i52.PageRouteInfo<void> {
  const PersonProfileViewRoute()
      : super(
          PersonProfileViewRoute.name,
          path: 'person-profile-view',
        );

  static const String name = 'PersonProfileViewRoute';
}

/// generated route for
/// [_i47.WalletExchangeView]
class WalletExchangeViewRoute extends _i52.PageRouteInfo<void> {
  const WalletExchangeViewRoute()
      : super(
          WalletExchangeViewRoute.name,
          path: 'wallet-exchange-view',
        );

  static const String name = 'WalletExchangeViewRoute';
}

/// generated route for
/// [_i48.WalletExchangeSuccessView]
class WalletExchangeSuccessViewRoute extends _i52.PageRouteInfo<void> {
  const WalletExchangeSuccessViewRoute()
      : super(
          WalletExchangeSuccessViewRoute.name,
          path: 'wallet-exchange-success-view',
        );

  static const String name = 'WalletExchangeSuccessViewRoute';
}

/// generated route for
/// [_i49.StoreCategoryView]
class StoreCategoryViewRoute
    extends _i52.PageRouteInfo<StoreCategoryViewRouteArgs> {
  StoreCategoryViewRoute({
    _i53.Key? key,
    required _i55.StoreProductType storeProductType,
  }) : super(
          StoreCategoryViewRoute.name,
          path: 'store-category-view',
          args: StoreCategoryViewRouteArgs(
            key: key,
            storeProductType: storeProductType,
          ),
        );

  static const String name = 'StoreCategoryViewRoute';
}

class StoreCategoryViewRouteArgs {
  const StoreCategoryViewRouteArgs({
    this.key,
    required this.storeProductType,
  });

  final _i53.Key? key;

  final _i55.StoreProductType storeProductType;

  @override
  String toString() {
    return 'StoreCategoryViewRouteArgs{key: $key, storeProductType: $storeProductType}';
  }
}

/// generated route for
/// [_i50.StoreProductView]
class StoreProductViewRoute
    extends _i52.PageRouteInfo<StoreProductViewRouteArgs> {
  StoreProductViewRoute({
    _i53.Key? key,
    String title = 'Костюм "Выходной"',
    String? imageURL,
  }) : super(
          StoreProductViewRoute.name,
          path: 'store-product-view',
          args: StoreProductViewRouteArgs(
            key: key,
            title: title,
            imageURL: imageURL,
          ),
        );

  static const String name = 'StoreProductViewRoute';
}

class StoreProductViewRouteArgs {
  const StoreProductViewRouteArgs({
    this.key,
    this.title = 'Костюм "Выходной"',
    this.imageURL,
  });

  final _i53.Key? key;

  final String title;

  final String? imageURL;

  @override
  String toString() {
    return 'StoreProductViewRouteArgs{key: $key, title: $title, imageURL: $imageURL}';
  }
}

/// generated route for
/// [_i51.ChatPersonalView]
class ChatPersonalViewRoute extends _i52.PageRouteInfo<void> {
  const ChatPersonalViewRoute()
      : super(
          ChatPersonalViewRoute.name,
          path: 'chat-personal-view',
        );

  static const String name = 'ChatPersonalViewRoute';
}
