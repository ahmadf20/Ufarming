import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/models/activity_model.dart';
import 'package:ufarming/models/checklist_model.dart';
import 'package:ufarming/models/myplant_model.dart';
import 'package:ufarming/models/plant_detail_model.dart';
import 'package:ufarming/services/plant_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

import 'home_controller.dart';

class MyPlantDetailController extends GetxController {
  final Rx<PlantDetail> plant = PlantDetail().obs;
  final RxList<CheckList> checkList = <CheckList>[].obs;
  final RxList<Activity> activities = <Activity>[].obs;

  String id;
  String idPlant;
  RxBool isLoading = true.obs;
  RxBool isLoadingChecklist = true.obs;
  RxBool isLoadingActivity = true.obs;

  TextEditingController controller = TextEditingController();

  MyPlantDetailController(this.id, this.idPlant);

  @override
  void onInit() {
    fetchData();
    fetchCheckList();
    fetchActivities();
    super.onInit();
  }

  void fetchData() async {
    try {
      await getPlant(idPlant).then((res) {
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

  void fetchCheckList() async {
    try {
      await getPlantChecklist(id).then((res) {
        if (res is List<CheckList>) {
          checkList.addAll(res);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      isLoadingChecklist.toggle();
    }
  }

  void checkAction(String id) async {
    BotToast.showLoading();
    try {
      await doChecklist(id).then((res) {
        if (res is CheckList) {
          checkList[checkList.indexWhere((v) => v.id == res.id)] = res;
          Get.find<HomeController>().updateFinishTask(
              this.id, checkList.where((v) => v.isChecked).length);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  void fetchActivities() async {
    try {
      await getPlantActivity(id).then((res) {
        if (res is List<Activity>) {
          activities.addAll(res);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      isLoadingActivity.toggle();
    }
  }

  void postActivity(String id) async {
    BotToast.showLoading();
    try {
      await postPlantActivity(id, controller.text).then((res) {
        if (res is Activity) {
          activities.add(res);
          controller.clear();
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  void delActivity(String id) async {
    BotToast.showLoading();
    try {
      await deleteActivity(id).then((res) {
        if (res is bool) {
          activities.removeWhere((v) => v.id == id);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  void delMyPlant() async {
    BotToast.showLoading();
    try {
      await deleteMyPlant(id).then((res) {
        if (res is bool) {
          Get.find<HomeController>().myPlants.removeWhere((v) => v.id == id);
          Get.back();
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  void addMyPlantHandler() async {
    try {
      BotToast.showLoading();
      await addMyPlant(id, controller.text).then((res) {
        if (res == true) {
          Get.find<HomeController>().fetchData();
          Get.back();
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      BotToast.closeAllLoading();
    }
  }

  void finishGrowingHandler() async {
    try {
      BotToast.showLoading();
      await finishGrowing(id).then((res) {
        if (res is MyPlant) {
          var myPlants = Get.find<HomeController>().myPlants;
          MyPlant temp = myPlants[myPlants.indexWhere((v) => v.id == id)]
            ..isDone = res.isDone
            ..progress = res.progress;
          Get.find<HomeController>().updatePlantData(this.id, temp);
        }
      });
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
