import 'package:bot_toast/bot_toast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ufarming/utils/formatting.dart';
import 'package:ufarming/utils/logger.dart';
import 'package:ufarming/utils/shared_preferences.dart';

class HomeController extends GetxController {
  RxString address = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  void updateLocation() async {
    BotToast.showLoading();
    Position position = await Geolocator.getCurrentPosition();
    setPosition(position.latitude, position.longitude);
    updateLatLong(position.latitude, position.longitude);
    address.value = await printLocation(position.latitude, position.longitude);

    logger.v(position);
    BotToast.closeAllLoading();
  }

  void initLocation() async {
    Map positions = await getPosition();
    logger.i(positions);
    if (positions['latitude'] != null && positions['longitude'] != null) {
      address.value =
          await printLocation(positions['latitude'], positions['longitude']);
      updateLatLong(positions['latitude'], positions['longitude']);
      address.refresh();
    } else {
      updateLocation();
    }
  }

  void updateLatLong(double latitude, double longitude) {
    lat.value = latitude;
    long.value = longitude;
  }

  @override
  void onInit() {
    initLocation();
    super.onInit();
  }
}
