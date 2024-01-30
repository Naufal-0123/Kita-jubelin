// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  TextEditingController search = TextEditingController();
  List<Barang> barang = [];
  List<Barang> filter = [];
  RxString tes = "".obs;
  int jumlahBarang = 0;
  String keyword = "";

  final count = 0.obs;
  RxInt jumlahFilter = 0.obs;

  getBarang() async {
    print("Get Barang Items Controller");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? login = preferences.getString("login");
    UserLogin data = userLoginFromJson(login!);
    String token = "Bearer " + data.token;
    print(token);
    Uri urlApi = Uri.parse("${dotenv.env['BASE_URL']}produk/list");
    final response = await http.get(urlApi, headers: {"Authorization": token});
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("succes mengambil data");
      print(response.body);
      ListBarang result = listBarangFromJson(response.body);
      barang = result.list;
      filter = result.list;
      jumlahBarang = barang.length;
      jumlahFilter.value = filter.length;
    } else {
      print("gagal mengambil data");
    }
  }

  void getSearch() {
    // Mendapatkan kata kunci pencarian
    String keyword = search.text.toLowerCase();

    // Filtering berdasarkan nama, harga, rating, dan stok
    filter = barang
        .where((element) =>
            element.nama.toLowerCase().contains(keyword) ||
            element.harga.toString().contains(keyword) ||
            element.rating.toString().contains(keyword) ||
            element.stok.toString().contains(keyword))
        .toList();

    // Menampilkan hasil filter
    print("ok");
    print(filter.length);
    jumlahFilter.value = filter.length;
  }

  @override
  void onInit() {
    getBarang();
    super.onInit();
  }

  @override
  void onReady() {
    getBarang();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
