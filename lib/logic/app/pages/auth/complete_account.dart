import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/controllers/auth_controller.dart';

import 'open_maps.dart';

class CompleteAccountScreen extends GetView<AuthController> {
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhigh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFD0DD28),
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/svg/background.svg',
            fit: BoxFit.fill,
          ),
          ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, (screenhigh / 9), 0, 0)),
              SvgPicture.asset(
                'assets/images/svg/ic_small_logo.svg',
                height: 80,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, (screenhigh / 7), 0, 0)),
              Center(
                child: Text(
                  'لطفا قم بإنشاء حساب',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 0),
                                    color: Colors.grey,
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: TextField(
                                controller: controller.usernameController,
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "الإسم الكامل",
                                  hintStyle: new TextStyle(
                                    color: Color(0XFF808285),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  color: Color(0XFFD0DD28),
                                                  height: 40,
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/png/TF.png',
                                              color: Color(0XFF808285),
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Center(
                                        child: Icon(
                                      Icons.person,
                                      color: Color(0XFFD0DD28),
                                    ))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 0),
                                    color: Colors.grey,
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: TextField(
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                controller: controller.addressController,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "أدخال العنوان يدويا",
                                    hintStyle: new TextStyle(
                                      color: Color(0XFF808285),
                                    )),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 10,
                                                color: Color(0XFFD0DD28),
                                                height: 40,
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                            'assets/images/png/TF.png',
                                            color: Color(0XFF808285),
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                        child: Icon(
                                      Icons.location_city,
                                      color: Color(0XFFD0DD28),
                                    ))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Text(
                  'أو',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
                              padding: EdgeInsets.only(right: 4, left: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 0),
                                    color: Colors.grey,
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: TextField(
                                controller:
                                    controller.addressLocationController,
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "تحديد الموقع أتوماتيكيا",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0XFF808285),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(OpenMapsScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 10,
                                            color: Color(0XFFD0DD28),
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/png/TF.png',
                                            color: Color(0XFF808285),
                                            height: 40,
                                          ),
                                          Center(
                                            child: Icon(
                                              Icons.location_pin,
                                              color: Color(0XFFD0DD28),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Obx(
                () => Center(
                  child: Container(
                    width: controller.isLoading.value == true
                        ? 40
                        : screenwidth / 1.5,
                    child: ButtonTheme(
                      height: 40,
                      buttonColor: Color(0XFF808285),
                      child: controller.isLoading.value == true
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              onPressed: controller.registerBtn,
                              child: Text(
                                'أنشيء حساب',
                                style: new TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, screenhigh / 40, 0, 0),
                    ),
                    Text(
                      'بالضغط على زر تنشيط فأنت توافق على ',
                      style: new TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'شروط التطبيق',
                      style: new TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
