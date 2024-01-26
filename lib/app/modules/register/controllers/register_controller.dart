import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/model.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final isLoading = false.obs;
  final hiddenPassword = true.obs;
  changeEye() => hiddenPassword.toggle();
  final count = 0.obs;

  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();

  register() async {
    Uri urlApi = Uri.parse("${dotenv.env['BASE_URL']}auth/register");
    Map data = {
      "nama": nama.text,
      "email": email.text,
      "phone": noTelp.text,
      "alamat": alamat.text,
      "password": password.text,
    };
    var body = json.encode(data);

    final response = await http.post(urlApi,
        headers: {"Content-Type": "application/json"}, body: body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log("Berhasil Register");
      UserRegister register = userRegisterFromJson(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("register", response.body.toString());
      Get.offAllNamed(Routes.LOGIN, arguments: data);
      log("data saved");
      Get.snackbar("Success", "Berhasil registe");
    } else {
      log("register failed");
      Get.defaultDialog(
          title: "failed", middleText: 'Terjadi kesalahan');
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
