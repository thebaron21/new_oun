import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as Loc;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oon_client/src/view/sender/SendExtraInfo.dart';
import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';
import 'package:location/location.dart';

class SendLocateViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();
  BuildContext _context;
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  Completer<GoogleMapController> completer = Completer();
  List<Marker> mapsMarker = List<Marker>();
  LatLng myLocation;
  String address;
  LatLng locationLatLng =
      LatLng(_cameraPosition.target.latitude, _cameraPosition.target.longitude);

  static CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(15.600439481364994, 32.4445266276598), zoom: 18.009);

  CameraPosition get cameraPosition => _cameraPosition;

  nextPage(context) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("lat", locationLatLng.latitude.toString());
    obj.setString("lng", locationLatLng.longitude.toString());
    if (address == null) {
      address = "Not Located";
    }
    obj.setString("address", address);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SendExtraInfo(
          address: address,
        ),
      ),
    );
  }

  changeCompleter(GoogleMapController googleMapController) {
    completer.complete(googleMapController);
  }

  selectPosition(LatLng value) async {
    locationLatLng = value;
    notifyListeners();
    print(locationLatLng);
    _getCurrentLocation(value);
    mapsMarker = [
      Marker(
        position: value,
        markerId: MarkerId("selected"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      )
    ];
    // List<Placemark> placemarks =
    //     await placemarkFromCoordinates(value.latitude, value.longitude);

    // address =
    //     "${placemarks.first.country},${placemarks.first.administrativeArea},${placemarks.first.subAdministrativeArea},${placemarks.first.subLocality},${placemarks.first.street}";
    // print(address);
    notifyListeners();
  }

  _getCurrentLocation(value) async {
    GoogleMapController v = await completer.future;
    v.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: value,
          zoom: 18,
        ),
      ),
    );
    notifyListeners();
  }

  LocationFunc() async {
    Loc.Location location = Loc.Location();

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
    notifyListeners();
  }

  dispose() async {
    var i = await completer.future;
    i.dispose();
  }
}
