import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/track_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oon_client/logic/app/models/my_order.dart';
import 'package:oon_client/logic/app/res/my_order.dart';
import 'package:im_stepper/stepper.dart';
import 'TrackInfo.dart';

class TrackScreen extends GetView<TarckController> {
  // RemoteMyOrder.myOrder(userId)

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
      ),
      endDrawer: drawerCustom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: Get.width,
              child: ImageStepper(
                stepColor: Colors.red,
                enableStepTapping: false,
                lineDotRadius: 2,
                lineColor: controller.colorPattern.primaryColor,
                enableNextPreviousButtons: false,
                images: [
                  AssetImage("assets/images/done_revevice.png"),
                  AssetImage("assets/images/storage.png"),
                  AssetImage("assets/images/out_delivery.png"),
                  AssetImage("assets/images/done.png"),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Center(
              child: FutureBuilder(
                future: RemoteMyOrder.myOrder(controller.userId),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MyOrder>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length >= 1) {
                      return Obx(() {
                        return Stepper(
                          onStepTapped: (value) {
                            controller.currentStep(value);
                            print(controller.currentStep.value);
                          },
                          currentStep: controller.currentStep.value,
                          steps: snapshot.data
                              .map(
                                (e) => Step(
                                  title: Text("title"),
                                  content: Text("Text"),
                                ),
                              )
                              .toList(),
                        );
                      });
                    } else {
                      return Center(
                        child: Text("لا توجد طلبات"),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      widthFactor: Get.width,
                      heightFactor: Get.height,
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Color(0xFFD0DD28),
  );
}
