import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/blockchain/home_page.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:map_launcher/map_launcher.dart';

class StartViewModel extends ViewModel {
  StartViewModel(this.context) {
    getInit();
  }
  final BuildContext context;

  final controller = TextEditingController();

  Future<void> getInit() async {

    // context.router.push(ConnectMetamaskViewRoute());
    // context.router.push(ContractTestViewRoute());

    if (AppSupabase.client.auth.currentUser == null) {
      context.router.push(const LoginViewRoute());
    } else {
      final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      userNotifier.setCurrentID(AppSupabase.client.auth.currentUser!.id);
      await userNotifier.setUserDataFunc();
      Utils.checkReg(context);
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // if (serviceEnabled == false) {
    //   return Future.error('Определение геолокации отключено');
    // }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Определение геолокации отключено');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Определение геолокации отключено навсегда, включите в настройках');
    }

    return await Geolocator.getCurrentPosition();
        // .timeout(const Duration(seconds: 5)
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100, //каждые 100 метров будет обновлять
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude;
      long = position.longitude;
      print('$lat $long');
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/&api=1&query=$lat,$long';

    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  double lat = 0;
  double long = 0;

  String strLocation = '';

  Future<void> onTap() async {
    final result = await _getCurrentLocation();
    lat = result.latitude;
    long = result.longitude;

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        lat,
        long,
      );
      print(placemarks[0]);
      // print(placemarks[0].country);

      strLocation = '${placemarks[0].country}, ${placemarks[0].name}';

    } catch (err) {
      print('Ошибка определения места: $err');
    }

    print('result $lat $long');
    notifyListeners();
    // _liveLocation();
  }

  Future<void> openMap() async {
    // _openMap(lat, long);
    final availableMaps = await MapLauncher.installedMaps;
    print(
        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    await availableMaps.first.showMarker(
      coords: Coords(lat, long),
      title: 'Ваше местоположение',
    );
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
