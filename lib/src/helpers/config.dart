import 'package:flutter/material.dart';

class Config {
  static String urlRegister = "";
  static String urlVerifyOpt = "";
  static String baseUrl =
      "http://infotouchit.com/api"; //'http://alsalama.wykaa.com/api/v2/mobile';
  String initialAppRoute = '/';
  // Map<String, WidgetBuilder> appRoutes() {
  //   return {
  //     // '/': (context) => SplashView(),
  //     // '/intro': (context) => OnboardingView(),
  //     // '/login': (context) => LoginView(),
  //     // '/otp': (context) => OTPView(),
  //     // '/profile': (context) => ProfileView(),
  //     // '/insuranceCertificateOrder': (context) =>
  //     //     InsuranceCertificateOrderView(),
  //   };
  // }

  String appFont = 'Cairo';
  TextTheme appTextTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headline5: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    ),
  );
}
