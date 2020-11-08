import 'package:dio/dio.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/logger.dart';
import 'package:ufarming/utils/shared_preferences.dart';

Future login(String username, String password) async {
  try {
    Response res = await Dio()
        .post('$url/login', data: {'username': username, 'password': password});

    logger.v(res);
    if (res.data['token'] != null) {
      setToken(res.data['token']);
      return true;
    }
    return false;
  } on DioError catch (e) {
    logger.e(e);
    if (e.response != null) {
      return e.response.data['message'];
    } else {
      return ErrorMessage.connection;
    }
  } catch (e) {
    logger.e(e);
    return ErrorMessage.general;
  }
}

Future register(Map data) async {
  try {
    Response res = await Dio().post('$url/register', data: data);

    if (res.data['token'] != null) {
      setToken(res.data['token']);
      return true;
    }
    return false;
  } on DioError catch (e) {
    logger.e(e);
    if (e.response != null) {
      return e.response.data['messages'][0];
    } else {
      return ErrorMessage.connection;
    }
  } catch (e) {
    logger.e(e);
    return ErrorMessage.general;
  }
}
