// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kita_jubelin/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final auth = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();
  RxBool isLoading = RxBool(false);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Obx(() => SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: SafeArea(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: controller.nama,
                            validator: (nama) => nama!.length < 5
                                ? 'Nama minimal 5 karakter!'
                                : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              label: Text('Nama'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.email,
                            validator: (email) => email!.length < 8
                                ? 'Email minimal 8 karakter!'
                                : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              label: Text('Email'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: controller.noTelp,
                            validator: (noTelp) => noTelp!.length < 8
                                ? 'No Telpon minimal 8 karakter!'
                                : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              label: Text('No Telpon'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: TextFormField(
                            maxLines: 4,
                            keyboardType: TextInputType.text,
                            controller: controller.alamat,
                            validator: (alamat) => alamat!.length < 8
                                ? 'Alamat minimal 8 karakter!'
                                : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              label: Text('Alamat'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.password,
                            validator: (password) => password!.length < 5
                                ? 'Password minimal 5 karakter!'
                                : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText:
                                controller.hiddenPassword.value ? true : false,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                label: Text('Password'),
                                suffixIcon: IconButton(
                                  onPressed: () => controller.changeEye(),
                                  icon: Icon(controller.hiddenPassword.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                )),
                          ),
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
                                        await auth.register();
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
                                        'Daftar',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 130, right: 15),
                                child: Text(
                                  "Have an account ?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed(Routes.LOGIN);
                                },
                                child: Container(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 64, 126, 212),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ),
            )));
  }
}
