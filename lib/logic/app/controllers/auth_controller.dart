import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/functions/connect_remote.dart';
import 'package:oon_client/logic/app/models/profile_model.dart';
import 'package:oon_client/logic/base/controllers/authentication_controller.dart';
import 'package:oon_client/logic/core/config/end_point.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';

class AuthController extends AuthenticationController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLocationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;

  IconData maps_home_work_outlined =
      IconData(61871, fontFamily: 'MaterialIcons');

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  ColorPattern colorPattern = ColorPattern();

  @override
  Future login(String email, String password) async {
    try {
      var res = await Remote.postF(
        uri: EndPoint.register,
      );
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future register(body) async {
    try {
      var res = await Remote.postF(
        uri: EndPoint.register,
        headers: {
          "Accept": "application/json",
        },
        body: body,
      );
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future updateUser(String id, String name) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  next() {
    print(phoneController.text == "");
    if (phoneController.text != "") {
      Get.toNamed('/next');
    }
  }

  registerBtn() async {
    if (phoneController.text != "" &&
        usernameController.text != "" &&
        addressController.text != "" &&
        addressLocationController.text != "") {
      isLoading(true);
      try {
        print(phoneController.text);
        var io = await register({
          "phone": "+966" + phoneController.text,
          "name": usernameController.text,
          "email": "${usernameController.text}@gmail.com",
          "password": usernameController.text + phoneController.text,
          "password_confirmation":
              usernameController.text + phoneController.text
        });
        print(io);
        if (io["status"] == 422) {
          Get.showSnackbar(
            GetSnackBar(
              title: "خطا",
              message: (io["error"]["errors"] as Map).values.toString(),
            ),
          );
        } else {
          if (io["message"] == "The user was created successfully") {
            var user = AuthenticationModel.fromJson(io);
            GetStorage _storage = GetStorage();
            await _storage.write("token", user.token);
            await _storage.write("userid", user.user.id);
            await _storage.write("user", user.toJson());
            print(user.toJson());
            Get.toNamed("/home");
          }
        }
      } catch (ex) {
        throw ex;
      } finally {
        isLoading(false);
      }
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "خطا",
          message: "أكمل البيانات",
        ),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    usernameController.dispose();
    addressController.dispose();
    addressLocationController.dispose();
  }
}
