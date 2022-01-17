import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';

class SendLocateScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: controller.colorPattern.primaryColor,
        centerTitle: true,
        title: Container(
          child: SvgPicture.asset(
            'assets/images/svg/ic_small_logo.svg',
            height: 40,
          ),
        ),
        leadingWidth: 48,
        // leading: Container(
        //   padding: EdgeInsets.all(8),
        //   child: SvgPicture.asset(
        //     'assets/images/svg/ic_menu.svg',
        //   ),
        // ),
      ),
      body: GetX<HomeController>(builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ActionBar(
                title: 'إرسال',
                colorPattern: controller.colorPattern,
                back: controller.backPage,
                help: () {},
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  child: GoogleMap(
                    markers: controller.mapsMarker.toSet(),
                    onTap: (value) {
                      controller.selectPosition(value);
                    },
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: controller.cameraPosition,
                    onMapCreated: (con) {
                      controller.changeCompleter(con);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: controller.colorPattern.primaryColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(Icons.location_history),
            onPressed: () => controller.locationFunc(),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: controller.colorPattern.primaryColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(Icons.arrow_forward_ios),
            onPressed: controller.goToTime,
          ),
        ],
      ),
    );
  }
}
