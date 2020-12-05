import 'package:get/get.dart';
import 'package:ufarming/models/weather_model.dart';
import 'package:ufarming/services/weather_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class WeatherController extends GetxController {
  final Rx<Weather> weather = Weather().obs;
  RxBool isLoading = true.obs;

  void fetchData(String lat, String long) async {
    try {
      await getWeatherData(lat ?? '-6.121435', long ?? '106.774124')
          .then((res) {
        if (res is Weather) {
          updateLocalData(res);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      if (isLoading.value) isLoading.toggle();
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
