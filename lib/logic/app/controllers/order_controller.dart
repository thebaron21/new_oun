import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/models/order_model.dart';
import 'package:oon_client/logic/app/models/order_success.dart';
import 'package:oon_client/logic/app/pages/Sender/SendDone.dart';
import 'package:oon_client/logic/app/res/create_order.dart';

class OrderController {
  RxBool isLoading = false.obs;
  GetStorage _storage = GetStorage();
  OrderModel orderData;

  check() {
    return true;
  }

  initData() {
    orderData = OrderModel(
      userId: _storage.read("userid"),
      pickupContact: pickupContactController.text,
      pickupPhone: pickupPhoneController.text,
      pickupAreaId: pickupAreaIdController.text,
      pickupDescription: pickupDescriptionController.text,
      pickupTime: pickupTimeController.text,
      deliveryContact: deliveryContactController.text,
      deliveryPhone: deliveryPhoneController.text,
      deliveryAreaId: deliveryAreaIdController.text,
      deliveryDescription: deliveryAreaIdController.text,
      deliveryTime: deliveryTimeController.text,
      weight: weightController.text,
      shipmentDescription: shipmentDescriptionController.text,
    );
  }

  clearController() {
    userIdController.dispose();
    pickupContactController.dispose();
    pickupPhoneController.dispose();
    pickupAreaIdController.dispose();
    pickupDescriptionController.dispose();
    pickupTimeController.dispose();
    deliveryContactController.dispose();
    deliveryPhoneController.dispose();
    deliveryAreaIdController.dispose();
    deliveryDescriptionController.dispose();
    deliveryTimeController.dispose();
    weightController.dispose();
    shipmentDescriptionController.dispose();
  }

  setOrderSender(OrderModel data) async {
    if (check()) {
      isLoading(true);
      try {
        var order = await CreateOrderSender.setOrder(data);
        if (order["message"] == "seccess") {
          
          print("Dsfadf");
        } else {
          Get.showSnackbar(
            GetSnackBar(
              title: "خطا",
              message: "قم بأكمل البيانات",
            ),
          );
        }
      } catch (ex) {
      } finally {
        isLoading(false);
      }
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "خطا",
          message: "قم بأكمل البيانات",
        ),
      );
    }
  }

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
}


// {user_id: 8, 
// action_type: Send, 
// pickup_contact: ghjgjh, 
// pickup_phone: +966932658745, 
// pickup_area_id: 2, 
// pickup_description: dsfsdf,
//  pickup_time: 2021-6-23 23:16, 
//  delivery_contact: gsdfgdfsg, 
//  delivery_phone: +966546456456, 
//  delivery_area_id: 1, 
//  delivery_description: Sudan , Khartoum , ابوسعد، أم درمان،، Umm Durman, 
// delivery_time: 2021-6-23 23:16, 
// shipment_description: 1, weight: 0_5KG}