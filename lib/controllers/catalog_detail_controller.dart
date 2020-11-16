import 'package:get/get.dart';
import 'package:ufarming/models/plant_detail_model.dart';
import 'package:ufarming/services/plant_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class CatalogDetailController extends GetxController {
  final Rx<PlantDetail> plant = PlantDetail().obs;
  String id;
  RxBool isLoading = true.obs;

  CatalogDetailController(this.id);

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      await getPlant(id).then((res) {
        if (res is PlantDetail) {
          updateData(res);
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

  updateData(PlantDetail newPlant) {
    plant.update((val) {
      val.article = newPlant.article;
      val.plant = newPlant.plant;
      val.statistic = newPlant.statistic;
    });
  }
}
