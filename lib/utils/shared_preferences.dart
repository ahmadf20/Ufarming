import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufarming/utils/logger.dart';

void setToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<bool> logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.clear();
}

void setPosition(double latitude, double longitude) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('latitude', latitude);
  await prefs.setDouble('longitude', longitude);
}

Future<Map<String, double>> getPosition() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, double> position;
  try {
    position = {
      'latitude': prefs.getDouble('latitude'),
      'longitude': prefs.getDouble('longitude')
    };
  } catch (e) {
    logger.e(e);
  }
  return position;
}
