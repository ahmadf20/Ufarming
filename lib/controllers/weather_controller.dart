import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ufarming/models/weather_model.dart';
import 'package:ufarming/services/weather_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class WeatherController extends GetxController {
  final Rx<Weather> weather = Weather().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      await getWeatherData('-6.8446067', '107.543945').then((res) {
        if (res is Weather) {
          updateLocalData(res);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      isLoading.toggle();
    }
  }

  updateLocalData(Weather newData) {
    weather.update((val) {
      val.current = newData.current;
      val.forecast = newData.forecast;
      val.location = newData.location;
    });
  }
}
