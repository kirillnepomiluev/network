import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';


class StartViewModel extends ViewModel {
  final BuildContext context;
  StartViewModel(this.context) {
    getInit();
  }

  Future<void> getInit() async {
    if (AppSupabase.client.auth.currentUser == null) {
      print('Не авторизован');
      context.router.push(const LoginViewRoute());
      // context.router.push(ContractTestViewRoute());
    } else {
      print('Авторизован');

      Utils.checkReg(context);
      // context.router.push(const ConnectMetamaskViewRoute());


      // final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      // final settingsNotifier = Provider.of<SettingsNotifier>(context, listen: false);
      // userNotifier.setCurrentID(AppSupabase.client.auth.currentUser!.id);
      // await userNotifier.setUserDataFunc();
      // await settingsNotifier.setSettings(context);


      // final meetingModel = MeetingModel.emptyModel();
      // context.router.push(MeetingRateFirstViewRoute(meetingModel: meetingModel));


      // context.router.push(ContractTestViewRoute());
    }
  }

  Future<void> onTap() async {


    // const id = '6c4ba474-d378-4b64-84de-729873895b11';


    // UtilsGeo.getUsersByRadius();
    // UtilsGeo.getUsersInSquare();


    // const lat = 53.1299150;
    // const long = 48.4251995;

  }
}

// Widget build(BuildContext context) {
//   return ViewModelBuilder<VM>(
//       createModelDataEx: () => VM(context),
//       builder: (context, model) {
//         return Scaffold();
//       });
// }

// import 'package:flutter/material.dart';
// import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
// class TViewModel extends ViewModel {
//   final BuildContext context;
//   TViewModel(this.context);
// }

// void test(){
//   // await FacebookAuth.instance.login(
//   //   permissions: ["public_profile", "email"]).then((value) {
//   //
//   //     FacebookAuth.instance.getUserData().then((userData) async{
//   //       print('userData - $userData');
//   //     });
//   //
//   // });
//   // FacebookAuth.instance.logOut();
//
//   // bool isSuccess = await AuthService().signInByFacebook();
//
//   // const url = 'https://flutter.io';
//   // const url = 'http://localhost:3000/#access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjc0MzAzMTkxLCJzdWIiOiI4ZGFkOWY2Ny0zYTM3LTRlZWEtODg3ZS1jMGFiN2FmMTU3MjAiLCJlbWFpbCI6Im1pc3RlcnhydTI3OEBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIiwiZmFjZWJvb2siLCJnb29nbGUiXX0sInVzZXJfbWV0YWRhdGEiOnsiYXZhdGFyX3VybCI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FFZEZUcDdsZUlHTFZXVEZMeEdzZW9fZUgxc2dMMlBkWEMyTm4tNDNOT2tOTmc9czk2LWMiLCJlbWFpbCI6Im1pc3RlcnhydTI3OEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZnVsbF9uYW1lIjoi0KjQsNGF0LfQvtC0IiwiaXNzIjoiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vdXNlcmluZm8vdjIvbWUiLCJuYW1lIjoi0KjQsNGF0LfQvtC0Iiwibmlja25hbWUiOiLQqNCw0YXQt9C-0LQg0KjQsNGA0LjQv9C-0LIiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwN2xlSUdMVldURkx4R3Nlb19lSDFzZ0wyUGRYQzJObi00M05Pa05OZz1zOTYtYyIsInByb3ZpZGVyX2lkIjoiMTE4MzQ4Nzg4MTA4NDA2Njg5NTY0Iiwic2x1ZyI6ItCo0LDRhdC30L7QtCDQqNCw0YDQuNC_0L7QsiIsInN1YiI6IjExODM0ODc4ODEwODQwNjY4OTU2NCJ9LCJyb2xlIjoiYXV0aGVudGljYXRlZCIsImFhbCI6ImFhbDEiLCJhbXIiOlt7Im1ldGhvZCI6Im9hdXRoIiwidGltZXN0YW1wIjoxNjc0Mjk5NTkxfV0sInNlc3Npb25faWQiOiJkNjVkMjlkMC01NGM3LTQ2MDYtOTk0OC1lM2JlNDdkYjNjYjcifQ.s5Wnvih3js0BMwZCfbIjXMyiPMHYpMOzbu4kl92Vlu4&expires_in=3600&provider_token=ya29.a0AX9GBdV8-AyNg8AbAGYUo8vBoO_CV2_T1lhLY_u_cjtX2ilrpKy2l5qLwaFZcla2r08y1QhFrJJ8sHODBlnicBChePtvn-Mg4sILZ1-UFD-m_rw-WkSSbyl8lEvreeHTzNzupcs-4s45WjqXwDccp6JLSf7JaCgYKARwSARISFQHUCsbCXCYerHL0bPgZEpM5EYCwNg0163&refresh_token=MjX5SUvLk3B3AmN81irp6g&token_type=bearer';
//   // final uri = Uri.parse(url);
//   // if (await canLaunchUrl(uri)) {
//   //   await launchUrl(uri);
//   // } else {
//   //   throw 'Could not launch $url';
//   // }
//
//   // bool isSuccess = await AuthService().signInByGoogle();
//   // print('isSuccess $isSuccess');
//
//   // await Supabase.instance.client.auth.signOut();
//
//   if(Supabase.instance.client.auth.currentUser==null){
//     print('не авторизован');
//     context.router.push(const LoginViewRoute());
//   }
//   else{
//     final id = Supabase.instance.client.auth.currentUser!.id;
//     print('id $id');
//     // context.router.push(HomeViewRoute(initIndex: 0),);
//     context.router.push(const RegSuccessViewRoute());
//   }
//   // context.router.push(ChatPersonalViewRoute());
// }
