// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';

// ignore: must_be_immutable
class AddSenderReceviceScreen extends GetView<HomeController> {
  GlobalKey<FormState> _keyFrom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhigh = MediaQuery.of(context).size.height;

    double A;
    double B;
    double C;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 1.2;
      B = screenwidth / 1.44;
      C = screenwidth / 2.11;
    } else {
      A = screenwidth / 1.2;

      B = screenwidth / 1.44;
      C = screenwidth / 2.11;
    }
//SendPackDetails
    return Scaffold(
      appBar: AppBar(
        backgroundColor: controller.colorPattern.primaryColor,
        centerTitle: true,
        title: Container(
          child: SvgPicture.asset(
            'assets/images/svg/ic_small_logo.svg',
            height: 40,
          ),
        ),
        leadingWidth: 48,
      ),

      endDrawer: drawerCustom(),
      body: Form(
        key: _keyFrom,
        child: ListView(
          children: [
            ActionBar(
              title: 'إرسال',
              colorPattern: controller.colorPattern,
              back: () {
                // Navigator.of(context).pop();
                Get.back();
              },
              help: () {},
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                PageLogo(
                  imagePath: 'assets/images/svg/ic_circle.svg',
                  height: 60,
                ),
                Text(
                  "6",
                  style: TextStyle(
                    fontSize: 35,
                    color: controller.colorPattern.primaryColor,
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                'إضافة مرسل',
                style: TextStyle(
                  color: controller.colorPattern.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: Text('إسم جهة الإتصال'),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: A,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: A,
                            height: 30,
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
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: TextField(
                              controller: controller.deliveryContactController,
                              cursorColor: controller.colorPattern.primaryColor,
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: controller.addPhoneFromDev,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/png/TF.png',
                                      height: 30,
                                    ),
                                    Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
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
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: Text('رقم جهة الإتصال'),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: A,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: A,
                            height: 30,
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
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: TextField(
                              controller: controller.deliveryPhoneController,
                              cursorColor: controller.colorPattern.primaryColor,
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
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
                                    onTap: controller.addPhoneFromDev,
                                    child: Image.asset(
                                      'assets/images/png/TF.png',
                                      height: 30,
                                    ),
                                  ),
                                  Center(
                                      child: Icon(Icons.phone,
                                          color: Colors.white))
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
            Container(
              width: 300,
              height: 100,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: screenwidth,
        height: 40,
        child: RaisedButton(
          onPressed: controller.goToBuyRecevice,
          child: const Text(
            'تفاصيل الشحنة',
            style: TextStyle(fontSize: 20),
          ),
          color: Color(0xFFD0DD28),
          textColor: Colors.white,
          elevation: 5,
        ),
      ),
    );
  }
}
