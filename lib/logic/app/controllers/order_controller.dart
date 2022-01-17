import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/models/order_model.dart';
import 'package:oon_client/logic/app/res/create_order.dart';
import 'package:oon_client/logic/core/contracts/controllers.dart';

class OrderController extends Controller {
  RxBool isLoading = false.obs;
  GetStorage _storage = GetStorage();
  OrderModel orderData;

  check() {
    return false;
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

  setOrderSender() async {
    if (check()) {
      initData();
      isLoading(true);
      try {
        var order = await CreateOrderSender.setOrder(orderData);
        if (order["message"] == "seccess") {
          clearController();
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
