import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oon_client/src/view/reciver/ReciveExtraInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class ReciveLocateViewModel extends BaseViewModel {
  BuildContext _context;
  ColorPattern colorPattern = ColorPattern();
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  Completer<GoogleMapController> completer = Completer();
  List<Marker> mapsMarker = List<Marker>();
  List<Polyline> mapsPolyline = List<Polyline>();
  PolylinePoints googleMapPolyline = PolylinePoints();
  LatLng myLocation;
  List<LatLng> routeCoords;
  String address;
  LatLng locationLatLng;

  static CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(15.600439481364994, 32.4445266276598), zoom: 18.009);

  CameraPosition get cameraPosition => _cameraPosition;

  nextPage(context) async{
        SharedPreferences obj = await SharedPreferences.getInstance();
    if (this.address == null) {
      address = "";
      notifyListeners();
    }
    obj.setString("address", address);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReciveExtraInfo(
          address: this.address,
        ),
      ),
    );
  }

  changeCompleter(GoogleMapController googleMapController) {
    completer.complete(googleMapController);
    notifyListeners();
  }

  selectPosition(LatLng value) async {
   
    locationLatLng = value;
   try{
    //   List<Placemark> placemarks =
    //     await placemarkFromCoordinates(value.latitude, value.longitude);
    // print(placemarks.first);
    // this.address =
    //     "${placemarks.first.country} ${placemarks.first.administrativeArea} ${placemarks.first.subAdministrativeArea} ${placemarks.first.subLocality} ${placemarks.first.street}";

   

   
    notifyListeners();

    getCurrentLocation(value);
    mapsMarker = [
      Marker(
        position: value,
        markerId: MarkerId("selected"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      )
    ];
    notifyListeners();
   }catch(e){
     print(e.toString());
   }
  }

  getCurrentLocation(value) async {
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

}
