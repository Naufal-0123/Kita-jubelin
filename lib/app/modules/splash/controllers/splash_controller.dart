// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() async {
    print("init jalan");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? login = preferences.getString("login");
    log("=============================");
    // log(login!);
    print(login);
    log("=============================");

    if (login == "" || login == null) {
      Timer(Duration(seconds: 3), () {
        Get.toNamed(Routes.LOGIN);
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Get.toNamed(Routes.HOME);
      });
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
