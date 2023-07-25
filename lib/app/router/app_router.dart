import 'package:auto_route/auto_route.dart';
import 'package:network_app/ui/pages/blockchain/connect_metamask_view.dart';
import 'package:network_app/ui/pages/blockchain/contract_test_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_email/login_email_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_multiple/login_multiple_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_phone/input_phone_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_view.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_view.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_view.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_birth_date_view.dart';
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
import 'package:network_app/ui/pages/home_pages/home_meeting/home_meeting_view.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/home_messages_view.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_view.dart';
import 'package:network_app/ui/pages/profile_pages/orders/orders_view.dart';
import 'package:network_app/ui/pages/home_pages/home_store/home_store_view.dart';
import 'package:network_app/ui/pages/home_pages/home_view.dart';
import 'package:network_app/ui/pages/home_pages/home_wallet/home_wallet_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/meeting_invitations_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invite_details/meeting_invite_details_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_matching/meeting_matching_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_notifications/meeting_notifications_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/check_meeting_parameters/check_meeting_parameters_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_date/choose_meeting_date_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_person/choose_meeting_person_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_type/choose_meeting_type_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/input_meeting_description/input_meeting_description_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/meeting_requests_list_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_search/meeting_search_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers_success/meeting_answers_success_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_complaint/meeting_complaint_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_first/meeting_rate_fisrt_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/meeting_rate_second_view.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_view.dart';
import 'package:network_app/ui/pages/messages_pages/chat_personal/chat_personal_view.dart';
import 'package:network_app/ui/pages/profile_pages/choose_categories/choose_categories_view.dart';
import 'package:network_app/ui/pages/profile_pages/edit_field/edit_field_view.dart';
import 'package:network_app/ui/pages/profile_pages/person_profile/person_profile_view.dart';
import 'package:network_app/ui/pages/settings_pages/avatar_edit/avatar_edit_view.dart';
import 'package:network_app/ui/pages/settings_pages/settings_main/settings_main_view.dart';
import 'package:network_app/ui/pages/store_pages/store_category/store_category_view.dart';
import 'package:network_app/ui/pages/store_pages/store_product/store_product_view.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/create_or_import.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/wallet_login_page.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange/wallet_exchange_view.dart';
import 'package:network_app/ui/pages/wallet_pages/wallet_exchange_success/wallet_exchange_success_view.dart';

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

    AutoRoute(page: SettingsMainView),
    AutoRoute(page: AvatarEditView),

    // AutoRoute(
    //   page: HomeView,
    //   guards: [AuthGuard],
    //   children: <AutoRoute>[
    //
    //   ],
    // ),
  ],
)
class $AppRouter {}

class RoutesLists {
  static const List<AutoRoute> authRoutes = [
    AutoRoute(page: StartView, initial: true),

    AutoRoute(page: WalletLoginPage),
    AutoRoute(page: WalletCreateOrImportPage),

    AutoRoute(page: ContractTestView),
    AutoRoute(page: ConnectMetamaskView),


    AutoRoute(page: LoginView),
    AutoRoute(page: LoginMultipleView),
    AutoRoute(page: LoginEmailView),
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
    // AutoRoute(page: ChooseInterestsView),
    AutoRoute(page: ChooseStatusView),
    AutoRoute(page: InputStatusView),
    AutoRoute(page: ChooseOccupationView),
    AutoRoute(page: InputOccupationView),
    AutoRoute(page: InputAboutYouView),
    AutoRoute(page: GeolocationTurnOnView),
  ];

  static const List<AutoRoute> homeRoutes = [
    // AutoRoute(page: HomeView),
    AutoRoute(page: HomeMeetingView),
    AutoRoute(page: HomeProfileView),
    AutoRoute(page: HomeWalletView),
    AutoRoute(page: HomeStoreView),
    AutoRoute(page: HomeMessagesView),
  ];

  static const List<AutoRoute> meetingRoutes = [
    AutoRoute(page: MeetingInviteDetailsView),

    AutoRoute(page: MeetingSearchView),
    AutoRoute(page: MeetingNotificationsView),
    AutoRoute(page: MeetingInvitationsView),
    AutoRoute(page: MeetingMatchingView),
    AutoRoute(page: MeetingRequestsListView),
    ...meetingRequestRoutes,
    ...meetingTimerRoutes
  ];

  static const List<AutoRoute> meetingRequestRoutes = [
    AutoRoute(page: ChooseMeetingTypeView),
    AutoRoute(page: ChooseMeetingPersonView),
    AutoRoute(page: InputDescriptionMeetingView),
    // AutoRoute(page: ChooseMeetingOccupationsView),
    // AutoRoute(page: InputMeetingOccupationView),
    // AutoRoute(page: ChooseMeetingInterestsView),
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
    AutoRoute(page: EditFieldView),
    AutoRoute(page: ChooseCategoriesView),

    AutoRoute(page: OrdersView),
  ];

  static const List<AutoRoute> walletRoutes = [
    AutoRoute(page: WalletExchangeView),
    AutoRoute(page: WalletExchangeSuccessView),
  ];

  static const List<AutoRoute> storeRoutes = [
    AutoRoute(page: StoreCategoryView),
    AutoRoute(page: StoreProductView),
  ];

  static const List<AutoRoute> messagesRoutes = [
    AutoRoute(page: ChatPersonalView),
  ];
}