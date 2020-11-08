import 'package:geocoding/geocoding.dart';

Future<String> printLocation(double lat, double long) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(lat, long, localeIdentifier: 'id_ID');
  return '${placemarks[0].subLocality}, ${placemarks[0].administrativeArea}';
}
