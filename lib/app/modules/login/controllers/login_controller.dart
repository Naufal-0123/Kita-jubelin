import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final isLoading = false.obs;
  final hiddenPassword = true.obs;
  changeEye() => hiddenPassword.toggle();
  final count = 0.obs;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  login() async {
    Uri urlApi = Uri.parse("${dotenv.env['BASE_URL']}auth/login");
    Map data = {
      "email": email.text,
      "password": password.text,
    };
    var body = json.encode(data);

    final response = await http.post(urlApi,
        headers: {"Content-Type": "application/json"}, body: body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log("Berhasil Login");
      UserLogin login = userLoginFromJson(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("login", response.body.toString());
      Get.offAllNamed(Routes.HOME, arguments: data);
      log("data saved");
      Get.snackbar("Success", "Berhasil login");
    } else {
      log("login failed");
      Get.defaultDialog(
          title: "failed", middleText: 'Password dan Email tidak cocok');
    }
  }

  @override
  void onInit() {
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
