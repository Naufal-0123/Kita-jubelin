// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final auth = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  RxBool isLoading = RxBool(false);
  String? validateEmail(String? email) {
    RegExp namaRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = namaRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Silahkan gunakan email yang terdaftar';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                        margin: EdgeInsets.only(bottom: 25, top: 100),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.email,
                          validator: validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            label: Text('Email'),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      InkWell(
                        onTap: () {
                          // Get.offAllNamed();
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          width: lebar,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Forgot password",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 64, 126, 212),
                            ),
                          ),
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
                                      await auth.login();
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
                                      'Masuk',
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
                              margin: EdgeInsets.only(left: 100, right: 15),
                              child: Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(Routes.REGISTER);
                              },
                              child: Container(
                                child: Text(
                                  " Register",
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
          )),
    );
  }
}
