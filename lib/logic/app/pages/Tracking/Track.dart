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

import 'TrackInfo.dart';

class TrackScreen extends GetView<TarckController> {
  // RemoteMyOrder.myOrder(userId)
  GetStorage storage = GetStorage();
  @override
  Widget build(BuildContext context) {
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
      drawerEdgeDragWidth: 50,
      endDrawer: drawerCustom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            stepper(controller.currentStep.value),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Center(
              child: FutureBuilder(
                future: RemoteMyOrder.myOrder(storage.read("userid").toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MyOrder>> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    if (snapshot.data.length >= 1) {
                      return Obx(() {
                        return Stepper(
                          onStepContinue: (){
                            Get.to(TrackInfo(snapshot.data[controller.currentStep.value]));
                            print(snapshot.data[controller.currentStep.value].toJson());
                          },
                          onStepTapped: (value) {
                            controller.currentStep(value);
                            print(snapshot.data[controller.currentStep.value].toJson());

                          },
                          currentStep: controller.currentStep.value,
                          steps: snapshot.data
                              .map(
                                (e) => Step(
                                  title: Text( e.trackingCode.toString() ),
                                  content: Text(e.actionType),
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

  Widget stepper(int value) {


    switch(value){
      case 1:
        controller.one.value = true;
        break;
      case 2:
       controller.one.value = true;
       controller.two.value = true;
        break;
      case 3:
        controller.one.value = true;
        controller.two.value = true;
        controller.three.value = true;
        break;
      case 4:
        controller.one.value = true;
        controller.two.value = true;
        controller.three.value = true;
        controller.four.value = true;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
              () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            step(image: "assets/images/done_revevice.png", isDone: controller.one.value),
            dots(isDone:controller.one.value),
            step(image: "assets/images/storage.png", isDone: controller.two.value),
            dots(isDone:controller.two.value),
            step(image: "assets/images/out_delivery.png", isDone: controller.three.value),
            dots(isDone:controller.three.value),
            step(image: "assets/images/done.png", isDone: controller.four.value),
          ],);
        }
      ),
    );
  }

  Widget step({String image, bool isDone = false}) {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDone == true ? Colors.green :Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
        color: Colors.white,
      ),
    );
  }

  Widget dots({bool isDone = false}){
    return Container(
      width:Get.width*0.15,
      height: 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: isDone == true ?Colors.green :Colors.grey,
        ),
      ),
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Color(0xFFD0DD28),
  );
}
