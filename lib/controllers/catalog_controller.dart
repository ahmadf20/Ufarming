import 'package:get/get.dart';
import 'package:ufarming/models/plant_model.dart';
import 'package:ufarming/services/plant_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class CatalogControlller extends GetxController {
  final RxList plants = [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      await getAllPlants().then((res) {
        if (res is List<Plant>) {
          plants.addAll(res);
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
}
