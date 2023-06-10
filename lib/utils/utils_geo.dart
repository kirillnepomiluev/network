import 'package:flutter/cupertino.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:provider/provider.dart';

class UtilsGeo {
  static Future<Position?> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      showSimpleDialog(
          title: 'Недоступно',
          text: 'Опеределение геолокации отключено',
          context: context,);
      return null;
      // return Future.error('Определение геолокации отключено');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSimpleDialog(
            title: 'Недоступно',
            text: 'Опеределение геолокации отключено',
            context: context,);
        return null;
        // return Future.error('Определение геолокации отключено');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSimpleDialog(
          title: 'Недоступно',
          text:
              'Опеределение геолокации отключено навсегда, включите в настройках',
          context: context,);
      return null;
      // return Future.error(
      //     'Определение геолокации отключено навсегда, включите в настройках');
    }

    final Position position = await Geolocator.getCurrentPosition();

    // notifyListeners();

    return position;
    // .timeout(const Duration(seconds: 5)
  }

  // static Future<void> _openMap(String lat, String long) async {
  //   String googleURL =
  //       'https://www.google.com/maps/search/&api=1&query=$lat,$long';
  //
  //   await canLaunchUrlString(googleURL)
  //       ? await launchUrlString(googleURL)
  //       : throw 'Could not launch $googleURL';
  // }

  static Future<void> openMap() async {
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
  }

  static Future<bool> liveLocation(BuildContext context) async {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      showSimpleDialog(
          title: 'Недоступно',
          text: 'Опеределение геолокации отключено',
          context: context,);
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSimpleDialog(
            title: 'Недоступно',
            text: 'Опеределение геолокации отключено',
            context: context,);
        return false;
        // return Future.error('Определение геолокации отключено');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSimpleDialog(
          title: 'Недоступно',
          text:
              'Опеределение геолокации отключено навсегда, включите в настройках',
          context: context,);
      return false;
      // return Future.error(
      //     'Определение геолокации отключено навсегда, включите в настройках');
    }

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100, //каждые 100 метров будет обновлять
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {

      final lat = position.latitude;
      final long = position.longitude;
      print('live $lat $long');

      userNotifier.locationUpdateData(lat: lat, long: long);

    });

    return true;
  }

  static Future<List> getUsersByRadius({required num radius}) async {
    // const radius = 2.5;

    print('getUsersByRadius $radius');

    const myLat = 53.1299150;
    const myLong = 48.4251995; //7 после точки

    final data = await AppSupabase.client.rpc('nearby_users_by_level', params: {
      'max_distance': radius * 1000.00,
      'my_lat': myLat,
      'my_long': myLong
    },);

    for (final item in data) {
      print('${item['name']} ${item['location']} lat ${item['lat']} long ${item['long']} dist_meters ${item['dist_meters']}',);
    }

    return data;
  }

  static Future<List> getUsersInSquare() async {

    // const id1 = '6c4ba474-d378-4b64-84de-729873895b11';
    // const id2 = '8a3c903d-5be8-4551-98bb-5cef4f9ab142';
    // const id3 = 'b5fc9702-3b39-48aa-ab77-3e33b4420bf9';
    // const id4 = 'd54726fd-a7d5-447b-b43b-dcac85097776';
    const id5 = 'c9e44e05-7ed0-4c95-8f81-d023ab2ca443';
    const id = id5;

    const radius = 4.5;

    const latKm = 0.0090000;
    const longKm = 0.0150000;

    const latitude1 = 53.1299150;
    const longitude1 = 48.4251995; //7 после точки

    final maxLat = latitude1 + _getNum(latKm * radius);
    final maxLong = longitude1 + _getNum(longKm * radius);
    final minLat = latitude1 - _getNum(latKm * radius);
    final minLong = longitude1 - _getNum(longKm * radius);

    print('minLat $minLat minLong $minLong');
    print('maxLat $maxLat maxLong $maxLong');



    const lat = latitude1;
    final long = maxLong;

    await AppSupabase.client
        .from(AppSupabase.strUsers)
        .update({
      'lat': lat,
      'long': long,
      'location': 'POINT($long $lat)'
        }).eq('id', id);


    // final List data = [];
    final List data =
        await AppSupabase.client.rpc('nearby_users_square', params: {
      'my_lat': latitude1,
      'my_long': longitude1,
      'min_lat': minLat,
      'min_long': minLong,
      'max_lat': maxLat,
      'max_long': maxLong,
    },);
    for (final item in data) {
      print('${item['name']} ${item['location']} lat ${item['lat']} long ${item['long']} dist_meters ${item['dist_meters']}',);
      // print(item);
    }

    return data;
  }

  static double _getNum(value) {
    return double.parse(value.toStringAsFixed(7));
  }

  static num culcDistance({required double lat1, required double long1, required double lat2, required double long2}) {

    final distance = SphericalUtil.computeDistanceBetween(
        LatLng(lat1, long1), //lat 53.1299154 long 48.4251995
        LatLng(lat2, long2),);

    print('distance $distance');

    return distance;

    // final distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
    //     LatLng(latitude1, longitude1), //lat 53.1299154 long 48.4251995
    //     LatLng(item['lat'], item['long']));
    // print('distanceBetweenPoints $distanceBetweenPoints');
  }
}

// final data = await AppSupabase.client.rpc('nearby_users_all',params: {
//   'lat': latitude1, //40.807313,
//   'long': longitude1 //-73.946713,
// });

// final distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
//     LatLng(latitude1, longitude1), //lat 53.1299154 long 48.4251995
//     LatLng(maxLat, maxLong));
// print('distanceBetweenPoints $distanceBetweenPoints');
