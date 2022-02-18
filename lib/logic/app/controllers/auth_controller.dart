import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  CameraPosition cameraPosition =
  CameraPosition(target: LatLng(12.0055, -12.32389), zoom: 18.009);

  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  // Location _location;
  Completer<GoogleMapController> completer = Completer();
  List<Marker> mapsMarker = List<Marker>();

  selectLocation(LatLng value) async {
    print("dsfads");
    mapsMarker.add(
      Marker(
        position: value,
        markerId: MarkerId("1"),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
    );

    List<Placemark> placemarks =
    await placemarkFromCoordinates(value.latitude, value.longitude);
    print(placemarks.first);

    addressLocationController.text =
    "${placemarks.first.country} ${placemarks.first.administrativeArea} ${placemarks.first.subAdministrativeArea} ${placemarks.first.subLocality} ${placemarks.first.street}";

    print("$addressLocationController.text");
  }




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
