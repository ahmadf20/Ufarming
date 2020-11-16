import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ufarming/models/plant_detail_model.dart';
import 'package:ufarming/models/plant_model.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/functions.dart';
import 'package:ufarming/utils/logger.dart';

Future getAllPlants() async {
  try {
    Response res = await Dio().get('$url/plants',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['plants']);

    logger.v(responseJson);

    if (res.data['plants'] != null) {
      return plantsFromJson(responseJson);
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

Future getPlant(String id) async {
  try {
    Response res = await Dio().get('$url/plants/detail/$id',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data);

    logger.v(responseJson);

    if (res.data['plant'] != null) {
      return plantDetailFromJson(responseJson);
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
