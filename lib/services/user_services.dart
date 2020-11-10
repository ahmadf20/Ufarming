import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ufarming/models/user_model.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/functions.dart';
import 'package:ufarming/utils/logger.dart';
import 'package:ufarming/utils/shared_preferences.dart';

Future getUser() async {
  try {
    Response res = await Dio().get('$url/profile',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));
    String responseJson = json.encode(res.data['user']);

    logger.v(responseJson);

    if (res.data['user'] != null) {
      return userFromJson(responseJson);
    } else {
      return 'Failed to fetch data';
    }
  } on DioError catch (e) {
    logger.e(e);
    if (e.response != null) {
      return e.response.data;
    } else {
      return ErrorMessage.connection;
    }
  } catch (e) {
    logger.e(e);
    return ErrorMessage.general;
  }
}

Future updateUserData(Map data) async {
  try {
    Response res = await Dio().post('$url/profile',
        data: data,
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));
    String responseJson = json.encode(res.data['user']);

    logger.v(responseJson);

    if (res.data['user'] != null) {
      return userFromJson(responseJson);
    } else {
      return 'Failed to fetch data';
    }
  } on DioError catch (e) {
    logger.e(e);
    if (e.response != null) {
      if (e.response.data['email'] != null) return e.response.data['email'][0];
      if (e.response.data['username'] != null)
        return e.response.data['username'][0];
    } else {
      return ErrorMessage.connection;
    }
  } catch (e) {
    logger.e(e);
    return ErrorMessage.general;
  }
}

Future updateUserImage(String filePath) async {
  try {
    Response res = await Dio().post(
      '$url/update_pic',
      data: FormData.fromMap({
        'foto': await MultipartFile.fromFile(filePath),
      }),
      options: Options(
        headers: {
          'Authorization': 'Bearer ${await getToken()}',
        },
        responseType: ResponseType.json,
      ),
      onSendProgress: (received, total) {
        if (total != -1) {
          logger.v((received / total * 100).toStringAsFixed(0) + "%");
        }
      },
    );

    String responseJson = json.encode(res.data['user']);
    logger.v(responseJson);

    if (res.data['user'] != null) {
      return userFromJson(responseJson);
    } else {
      return 'Failed to fetch data';
    }
  } on DioError catch (e) {
    logger.e(e);
    if (e.response != null) {
      if (e.response.data['message'] != null) return e.response.data['message'];
    } else {
      return ErrorMessage.connection;
    }
  } catch (e) {
    logger.e(e);
    return ErrorMessage.general;
  }
}
