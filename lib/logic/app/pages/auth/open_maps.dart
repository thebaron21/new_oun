import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oon_client/logic/app/controllers/auth_controller.dart';

/*

 */

class OpenMapsScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: GoogleMap(
          myLocationEnabled: true,
          markers: controller.mapsMarker.toSet(),
          onTap: (value) {
            controller.selectLocation(value);
          },
          mapType: MapType.normal,
          initialCameraPosition: controller.cameraPosition,
          onMapCreated: (con) {
            controller.completer.complete(con);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD0DD28),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }


}
