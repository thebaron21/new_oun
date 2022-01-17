import 'package:flutter/material.dart';
import 'widgets/signUp.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      photoSize: 150,
      backgroundColor: Color(0xFFD0DD28),
      seconds: 5,
      loaderColor: Colors.white,
      navigateAfterSeconds: signUP (),
      onClick: () => print('Mirsad'),
    );
  }
}
