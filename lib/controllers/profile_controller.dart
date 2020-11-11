import 'package:bot_toast/bot_toast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ufarming/models/user_model.dart';
import 'package:ufarming/services/user_services.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';
import 'package:ufarming/utils/formatting.dart';
import 'package:ufarming/utils/shared_preferences.dart';

class ProfileController extends GetxController {
  final Rx<User> user = User().obs;
  RxBool isLoading = true.obs;

  RxString address = ''.obs;

  void updateLocation() async {
    BotToast.showLoading();
    Position position = await Geolocator.getCurrentPosition();
    setPosition(position.latitude, position.longitude);
    address.value = await printLocation(position.latitude, position.longitude);
    BotToast.closeAllLoading();
  }

  void initLocation() async {
    Map positions = await getPosition();
    if (positions['latitude'] != null && positions['longitude'] != null) {
      address.value =
          await printLocation(positions['latitude'], positions['longitude']);
    }
  }

  @override
  void onInit() {
    fetchUserData();
    initLocation();
    super.onInit();
  }

  void fetchUserData() async {
    try {
      await getUser().then((res) {
        if (res is User) {
          updateUser(res);
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

  updateUser(User newUser) {
    user.update((val) {
      val.name = newUser.name;
      val.email = newUser.email;
      val.id = newUser.id;
      val.location = newUser.location;
      val.profilePicture = newUser.profilePicture;
      val.activePlant = newUser.activePlant;
      val.username = newUser.username;
    });
  }
}
