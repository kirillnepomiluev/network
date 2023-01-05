import 'package:auto_route/auto_route.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_view.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_birth_date_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_interests/choose_interests_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_occupation/choose_occupation_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/geolocation/geolocation_turn_on_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_about_you/input_about_you_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_occupation/input_occupation_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_status/input_status_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/reg_success/reg_succes_view.dart';
import 'package:network_app/ui/pages/home_pages/home_view.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_view.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_view.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_view.dart';
import 'package:network_app/ui/pages/home_pages/home_store/home_store_view.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meeting_invitations_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/meeting_notifications_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_categories_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_data_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_interests_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_occupations_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/input_description_meeting_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/meeting_requests_list_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_search/meeting_search_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers_success/meeting_answers_success_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_complaint/meeting_complaint_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_first/meeting_rate_fisrt.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_second/meeting_rate_second.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_view.dart';
import 'package:network_app/ui/pages/messages_pages/chat_personal/chat_personal_view.dart';
import 'package:network_app/ui/pages/profile_pages/person/person_profile_view.dart';
import 'package:network_app/ui/pages/store_pages/store_avatars_pages/store_category_avatars/store_category_avatars_view.dart';
import 'package:network_app/ui/pages/store_pages/store_avatars_pages/store_product_avatar/store_product_avatar_view.dart';
import 'package:network_app/ui/pages/store_pages/store_headwears_pages/store_category_headwears/store_category_headwears.dart';
import 'package:network_app/ui/pages/store_pages/store_headwears_pages/store_product_headwear/store_product_headwear.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart';

@AdaptiveAutoRouter(
  // replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    ...RoutesLists.authRoutes,
    ...RoutesLists.welcomeRoutes,
    ...RoutesLists.homeRoutes,
    ...RoutesLists.meetingRoutes,
    ...RoutesLists.profileRoutes,
    ...RoutesLists.walletRoutes,
    ...RoutesLists.storeRoutes,
    ...RoutesLists.messagesRoutes,
    // AutoRoute(
    //   page: HomeView,
    //   guards: [AuthGuard],
    //   children: <AutoRoute>[
    //     ...RoutesLists.welcomeRoutes,
    //     ...RoutesLists.homeRoutes,
    //     ...RoutesLists.meetingRoutes,
    //     ...RoutesLists.profileRoutes,
    //     ...RoutesLists.walletRoutes,
    //     ...RoutesLists.storeRoutes,
    //     ...RoutesLists.messagesRoutes,
    //   ],
    // ),
  ],
)
class $AppRouter {}



class RoutesLists {
  static const List<AutoRoute> authRoutes = [
    AutoRoute(page: StartView, initial: true),
    AutoRoute(page: LoginView),
    AutoRoute(page: LoginMultipleView),
    AutoRoute(page: InputPhoneView),
    AutoRoute(page: InputOtpView),
    AutoRoute(page: RecoveryView),
    AutoRoute(page: RecoveryEmailView),
    AutoRoute(page: HomeView),
  ];

  static const List<AutoRoute> welcomeRoutes = [
    AutoRoute(page: RegSuccessView),
    AutoRoute(page: InputNameView),
    AutoRoute(page: ChooseBirthDateView),
    AutoRoute(page: ChooseSexView),
    AutoRoute(page: ChooseLevelView),
    AutoRoute(page: ChooseInterestsView),
    AutoRoute(page: ChooseStatusView),
    AutoRoute(page: InputStatusView),
    AutoRoute(page: ChooseOccupationView),
    AutoRoute(page: InputOccupationView),
    AutoRoute(page: InputAboutYouView),
    AutoRoute(page: GeolocationTurnOnView),
  ];

  static const List<AutoRoute> homeRoutes = [
    AutoRoute(page: HomeView),
    AutoRoute(page: HomeMeetingView),
    AutoRoute(page: HomeProfileView),
    AutoRoute(page: HomeWalletView),
    AutoRoute(page: HomeStoreView),
    AutoRoute(page: HomeMessagesView),
  ];

  static const List<AutoRoute> meetingRoutes = [
    AutoRoute(page: MeetingSearchView),
    AutoRoute(page: MeetingNotificationsView),
    AutoRoute(page: MeetingInvitationsView),
    AutoRoute(page: MeetingMatchingView),
    AutoRoute(page: MeetingRequestsListView),
    ...meetingRequestRoutes,
    ...meetingTimerRoutes
  ];

  static const List<AutoRoute> meetingRequestRoutes = [
    AutoRoute(page: ChooseMeetingCategoriesView),
    AutoRoute(page: InputDescriptionMeetingView),
    AutoRoute(page: ChooseMeetingOccupationsView),
    AutoRoute(page: ChooseMeetingInterestsView),
    AutoRoute(page: ChooseMeetingDateView),
    AutoRoute(page: CheckMeetingParametersView),
  ];

  static const List<AutoRoute> meetingTimerRoutes = [
    AutoRoute(page: MeetingTimerView),
    AutoRoute(page: MeetingQuestionsView),
    AutoRoute(page: MeetingAnswersView),
    AutoRoute(page: MeetingAnswersSuccessView),
    AutoRoute(page: MeetingComplaintView),
    AutoRoute(page: MeetingRateFirstView),
    AutoRoute(page: MeetingRateSecondView),
  ];

  static const List<AutoRoute> profileRoutes = [
    AutoRoute(page: PersonProfileView),
  ];

  static const List<AutoRoute> walletRoutes = [
    AutoRoute(page: WalletExchangeView),
  ];

  static const List<AutoRoute> storeRoutes = [
    AutoRoute(page: StoreCategoryAvatarsView),
    AutoRoute(page: StoreProductAvatarView),
    AutoRoute(page: StoreCategoryHeadwearsView),
    AutoRoute(page: StoreProductHeadwearView),
  ];

  static const List<AutoRoute> messagesRoutes = [
    AutoRoute(page: ChatPersonalView),
  ];
}
