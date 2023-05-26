import 'package:flutter/cupertino.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UtilsGeo{

  static Future<Position?> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled == false) {
      showSimpleDialog(title: 'Недоступно', text: 'Опеределение геолокации отключено', context: context);
      return null;
      // return Future.error('Определение геолокации отключено');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSimpleDialog(title: 'Недоступно', text: 'Опеределение геолокации отключено', context: context);
        return null;
        // return Future.error('Определение геолокации отключено');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSimpleDialog(title: 'Недоступно', text: 'Опеределение геолокации отключено навсегда, включите в настройках', context: context);
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
      showSimpleDialog(title: 'Недоступно', text: 'Опеределение геолокации отключено', context: context);
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSimpleDialog(title: 'Недоступно', text: 'Опеределение геолокации отключено', context: context);
        return false;
        // return Future.error('Определение геолокации отключено');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSimpleDialog(title: 'Недоступно', text: 'Опеределение геолокации отключено навсегда, включите в настройках', context: context);
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

      userNotifier.updateData(newData: {
        'lat' : lat,
        'long' : long,
        'location' : 'POINT($lat $long)'
      });

    });

    return true;

  }


  static Future<List> getUsersByRadius() async {
    const radius = 10;
    const latKm = 0.0090000;
    const longKm = 0.0150000;

    const latitude1 = 53.1299150;
    const longitude1 = 48.4251995;

    const maxLat = latitude1 + (latKm * radius);
    const maxLong = longitude1 + (longKm * radius);

    const minLat = latitude1 - (latKm * radius);
    const minLong = longitude1 - (longKm * radius);

    print('minLat $minLat minLong $minLong');
    print('maxLat $maxLat maxLong $maxLong');

    // const latitude2 = 53.1287946;
    // const longitude2 = 48.4246461;

    // final distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
    //   // LatLng(51.5073509, -0.1277583),
    //   // LatLng(48.856614, 2.3522219)
    //     LatLng(latitude1, longitude1), //lat 53.1299154 long 48.4251995
    //     LatLng(maxLat, maxLong));
    // print('distanceBetweenPoints $distanceBetweenPoints');

    // final data = await AppSupabase.client.rpc('nearby_users_all',params: {
    //   'lat': latitude1, //40.807313,
    //   'long': longitude1 //-73.946713,
    // });

    final List data = await AppSupabase.client.rpc('nearby_users_square', params: {
      'min_lat': minLat,
      'min_long': minLong,
      'max_lat': maxLat,
      'max_long': maxLong,
    });

    // final data = await AppSupabase.client.rpc('restaurants_in_view', params: {
    //   'min_lat': 40.807,
    //   'min_long': -73.946,
    //   'max_lat': 40.808,
    //   'max_long': -73.945,
    // });

    // final data = await AppSupabase.client.rpc('nearby_restaurants',params: {
    //   'lat': 40.807313,
    //   'long': -73.946713,
    // });

    // print('data $data');

    final list = data.where((element) => element['dist_meters']!=null).toList();

    for (final item in data) {
      print(item);
    }

    return data;

  }

}
