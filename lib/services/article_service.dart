import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ufarming/models/article_model.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/functions.dart';
import 'package:ufarming/utils/logger.dart';

Future getAllArticles() async {
  try {
    Response res = await Dio().get('$url/articles',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['articles']);

    logger.v(responseJson);

    if (res.data['articles'] != null) {
      return articleFromJson(responseJson);
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
