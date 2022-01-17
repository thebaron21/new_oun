// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as o;
import 'package:location/location.dart';
import 'package:oon_client/logic/app/pages/Sender/AddSender.dart';
import 'package:oon_client/logic/app/pages/Sender/SendExtraInfo.dart';
import 'package:oon_client/logic/app/pages/Sender/SendLocate.dart';
import 'package:oon_client/logic/app/pages/Sender/SendSelectLocal.dart';
import 'package:oon_client/logic/base/controllers/home_controller.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';

enum OrderStatus2 { Completed, Inprogress }

class HomeController extends BaseHomeController {
  OrderStatus2 orderStatus = OrderStatus2.Inprogress;
  TextEditingController userIdController = TextEditingController();
  TextEditingController pickupContactController = TextEditingController();
  TextEditingController pickupPhoneController = TextEditingController();
  TextEditingController pickupAreaIdController = TextEditingController();
  TextEditingController pickupDescriptionController = TextEditingController();
  TextEditingController pickupTimeController = TextEditingController();

  TextEditingController deliveryContactController = TextEditingController();
  TextEditingController deliveryPhoneController = TextEditingController();
  TextEditingController deliveryAreaIdController = TextEditingController();
  TextEditingController deliveryDescriptionController = TextEditingController();
  TextEditingController deliveryTimeController = TextEditingController();

  TextEditingController weightController = TextEditingController();
  TextEditingController shipmentDescriptionController = TextEditingController();

  ColorPattern colorPattern = ColorPattern();
  List<Marker> mapsMarker = List<Marker>();
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  Completer<GoogleMapController> completer = Completer();

  RxBool getIsLoading = false.obs;

  LatLng locationLatLng =
      LatLng(_cameraPosition.target.latitude, _cameraPosition.target.longitude);

  static CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(15.600439481364994, 32.4445266276598), zoom: 18.009);

  CameraPosition get cameraPosition => _cameraPosition;

  selectPosition(LatLng value) async {
    locationLatLng = value;
    _getCurrentLocation(value);
    mapsMarker = [
      Marker(
        position: value,
        markerId: MarkerId("selected"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      )
    ];
  }

  @override
  recevieScreen() {
    // TODO: implement receviceScrren
    throw UnimplementedError();
  }

  @override
  senderScreen() {
    Get.to(SelectLocationsScreen());
  }

  @override
  tarckScreen() {
    // TODO: implement tarckScreen
    throw UnimplementedError();
  }

  @override
  buyScreen() {
    // TODO: implement buyScreen
    throw UnimplementedError();
  }

  @override
  nextPage() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationLatLng.latitude, locationLatLng.longitude);
    deliveryAreaIdController.text = placemarks.first.country +
        " , " +
        placemarks.first.administrativeArea +
        " , " +
        placemarks.first.street;
    print(deliveryAreaIdController.text);
    // Get.to(SendExtraInfoScreen());
  }

  changeCompleter(GoogleMapController googleMapController) {
    completer.complete(googleMapController);
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
    mapsMarker = [
      Marker(
        position: LatLng(_locationData.latitude, _locationData.longitude),
        markerId: MarkerId("mylocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      )
    ];
  }

  @override
  setLocation() {
    Get.to(SendLocateScreen());
  }

  @override
  backPage() {
    Get.back();
  }

  @override
  getToBuy() {
    // TODO: implement getToBuy
    throw UnimplementedError();
  }
}
