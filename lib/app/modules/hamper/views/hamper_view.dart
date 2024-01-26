// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/hamper_controller.dart';

class HamperView extends GetView<HamperController> {
  const HamperView({Key? key}) : super(key: key);
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
              child: SafeArea(
                  child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              child: Column(
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
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 400,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  offset: Offset(1, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 255, 255, 255)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 130),
                                child: Text(
                                  "Keranjang anda",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 255, 204)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        Container(
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
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 0, 255, 204),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text("Popmie",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
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
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.money_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("1.000",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.archive_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("20",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.star_border_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("5,5",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 0, 255, 204),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text("Popmie",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
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
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.money_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("1.000",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.archive_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("20",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.star_border_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("5,5",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
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
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 0, 255, 204),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text("Popmie",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
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
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15, top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.money_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("1.000",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.archive_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("20",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Icon(
                                              Icons.star_border_outlined,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 204),
                                            ),
                                          ),
                                          Text("5,5",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 0, 255, 204),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))),
        ));
  }
}
