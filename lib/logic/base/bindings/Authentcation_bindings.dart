import 'package:get/get.dart';
import 'package:oon_client/logic/app/controllers/auth_controller.dart';

class AuthenticationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
