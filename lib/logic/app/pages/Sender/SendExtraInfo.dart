import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';

class SendExtraInfoScreen extends GetView<HomeController> {
  // TextEditingController _fullDesc = TextEditingController();
  String _fullDesc;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  bool isError = false;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenhigh = MediaQuery.of(context).size.height;
    double A;
    double B;
    double C;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 1.44;
      B = screenhigh / 25.33;
      C = screenwidth / 2.04;
    } else {
      A = screenwidth / 1.44;
      B = screenhigh / 12;

      C = screenwidth / 2.04;
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
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            ActionBar(
              title: 'إرسال',
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
                  "4",
                  style: TextStyle(
                    fontSize: 35,
                    color: controller.colorPattern.primaryColor,
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                'تم تحديد الموقع بنجاح',
                style: TextStyle(
                    color: controller.colorPattern.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            ),
            Container(
              color: Color(0xFFF1F2F2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        controller.deliveryAreaIdController.text.length >= 25
                            ? controller.deliveryAreaIdController.text
                                .substring(0, 25)
                            : controller.deliveryAreaIdController.text,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: controller.colorPattern.primaryColor,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
            ),
            Container(
              width: screenwidth,
              height: 250,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                color: Color(0xFFF1F2F2),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    ),
                    Text(
                      'هل ترغب بإضافة تفاصيل إضافية للعنوان؟',
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    ),
                    controller.isClose.value == true
                        ? Center()
                        : Container(
                            width: A,
                            height: B,
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
                            child: TextFormField(
                                controller:
                                    controller.deliveryDescriptionController,
                                onSaved: (value) => _fullDesc = value,
                                cursorColor:
                                    controller.colorPattern.primaryColor,
                                textAlign: TextAlign.center,
                                // validator: (value) =>
                                //     value.isEmpty ? isError = true : "",
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                )),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            RaisedButton(
                              onPressed: () {
                                controller.deliveryDescriptionController.text="";
                              },
                              child: Text(
                                'إلغاء',
                                style: new TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40),
                              ),
                              color: Color(0xFFD0DD28),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        ),
                        Column(
                          children: [
                            RaisedButton(
                              onPressed: () async {
                                if(controller.deliveryDescriptionController.text != ""){
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: "نجاح",
                                      message: "تم إضافة تفاصيل للعنوان",
                                    )
                                  );
                                }
                              },
                              child: Text(
                                'إضافة',
                                style: new TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(40),
                              ),
                              color: Color(0xFFD0DD28),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      indent: 20,
                      thickness: 1,
                      endIndent: 20,
                      height: 10,
                      color: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(controller.deliveryAreaIdController.text),
                            SizedBox(width: 10),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                child: Image.asset('assets/images/png/g1.png'),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(controller.deliveryTimeController.text),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    child:
                                        Image.asset('assets/images/png/g.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: controller.backPage,
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  child: const Text(
                    'الرجوع',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xFF6D6F72),
                  // textColor: Colors.white,
                  // elevation: 5,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: controller.goToPick,
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(
                    ' تأكيد العنوان',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xFFD0DD28),
                ),
                // elevation: 5,
              ),
            ),
          ],
        ),
      ),
      endDrawer: drawerCustom(),
    );
  }
}
