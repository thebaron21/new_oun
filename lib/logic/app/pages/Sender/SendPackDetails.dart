import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';

class SendPackDetailsScreen extends GetView<HomeController> {
  bool isBig = false;
  String token;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenhigh = MediaQuery.of(context).size.height;

    double A;
    double B;
    double C;
    double D;
    double E;
    double F;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 5.14;
      B = screenwidth / 7.2;
      C = screenwidth / 1.2;
      D = screenwidth / 12;
      E = screenwidth / 2.4;
      F = screenwidth / 1.8;
    } else {
      A = screenwidth / 5.14;
      B = screenwidth / 7.2;
      C = screenwidth / 1.2;
      D = screenwidth / 12 * 3;
      E = screenwidth / 2.4;
      F = screenwidth / 1.8;
    }
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
        leading: Container(
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset(
            'assets/images/svg/ic_menu.svg',
          ),
        ),
      ),
      body: ListView(
        children: [
          ActionBar(
            title: "",
            colorPattern: controller.colorPattern,
            back: controller.backPage,
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
                "5",
                style: TextStyle(
                  fontSize: 35,
                  color: controller.colorPattern.primaryColor,
                ),
              )
            ],
          ),
          Center(
            child: Text(
              '???????????? ????????????',
              style: TextStyle(
                color: controller.colorPattern.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          // Container(
          //   color: Color(0xFFF1F2F2),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Column(
          //         children: [
          //           Text(
          //             controller.deliveryAreaIdController.text,
          //             style: TextStyle(
          //               fontSize: 12,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Container(
          //             alignment: Alignment.center,
          //             child: CircleAvatar(
          //               maxRadius: 10,
          //               child: Image.asset(
          //                 'assets/images/png/g.png',
          //                 width: 30,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/png/gg.png',
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Text('?????? ????????????'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: controller.changeWeightPick,
                child: _buildBig(A, isBig),
              ),
              Padding(padding: EdgeInsets.fromLTRB(D, 0, 0, 0)),
              InkWell(
                onTap: controller.changeWeightPick,
                child: _buildSmail(B, isBig),
              )
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Text('???????????? ?????????? ????????????'),
              ),
              Container(
                width: C,
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
                  controller: controller.pickupDescriptionController,
                  cursorColor: controller.colorPattern.primaryColor,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Text("???????????? ???????????? ??????????????"),
              ),
              Container(
                width: C,
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
                  controller: controller.pickupPriceController,
                  cursorColor: controller.colorPattern.primaryColor,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
          ),
        ],
      ),
      endDrawer: drawerCustom(),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: RaisedButton(
              padding: EdgeInsets.all(6),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '????????????',
                style: TextStyle(fontSize: 20),
              ),
              color: Color(0xFF6D6F72),
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
          Expanded(
            flex: 1,
            // ignore: deprecated_member_use
            child: RaisedButton(
              padding: EdgeInsets.all(6),
              onPressed: controller.goToAddSender,
              child: const Text(
                '???????????? ?????????? ????????????',
                style: TextStyle(fontSize: 16),
              ),
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              elevation: 5,
            ),
          )
        ],
      ),
    );
  }

  _buildBig(A, bool isSelect) {
    return Obx(() {
      return Container(
        width: Get.width * 0.4,
        padding: EdgeInsets.all(5),
        color: controller.isBigPick.value == false
            ? null
            : Color(0xFFD0DD28).withOpacity(0.4),
        child: Column(
          children: [
            Container(
              width: A,
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/png/g5.png',
                width: Get.width * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('????????'),
                ),
                Text(
                  '50*50*75cm 5kgm',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  _buildSmail(B, bool isSelect) {
    return Obx(() {
      return Container(
        width: Get.width * 0.4,
        padding: EdgeInsets.all(5),
        color: controller.isBigPick.value == true
            ? null
            : Color(0xFFD0DD28).withOpacity(0.4),
        child: Column(
          children: [
            Container(
              width: B,
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/png/g4.png',
                width: Get.width * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('????????'),
                  Text(
                    '30*30*75cm 3kgm',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  showMessage(context, {String title, String content}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.right,
          ),
          content: Text(
            content,
            textAlign: TextAlign.right,
          ),
          actions: [
            FlatButton(
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("????????"),
            )
          ],
        );
      },
    );
  }
}
