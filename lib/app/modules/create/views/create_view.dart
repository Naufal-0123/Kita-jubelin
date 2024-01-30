// ignore_for_file: prefer_const_constructors, prefer_is_empty, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/create_controller.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class CreateView extends GetView<CreateController> {
  final create = Get.put(CreateController());
  final _formKey = GlobalKey<FormState>();
  RxBool isLoading = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.offAllNamed(Routes.HOME),
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25,
              color: Color.fromARGB(255, 0, 255, 204),
            ),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                        width: 300,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("asset/image/Logo7.png"),
                          ),
                        ),
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: controller.nama,
                        validator: (nama) => nama!.length < 5
                            ? 'Nama barang minimal 5 karakter!'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(color: Colors.black45),
                          labelText: "Nama Barang",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: controller.harga,
                        validator: (harga) => harga!.length < 1
                            ? 'Harga barang harus diisi'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(color: Colors.black45),
                          labelText: "Harga Barang",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: controller.stok,
                        validator: (stok) =>
                            stok!.length < 1 ? 'Stok barang harus diisi' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(color: Colors.black45),
                          labelText: "Stok Barang",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: controller.rating,
                        validator: (rating) => rating!.length < 1
                            ? 'Rating barang harus diisi'
                            : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(color: Colors.black45),
                          labelText: "Rating Barang",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isLoading.value
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      isLoading.value = true;
                                      await create.create();
                                      isLoading.value = false;
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 64, 126, 212),
                            ),
                            child: Obx(
                              () => isLoading.value
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Bikin',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )),
          ),
        ));
  }
}
