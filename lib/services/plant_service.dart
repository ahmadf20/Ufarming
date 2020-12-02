import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ufarming/models/activity_model.dart';
import 'package:ufarming/models/checklist_model.dart';
import 'package:ufarming/models/myplant_model.dart';
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

Future addMyPlant(String id, String name) async {
  try {
    Response res = await Dio().post('$url/my_plants',
        queryParameters: {
          "id_plant": id,
          "name": name,
        },
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data);

    logger.v(responseJson);

    if (res.data['status'] == 201) {
      return MyPlant.fromJson(res.data['data']);
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

Future getMyPlants() async {
  try {
    Response res = await Dio().get('$url/my_plants',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return myPlantFromJson(responseJson);
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

Future getPlantChecklist(String id) async {
  try {
    Response res = await Dio().get('$url/checklist/$id',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return checkListFromJson(responseJson);
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

Future doChecklist(String id) async {
  try {
    Response res = await Dio().put('$url/checklist/check',
        queryParameters: {
          "id": id,
        },
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return CheckList.fromJson(res.data['data']);
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

Future getPlantActivity(String id) async {
  try {
    Response res = await Dio().get('$url/activity/$id',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['activity']);

    logger.v(responseJson);

    if (res.data['activity'] != null) {
      return activityFromJson(responseJson);
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

Future postPlantActivity(String id, String title) async {
  try {
    Response res = await Dio().post('$url/activity/new',
        queryParameters: {
          "title": title,
          "id_myplant": id,
        },
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return Activity.fromJson(res.data['data']);
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

Future postDefaultChecklist(String id) async {
  try {
    Response res = await Dio().post('$url/checklist/default',
        queryParameters: {
          "id_myplant": id,
        },
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return activityFromJson(responseJson);
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

Future deleteActivity(String id) async {
  try {
    Response res = await Dio().delete('$url/activity/$id',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return true;
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

Future deleteMyPlant(String id) async {
  try {
    Response res = await Dio().delete('$url/myplant/$id',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return true;
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

Future finishGrowing(String id) async {
  try {
    Response res = await Dio().post('$url/my_plant/$id',
        options: Options(
          headers: await getHeader(),
          responseType: ResponseType.json,
        ));

    String responseJson = json.encode(res.data['data']);

    logger.v(responseJson);

    if (res.data['data'] != null) {
      return MyPlant.fromJson(res.data['data']);
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
