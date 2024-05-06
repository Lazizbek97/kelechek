import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class StatesLocation extends AppLatLong {
  const StatesLocation({
    super.lat = 40.730610,
    super.long =  -73.935242,
  });
}

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();
  Future<bool> requestPermission();
  Future<bool> checkPermission();
  Future<String> getCurrentPlace(AppLatLong position);
 
}

class LocationService implements AppLocation {
  final defLocation = const StatesLocation();

  @override
  Future<AppLatLong> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLatLong(lat: value.latitude, long: value.longitude);
    }).catchError(
      (_) => defLocation,
    );
  }

  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

   @override
  Future<String> getCurrentPlace(AppLatLong position) async {
    String currentPosition = '';
    await placemarkFromCoordinates(position.lat, position.long)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
print(place);
      currentPosition =
          '${place.name}, ${place.street}, ${place.country}, ${place.isoCountryCode}';
    }).catchError((e) {});
    return currentPosition;
  }

  // @override
  // Future<List<yandex.MapObject>> getMarkers(AppLatLong position) async {
  //   List<yandex.MapObject> markers = [];
  //   markers.addAll(
  //     [
  //       MapObjectCollection(
  //         mapId: const MapObjectId('inner_map_object_collection'),
  //         mapObjects: [
  //           PlacemarkMapObject(
  //             mapId: const MapObjectId('inner_placemark'),
  //             point: Point(latitude: position.lat, longitude: position.long),
  //             opacity: 1,
  //             icon: PlacemarkIcon.single(
  //               PlacemarkIconStyle(
  //                 image: BitmapDescriptor.fromAssetImage(
  //                     'assets/images/map_marker.png'),
  //                 scale: 0.2,
  //               ),
  //             ),
  //           )
  //         ],
  //       )
  //     ],
  //   );
  //   return markers;
  // }
}
