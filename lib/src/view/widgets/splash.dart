import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  final dynamic page;

  Splash({Key key, this.page}) : super(key: key);
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image.asset(
        'assets/images/png/app_logo.png',
        height: 300,
      ),
      photoSize: 150,
      backgroundColor: Color(0XFFD0DD28),
      seconds: 3,
      loaderColor: Colors.white,
      navigateAfterSeconds: page,
      onClick: () => print('Mirsad'),
    );
  }

  checkNetWork(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("لم تصل بالإنترنت"),
          content: Text("إتصل بالإنترنت .."),
          actions: [
            FlatButton(
              onPressed: () {
                print("OK");
              },
              child: Text("موفق"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("إلغاء"),
            )
          ],
        );
      },
    );
  }
}
