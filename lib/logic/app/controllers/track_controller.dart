import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/base/controllers/track_controller.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';

class TarckController extends BaseTarckController {
  static GetStorage storage = GetStorage();
  var userId = storage.read("user");
  RxInt currentStep = 0.obs;
  ColorPattern colorPattern = ColorPattern();
  RxInt currentStatus = 1.obs;
  RxBool one = false.obs;
  RxBool two = false.obs;
  RxBool three = false.obs;
  RxBool four = false.obs;

}
