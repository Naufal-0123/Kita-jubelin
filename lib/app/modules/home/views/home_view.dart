// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../../login/views/login_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: TextField(
            keyboardType: TextInputType.text,
            controller: controller.search,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(
                  255, 255, 255, 255), // Warna latar belakang TextFormField
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              hintText: "Cari barang",
              suffixIcon: Icon(
                Icons.search,
                size: 25,
              ),
              iconColor: Colors.black,
            ),
            onChanged: (value) {
              controller.getSearch();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 8,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 0, 255, 204)),
                                height: 100,
                                width: 440,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          Get.offAllNamed(Routes.HAMPER),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        margin: EdgeInsets.only(
                                            top: 2, left: 80, right: 20),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 8,
                                              offset: Offset(1, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () => Get.offAllNamed(
                                                  Routes.HAMPER),
                                              icon: Icon(
                                                Icons.shop_two_outlined,
                                                size: 25,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              ),
                                            ),
                                            Text(
                                              "Keranjang",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 255, 204)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          Get.offAllNamed(Routes.CREATE),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        margin: EdgeInsets.only(top: 2),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 8,
                                              offset: Offset(1, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () => Get.offAllNamed(
                                                  Routes.CREATE),
                                              icon: Icon(
                                                Icons.add_box_outlined,
                                                size: 25,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              ),
                                            ),
                                            Text(
                                              "Tambah",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 255, 204)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        Get.defaultDialog(
                                            title: "Ingin logout?",
                                            middleText:
                                                "Apakah anda yakin ingin logout?",
                                            confirm: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue),
                                                onPressed: () async {
                                                  SharedPreferences pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  await pref.clear();
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoginView()),
                                                          (route) => false);
                                                },
                                                child: Text(
                                                  "Ya",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            cancel: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                                onPressed: () => Get.back(),
                                                child: Text("Tidak",
                                                    style: TextStyle(
                                                        color: Colors.white))));
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        margin:
                                            EdgeInsets.only(top: 2, left: 20),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 8,
                                              offset: Offset(1, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Icon(
                                                Icons.exit_to_app_outlined,
                                                size: 25,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              ),
                                            ),
                                            Text(
                                              "LogOut",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 255, 204)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FutureBuilder(
                              future: controller.getBarang(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Obx(() => Wrap(
                                      spacing: 30,
                                      runSpacing: 30,
                                      children: List.generate(
                                          controller.jumlahFilter.value,
                                          (index) {
                                        final data = controller.filter[index];
                                        return Container(
                                          width: 150,
                                          height: 150,
                                          margin: EdgeInsets.only(top: 15),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 8,
                                                offset: Offset(1, 1),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color.fromARGB(
                                                255, 0, 255, 204),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(data.nama,
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  )),
                                              SizedBox(
                                                height: 45,
                                              ),
                                              Container(
                                                height: 60,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 8,
                                                        offset: Offset(1, 1),
                                                      )
                                                    ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15))),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 15, top: 5),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: Icon(
                                                              Icons
                                                                  .money_outlined,
                                                              size: 25,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      255,
                                                                      204),
                                                            ),
                                                          ),
                                                          Text(
                                                              data.harga
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        255,
                                                                        204),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 5),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: Icon(
                                                              Icons
                                                                  .archive_outlined,
                                                              size: 25,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      255,
                                                                      204),
                                                            ),
                                                          ),
                                                          Text(
                                                              data.stok
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        255,
                                                                        204),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              size: 25,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      255,
                                                                      204),
                                                            ),
                                                          ),
                                                          Text(data.rating,
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        255,
                                                                        204),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      })));
                                } else {
                                  return Container(
                                    margin: EdgeInsets.only(top: 350),
                                    child: Center(
                                      child: SpinKitFadingCube(
                                        size: 60,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }
                              })
                        ],
                      ),
                    ))),
          ),
        ));
  }
}
