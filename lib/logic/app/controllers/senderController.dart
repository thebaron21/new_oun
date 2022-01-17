import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/base/controllers/sender_controller.dart';
import 'package:oon_client/src/entities/order_entity.dart';
import 'package:oon_client/src/services/order_serivce.dart';
import 'package:oon_client/src/view/sender/SendDone.dart';

class SenderController extends BaseSenderController {
  final TextEditingController pickupContact = TextEditingController();
  final TextEditingController areaId = TextEditingController();
  final TextEditingController fullDesc = TextEditingController();
  final TextEditingController pickupDayId = TextEditingController();

  final TextEditingController deleveryContac = TextEditingController();
  final TextEditingController deliveryTim = TextEditingController();

  final TextEditingController weight = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController contentValue = TextEditingController();
  OrderService _service = OrderService();
  bool _isLoading = false;

  senderOrder(context) async {
    try {
      OrderEntity datas = OrderEntity(
        areaId: areaId.text == "" ? "not" : areaId.text,
        contentValue: contentValue.text == null ? "" : contentValue.text,
        deleveryContact: deleveryContac == null ? "not" : deleveryContac,
        desc: desc.text == "" ? "" : desc.text,
        deliveryTime: deliveryTim.text == "" ? "" : deliveryTim.text,
        fullDesc: fullDesc.text == "" ? "" : fullDesc.text,
        pickupDayId: pickupDayId.text == null ? "" : pickupDayId.text,
        pickupContact: pickupContact == null ? "" : pickupContact.text,
        weight: weight.text == null ? "" : weight.text,
      );

      var res = await _service.sendOrder(datas, "send_order");
      switch (res) {
        case OrderState.Success:
          print(res);
          _navigator(
            context,
            SendDone(
              code: _service.trackingCode,
            ),
          );
          _isLoading = false;
          break;
        case OrderState.Failure:
          showMessage(context: context, message: "خطأ غير معروف");
          _isLoading = false;
          break;
        case OrderState.Empty:
        case OrderState.Socket:
        case OrderState.NotPage:
          showMessage(context: context, message: "خطأ في السيرفر");
          _isLoading = false;
          break;
        case OrderState.SericveError:
        Get.showSnackbar( GetSnackBar(title: "",message: "خطأ في السيرفر",) );
          // showMessage(context: context, message: );
          _isLoading = false;
          break;
      }
    } catch (ex) {
      throw ex;
    }
  }

  showMessage({BuildContext context, String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }

  _navigator(context, dynamic page) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
