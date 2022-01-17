import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/controllers/auth_controller.dart';

class RegisterScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhigh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0XFFD0DD28),
      body: new Theme(
        data: ThemeData(primaryColor: Color(0XFFD0DD28)),
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/svg/background.svg',
              fit: BoxFit.fill,
            ),
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, (screenhigh / 5), 0, 0)),
                SvgPicture.asset(
                  'assets/images/svg/ic_small_logo.svg',
                  height: 80,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, (screenhigh / 4), 0, 0)),
                Center(
                  child: Text(
                    'التسجيل',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Center(
                  child: Container(
                    width: screenwidth / 1.5,
                    height: 40,
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
                      controller: controller.phoneController,
                      cursorColor: controller.colorPattern.primaryColor,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: " +966- رقم الهاتف",
                          hintStyle: new TextStyle(
                            color: Color(0XFFD0DD28),
                          )),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                Center(
                  child: Container(
                    width: screenwidth / 1.5,
                    child: ButtonTheme(
                      height: 40,
                      buttonColor: Color(0XFF808285),
                      child: RaisedButton(
                        onPressed: controller.next,
                        child: Text(
                          'تسجيل',
                          style:
                              new TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      ),
                      Text(
                        'سيصلك كود التفعيل خلال دقيقة',
                        style: new TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, screenhigh / 15, 0, 0),
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
      ),
    );
  }
}
