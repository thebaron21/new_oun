import 'package:get/get.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
