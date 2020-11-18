import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/models/plant_model.dart';
import 'package:ufarming/services/plant_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class CatalogControlller extends GetxController {
  final RxList plants = <Plant>[].obs;
  RxBool isLoading = true.obs;
  RxString query = ''.obs;

  TextEditingController searchTC;

  @override
  void onInit() {
    fetchData();
    searchTC = TextEditingController(text: '');
    super.onInit();
  }

  get plantList => plants
      .where((v) => v.plantName.toString().toLowerCase().contains(
            query.value,
          ))
      .toList();

  void updateQuery(String text) {
    query.value = text;
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
