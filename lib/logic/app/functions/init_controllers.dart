import 'package:get/get.dart';
import 'package:oon_client/logic/app/controllers/auth_controller.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/logic/app/controllers/track_controller.dart';

class AppDependencies {
  static void init() {
    Get.put(HomeController());
    Get.put(AuthController());
    Get.put(TarckController());
  }
}
