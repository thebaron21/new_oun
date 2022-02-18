// @ dart =

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/pages/home_screen.dart';
import 'package:oon_client/logic/base/pages/home_page.dart';
import 'package:oon_client/logic/base/pages/register_page.dart';
import 'logic/app/functions/init_controllers.dart';
import 'logic/app/pages/auth/register.dart';
import 'logic/base/pages/completed_account.dart';
import 'src/view/widgets/splash.dart';
import 'package:connectivity/connectivity.dart';
//import 'package:permission/permission.dart';

void main() async {
  AppDependencies.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetStorage _storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        RegisterPage(),
        CompletedAccountPage(),
        HomePage(),
      ],
      debugShowCheckedModeBanner: false,
      title: 'oun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      home: Splash(
        page: _storage.hasData("token") ? HomeScreen() : RegisterScreen(),
      ),
    );
  }
}
