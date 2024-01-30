import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/model.dart';
import '../../../routes/app_pages.dart';

class CreateController extends GetxController {
  //TODO: Implement CreateController
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController rating = TextEditingController();
  final count = 0.obs;

  create() async {
    Uri urlApi = Uri.parse("${dotenv.env['BASE_URL']}produk/create");

    Map data = {
      "nama": nama.text,
      "harga": harga.text,
      "rating": rating.text,
      "stok": stok.text,
    };
    print(data);
    var body = json.encode(data);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? login = preferences.getString("login");
    UserLogin barang = userLoginFromJson(login!);
    String token = "Bearer " + barang.token;
    final response = await http.post(
      urlApi,
      headers: {
        "Content-Type": "application/json",
        'Authorization': "${token}"
      },
      body: body,
    );

    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 201) {
      Get.offAllNamed(Routes.HOME);
      Get.snackbar("Success", "Berhasil membuat");
    } else {
      Get.snackbar("Failed", "Gagal membuat");
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
