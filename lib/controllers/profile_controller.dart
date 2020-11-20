import 'package:get/get.dart';
import 'package:ufarming/models/user_model.dart';
import 'package:ufarming/services/user_services.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class ProfileController extends GetxController {
  final Rx<User> user = User().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchUserData();
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
