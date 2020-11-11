import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ufarming/controllers/profile_controller.dart';
import 'package:ufarming/models/user_model.dart';
import 'package:ufarming/services/user_services.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';
import 'package:ufarming/utils/logger.dart';

class EditProfileController extends GetxController {
  final Rx<User> user = User().obs;

  TextEditingController emailTC;
  TextEditingController nameTC;
  TextEditingController usernameTC;
  TextEditingController passTC;
  TextEditingController repassTC;

  @override
  void onInit() {
    initData();
    super.onInit();
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

  void initData() {
    var newUser = Get.find<ProfileController>().user.value;
    updateUser(newUser);

    emailTC = TextEditingController(text: user.value.email);
    nameTC = TextEditingController(text: user.value.name);
    usernameTC = TextEditingController(text: user.value.username);

    passTC = TextEditingController();
    repassTC = TextEditingController();
  }

  RxBool get fieldNotComplete => (usernameTC.text.isEmpty ||
          emailTC.text.isEmpty ||
          passTC.text.isEmpty ||
          repassTC.text.isEmpty ||
          nameTC.text.isEmpty)
      .obs;

  Future saveHandler() async {
    if (fieldNotComplete.value) {
      customBotToastText('All fields are required!');
      return;
    }

    if (repassTC.text != passTC.text) {
      return;
    }

    Map data = {
      'username': usernameTC.text,
      'email': emailTC.text,
      'password': passTC.text,
      'password_confirmation': repassTC.text,
      'name': nameTC.text,
    };

    try {
      await updateUserData(data).then((res) {
        if (res is User) {
          Get.find<ProfileController>().updateUser(res);
          Get.back();
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    }
  }

  Future updateImage() async {
    final ImagePicker picker = ImagePicker();

    final PickedFile pickedFile = await picker
        .getImage(source: ImageSource.gallery, imageQuality: 80)
        .catchError((e) {
      customBotToastText('Akses photo tidak diizinkan');
      logger.e(e);
    });

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      logger.v(file.path);

      await updateUserImage(file.path).then((res) {
        updateUser(res);
        Get.find<ProfileController>().updateUser(res);
      });
    }
  }
}
