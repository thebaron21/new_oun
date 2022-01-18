import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as o;
import 'package:location/location.dart';
import 'package:oon_client/logic/app/models/order_model.dart';
import 'package:oon_client/logic/app/models/profile_model.dart';
import 'package:oon_client/logic/app/pages/Buy/AddSender.dart';
import 'package:oon_client/logic/app/pages/Buy/SendExtraInfo.dart';
import 'package:oon_client/logic/app/pages/Buy/SendLocate.dart';
import 'package:oon_client/logic/app/pages/Buy/SendPackDetails.dart';
import 'package:oon_client/logic/app/pages/Buy/SendPay.dart';
import 'package:oon_client/logic/app/pages/Buy/SendSelectLocal.dart';
import 'package:oon_client/logic/app/pages/Buy/SendTime.dart';
import 'package:oon_client/logic/app/pages/Recevice/AddSender.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendDone.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendExtraInfo.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendLocate.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendPackDetails.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendPay.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendSelectLocal.dart';
import 'package:oon_client/logic/app/pages/Recevice/SendTime.dart';
import 'package:oon_client/logic/app/pages/Sender/AddSender.dart';
import 'package:oon_client/logic/app/pages/Sender/SendDone.dart';
import 'package:oon_client/logic/app/pages/Sender/SendExtraInfo.dart';
import 'package:oon_client/logic/app/pages/Sender/SendLocate.dart';
import 'package:oon_client/logic/app/pages/Sender/SendPackDetails.dart';
import 'package:oon_client/logic/app/pages/Sender/SendPay.dart';
import 'package:oon_client/logic/app/pages/Sender/SendSelectLocal.dart';
import 'package:oon_client/logic/app/pages/Sender/SendTime.dart';
import 'package:oon_client/logic/app/pages/Tracking/Track.dart';
import 'package:oon_client/logic/app/res/create_order.dart';
import 'package:oon_client/logic/base/controllers/home_controller.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';

import 'order_controller.dart';

enum OrderStatus2 { Completed, Inprogress }

class HomeController extends BaseHomeController {
  OrderStatus2 orderStatus = OrderStatus2.Inprogress;
  TextEditingController userIdController = TextEditingController();
  TextEditingController pickupContactController = TextEditingController();
  TextEditingController pickupPhoneController = TextEditingController();
  TextEditingController pickupAreaIdController = TextEditingController();
  TextEditingController pickupDescriptionController = TextEditingController();
  TextEditingController pickupTimeController = TextEditingController();
  TextEditingController pickupPriceController = TextEditingController();

  TextEditingController deliveryContactController = TextEditingController();
  TextEditingController deliveryPhoneController = TextEditingController();
  TextEditingController deliveryAreaIdController = TextEditingController();
  TextEditingController deliveryDescriptionController = TextEditingController();
  TextEditingController deliveryTimeController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController shipmentDescriptionController = TextEditingController();

  TextEditingController moreInfoController = TextEditingController();
  GetStorage storage = GetStorage();
  OrderController _orderController = OrderController();

  toMap() => {
        "userIdController": userIdController.text,
        "pickupContactController": pickupContactController.text,
        "pickupPhoneController": pickupPhoneController.text,
        "pickupAreaIdController": pickupAreaIdController.text,
        "pickupDescriptionController": pickupDescriptionController.text,
        "pickupTimeController": pickupTimeController.text,
        "pickupPriceController": pickupPriceController.text,
        "deliveryContactController": deliveryContactController.text,
        "deliveryPhoneController": deliveryPhoneController.text,
        "deliveryAreaIdController": deliveryAreaIdController.text,
        "deliveryDescriptionController": deliveryDescriptionController.text,
        "deliveryTimeController": deliveryTimeController.text,
        "weightController": weightController.text,
        "moreInfoController": moreInfoController.text,
      };
  RxBool isBigPick = false.obs;
  changeWeightPick() {
    if (isBigPick.value == true) {
      isBigPick(false);
      weightController.text = "3kG";
    } else {
      weightController.text = "5kG";
      isBigPick(true);
    }
    print(weightController.text);
    print(isBigPick.value);
  }

  ColorPattern colorPattern = ColorPattern();
  RxList<Marker> mapsMarker = <Marker>[].obs;
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  Completer<GoogleMapController> completer = Completer();

  RxBool getIsLoading = false.obs;

  Rx locationLatLng =
      LatLng(_cameraPosition.target.latitude, _cameraPosition.target.longitude)
          .obs;

  static CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(15.600439481364994, 32.4445266276598), zoom: 18.009);

  CameraPosition get cameraPosition => _cameraPosition;

  selectPosition(LatLng value) async {
    mapsMarker.clear();
    locationLatLng(value);
    _getCurrentLocation(value);

    mapsMarker.add(
      Marker(
        position: value,
        markerId: MarkerId("selected"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
    );
    String name = await getNameArea(value);
    print(name);
  }

  changeCompleter(GoogleMapController googleMapController) {
    completer.complete(googleMapController);
    update();
  }

  void _getCurrentLocation(LatLng value) async {
    GoogleMapController v = await completer.future;

    v.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: value,
          zoom: 18,
        ),
      ),
    );
    update();
  }

  locationFunc() async {
    var location = o.Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    GoogleMapController v = await completer.future;
    v.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_locationData.latitude, _locationData.longitude),
          zoom: 18.009,
        ),
      ),
    );
    mapsMarker.add(
      Marker(
        position: LatLng(_locationData.latitude, _locationData.longitude),
        markerId: MarkerId("mylocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      ),
    );
  }

  @override
  recevieScreen() {
    Get.to(SelectLocationsReceviceScreen());
  }

  @override
  senderScreen() {
    Get.to(SelectLocationsScreen());
  }

  @override
  tarckScreen() {
    Get.to(TrackScreen());
  }

  @override
  buyScreen() {
    Get.to(BuySelectLocationsScreen());
  }

  @override
  nextPage() async {}

  @override
  setLocation() {
    Get.to(SendLocateScreen());
  }

  selLocationBuy() {
    Get.to(BuyLocateScreen());
  }

  setLocationRecevice() {
    Get.to(SendLocateReceviceScreen());
  }

  @override
  backPage() {
    Get.back();
  }

  @override
  goToBuy() {
    Get.to(SendPayScreen());
  }

  goToBuyNext() {
    Get.to(BuyPayScreen());
  }

  goToBuyRecevice() {
    Get.to(SendPayReceviceScreen());
  }

  @override
  goToExtrInfo() {
    Get.to(SendExtraInfoScreen());
  }

  goToExtrInfoBuy() {
    Get.to(BuyExtraInfoScreen());
  }

  goToExtrInfoRecevice() {
    Get.to(SendExtraInfoReceviceScreen());
  }

  @override
  goToTime() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationLatLng.value.latitude, locationLatLng.value.longitude);
    deliveryAreaIdController.text = placemarks.first.country +
        " , " +
        placemarks.first.administrativeArea +
        " , " +
        placemarks.first.street;
    print(deliveryAreaIdController.text);

    Get.to(SendTimeScreen());
  }

  goToTimeBuy() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationLatLng.value.latitude, locationLatLng.value.longitude);
    deliveryAreaIdController.text = placemarks.first.country +
        " , " +
        placemarks.first.administrativeArea +
        " , " +
        placemarks.first.street;
    print(deliveryAreaIdController.text);

    Get.to(BuyTimeScreen());
  }

  goToTimeRecevice() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationLatLng.value.latitude, locationLatLng.value.longitude);
    deliveryAreaIdController.text = placemarks.first.country +
        " , " +
        placemarks.first.administrativeArea +
        " , " +
        placemarks.first.street;
    print(deliveryAreaIdController.text);

    Get.to(SendTimeReceviceScreen());
  }

  @override
  goToPick() {
    Get.to(SendPackDetailsScreen());
  }

  goToPickBuy() {
    Get.to(BuyPackDetailsScreen());
  }

  @override
  goToAddSender() {
    Get.to(AddSenderScreen());
  }

  goToAddBuy() {
    Get.to(AddBuyScreen());
  }

  goToPickRecevice() {
    Get.to(SendPackDetailsReceviceScreen());
  }

  goToAddSenderRecevice() {
    Get.to(AddSenderReceviceScreen());
  }

  Future<String> getNameArea(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationLatLng.value.latitude, locationLatLng.value.longitude);
    return placemarks.first.country +
        " , " +
        placemarks.first.administrativeArea +
        " , " +
        placemarks.first.street;
  }

  RxBool isClose = false.obs;

  addMoreInfoOfAddress() {
    isClose(true);
    deliveryTimeController.text += moreInfoController.text;
  }

  closeMoreInfoAddress() {
    isClose(true);
  }

  addPhoneFromDev() async {
    // final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
    // deliveryPhoneController.text = contact.phoneNumber.number;
    // deliveryContactController.text = contact.fullName;
  }

  @override
  goToDone() async {
    AuthenticationModel user =
        AuthenticationModel.fromJson(storage.read("user"));
    userIdController.text = user.user.id.toString();
    pickupContactController.text = user.user.name;
    pickupPhoneController.text = user.user.phone;
    pickupAreaIdController.text = "";
    if (isBigPick.value == true)
      weightController.text = "0_5KG";
    else
      weightController.text = "3KG";
    shipmentDescriptionController.text = "f1";
    OrderModel orderData = OrderModel(
      userId: userIdController.text,
      pickupContact: pickupContactController.text,
      pickupPhone: pickupPhoneController.text,
      pickupAreaId: "1",
      pickupDescription: pickupDescriptionController.text,
      pickupTime: deliveryTimeController.text.replaceAll("/", "-") +
          " " +
          DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      deliveryContact: deliveryContactController.text,
      deliveryPhone: "+966" + deliveryPhoneController.text,
      deliveryAreaId: "2",
      deliveryDescription: deliveryAreaIdController.text,
      deliveryTime: deliveryTimeController.text.replaceAll("/", "-") +
          " " +
          DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      weight: weightController.text,
      shipmentDescription: shipmentDescriptionController.text,
    );
    var isDone = await CreateOrderSender.setOrder(orderData);
    if (isDone["message"] == "seccess") {
      var tarckingCode = isDone["data"]["order"]["tracking_code"];
      await storage.write("tracking_code", tarckingCode);
      print(storage.getKeys());
      Get.to(SendDoneScreen());
    }
  }

  @override
  goToDoneRevecie() async {
    AuthenticationModel user =
        AuthenticationModel.fromJson(storage.read("user"));
    userIdController.text = user.user.id.toString();
    pickupContactController.text = user.user.name;
    pickupPhoneController.text = user.user.phone;
    pickupAreaIdController.text = "";
    if (isBigPick.value == true)
      weightController.text = "0_5KG";
    else
      weightController.text = "3KG";
    shipmentDescriptionController.text = "f1";
    OrderModel orderData = OrderModel(
      userId: userIdController.text,
      pickupContact: pickupContactController.text,
      pickupPhone: pickupPhoneController.text,
      pickupAreaId: "1",
      pickupDescription: pickupDescriptionController.text,
      pickupTime: deliveryTimeController.text.replaceAll("/", "-") +
          " " +
          DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      deliveryContact: deliveryContactController.text,
      deliveryPhone: "+966" + deliveryPhoneController.text,
      deliveryAreaId: "2",
      deliveryDescription: deliveryAreaIdController.text,
      deliveryTime: deliveryTimeController.text.replaceAll("/", "-") +
          " " +
          DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      weight: weightController.text,
      shipmentDescription: shipmentDescriptionController.text,
    );
    var isDone = await CreateOrderSender.setRecieve(orderData);
    if (isDone["message"] == "seccess") {
      var tarckingCode = isDone["data"]["order"]["tracking_code"];
      await storage.write("tracking_code", tarckingCode);
      print(storage.getKeys());
      Get.to(SendDoneReceviceScreen());
    }
  }

  goToDoneBuy() async {
    AuthenticationModel user =
        AuthenticationModel.fromJson(storage.read("user"));
    userIdController.text = user.user.id.toString();
    pickupContactController.text = user.user.name;
    pickupPhoneController.text = user.user.phone;
    pickupAreaIdController.text = "";
    if (isBigPick.value == true)
      weightController.text = "0_5KG";
    else
      weightController.text = "3KG";
    shipmentDescriptionController.text = "f1";
    OrderModel orderData = OrderModel(
      userId: userIdController.text,
      pickupContact: pickupContactController.text,
      pickupPhone: pickupPhoneController.text,
      pickupAreaId: "1",
      pickupDescription: pickupDescriptionController.text,
      pickupTime: deliveryTimeController.text.replaceAll("/", "-") +
          " " +
          DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      deliveryContact: deliveryContactController.text,
      deliveryPhone: "+966" + deliveryPhoneController.text,
      deliveryAreaId: "2",
      deliveryDescription: deliveryAreaIdController.text,
      deliveryTime: deliveryTimeController.text.replaceAll("/", "-") +
          " " +
          DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString(),
      weight: weightController.text,
      shipmentDescription: shipmentDescriptionController.text,
    );
    var isDone = await CreateOrderSender.setBuy(orderData);
    if (isDone["message"] == "seccess") {
      var tarckingCode = isDone["data"]["order"]["tracking_code"];
      await storage.write("tracking_code", tarckingCode);
      print(storage.getKeys());
      Get.to(SendDoneScreen());
    }
  }
}
