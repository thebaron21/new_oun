import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/base/controllers/track_controller.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';

class TarckController extends BaseTarckController {
  static GetStorage _storage = GetStorage();
  String userId = _storage.read("userid").toString();
  RxInt currentStep = 0.obs;
  ColorPattern colorPattern = ColorPattern();
}
