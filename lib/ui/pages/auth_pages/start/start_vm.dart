import 'package:auto_route/auto_route.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StartViewModel extends ViewModel {
  StartViewModel(this.context) {
    getInit();
  }
  final BuildContext context;

  final controller = TextEditingController();


  Future<void> getInit() async {

    if (AppSupabase.client.auth.currentUser == null) {
      print('Не авторизован');
      context.router.push(const LoginViewRoute());
      // context.router.push(ContractTestViewRoute());

    } else {


      print('Авторизован');

      final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      userNotifier.setCurrentID(AppSupabase.client.auth.currentUser!.id);
      await userNotifier.setUserDataFunc();

      Utils.checkReg(context);

      // // context.router.push(const ConnectMetamaskViewRoute());
      // context.router.push(ContractTestViewRoute());
    }
  }

  Future<void> onTap() async {

    AppSupabase.client.auth.signOut();
    // setNetwork();

    // final deviceInfoPlugin = DeviceInfoPlugin();
    // final deviceInfo = await deviceInfoPlugin.deviceInfo;
    // final allInfo = deviceInfo.data;

    // print('allInfo $allInfo');

    // _getCurrentLocation();

    // _liveLocation();

  }





  double lat = 0;
  double long = 0;

  String strLocation = '';

  final jwtsecret = 'zhLvPhnmjpEAzYWsiUEY035UfQqvfw11tr9nHwcnKBmaj/h8Mi1c5Ho1k1xa5eCmaKVdEmM2bC4B7f5CvTua3A==';


  Future<void> jwtGet() async {
// Create a json web token
// Pass the payload to be sent in the form of a map

    final jwt = JWT(
      // Payload
      {
        // 'id': 123,
        // 'server': {
        //   'id': '3e4fc296',
        //   'loc': 'euw-2',
        // }
      },

      issuer: 'supabase',
      audience: Audience.one('authenticated'),
      subject: '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17',
      // jwtId: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBraWFxcmdja214ZG5xbGVya21mIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjM5Mzc2NzAsImV4cCI6MTk3OTUxMzY3MH0.7cmkp5glMfwICqPBtxan8f8W02vdtjZb8zVVjgdEgvo'
      //{
      //   "iss": "supabase",
      //   "ref": "pkiaqrgckmxdnqlerkmf",
      //   "role": "anon",
      //   "iat": 1663937670,
      //   "exp": 1979513670
      // }
    );

    // Sign it (default with HS256 algorithm)
    final token = jwt.sign(SecretKey(jwtsecret));

    print('Signed token: $token\n');

    AppSupabase.client.from(AppSupabase.strUsers).insert({},);

  }


  Future<void> jwtTest() async {

    final token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2ODQyNTExMTAsImF1ZCI6ImF1dGhlbnRpY2F0ZWQiLCJzdWIiOiIweDA5QmU2ZDNGZjVhMkExMTBlMjExMTdlMUZGNjlENTVFNjFjQjViMTciLCJpc3MiOiJzdXBhYmFzZSJ9.OZ7kHa_Tk1yXM5zIywPGvUhxX3BiMF64jWzx9cqRy5E';

    // final res = await AppSupabase.client.functions.invoke(
    //   'hello-world',
    //   body: {'name': 'baa'},
    //   headers: {
    //     // 'Authorization': 'Bearer ${AppSupabase.client.auth.currentSession?.accessToken}'
    //     'Authorization': token
    //   },
    // );
    // print(res.status);
    // print(res.data);


    // const supabase = createClient("https://xyzcompany.supabase.co", "public-anon-key")
    // final test = await AppSupabase.client.auth.setSession(token);
    // print('test $test');

  }




  Future<void> testBlueTooth() async {

  }

  Future<void> setNetwork() async {
    final info = NetworkInfo();

    var locationStatus = await Permission.location.status;

    print('locationStatus $locationStatus');

    if (locationStatus.isDenied) {
      await Permission.locationWhenInUse.request();
    }
    if (await Permission.location.isRestricted) {
      openAppSettings();
    }

    if (await Permission.location.isGranted) {
          final wifiName = await info.getWifiName(); // "FooNetwork"
          final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
          final wifiIP = await info.getWifiIP(); // 192.168.1.43
          final wifiIPv6 = await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
          final wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
          final wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
          final wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1
      print('wifiName $wifiName $wifiBSSID $wifiIP $wifiIPv6 $wifiSubmask $wifiBroadcast $wifiGateway');
    }

    //    final info = NetworkInfo();
    //


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

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      return Future.error('Определение геолокации отключено');
    }

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

    final position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    long = position.longitude;

    print('lat $lat long $long');

    notifyListeners();

    return position;
    // .timeout(const Duration(seconds: 5)
  }


  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/&api=1&query=$lat,$long';

    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }


  Future<void> openMap() async {
    // _openMap(lat, long);
    ////////////////////////


    // final availableMaps = await MapLauncher.installedMaps;
    // print(
    //     availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]
    //
    // await availableMaps.first.showMarker(
    //   coords: Coords(lat, long),
    //   title: 'Ваше местоположение',
    // );
    ///////////////////////

    final distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
        // LatLng(51.5073509, -0.1277583),
        // LatLng(48.856614, 2.3522219)
        LatLng(53.1299154, 48.4251995), //lat 53.1299154 long 48.4251995
        LatLng(53.1287946, 48.4246461)
    );

    print('distanceBetweenPoints $distanceBetweenPoints');

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
