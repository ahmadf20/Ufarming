import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/home_controller.dart';
import 'package:ufarming/models/plant_detail_model.dart';
import 'package:ufarming/services/plant_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class MyPlantDetailController extends GetxController {
  final Rx<PlantDetail> plant = PlantDetail().obs;
  String id;
  RxBool isLoading = true.obs;

  TextEditingController controller = TextEditingController();

  MyPlantDetailController(this.id);

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

  void addActivityHandler() async {
    try {
      BotToast.showLoading();
      // await addMyPlant(id, controller.text).then((res) {
      //   if (res == true) {

      //   }
      // });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      BotToast.closeAllLoading();
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
