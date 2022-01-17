import 'package:get/get.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';

class AppDependencies {
  static void init() {
    Get.put(HomeController());
  }
}
