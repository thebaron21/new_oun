import 'package:flutter/material.dart';
import 'package:oon_client/src/entities/order_entity.dart';
import 'package:oon_client/src/services/order_serivce.dart';
import 'package:oon_client/src/services/recive_service.dart';
import 'package:oon_client/src/view/reciver/Done.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

enum OrderStatus2 { Completed, Inprogress }

class RecivePayViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  OrderStatus2 _orderStatus = OrderStatus2.Inprogress;
  OrderStatus2 get orderStatus => _orderStatus;
  bool isLoading = false;

  set orderStatus(OrderStatus2 status2) {
    _orderStatus = status2;
    notifyListeners();
  }

  goToDone(context) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    OrderService serive = OrderService();
    String areaId = obj.getString("address");
    String contentValue = obj.getString("price");
    String deleveryContact = obj.getString("key");
    String desc = obj.getString("details");
    String pickupContact = obj.getString("name");
    String deliveryTime = obj.getString("time");
    String fullDesc = obj.getString("full_desc");
    String pickupDayId = obj.getString("date");
    String wei = obj.getString("weight");
    String phone = obj.getString("myphone");
    print(
        "Area : ${areaId == "" ? "Ahmed" : areaId} , Value : $contentValue , DeleveryContact: ${deleveryContact == null ? "Ahmed" : "Not"}");
    print(
        "Desc : $desc PickupContact : $pickupContact , DelivereyTime : $deliveryTime");
    print(
        "Full Desc $fullDesc , pickupDay : $pickupDayId , wei : $wei , phone: $phone");
    String weight;
    if (wei == "50") {
      weight = "big";
    } else if (wei == "30") {
      weight = "smail";
    }
    notifyListeners();

    OrderEntity datas = OrderEntity(
      areaId: areaId == "" ? "not" : areaId,
      contentValue: contentValue == null ? "" : contentValue,
      deleveryContact: deleveryContact == null ? "not" : deleveryContact,
      desc: desc == null ? "" : desc,
      deliveryTime: deliveryTime == null ? "" : deliveryTime,
      fullDesc: fullDesc == null ? "" : fullDesc,
      pickupDayId: pickupDayId == null ? "" : pickupDayId,
      pickupContact: pickupContact == null ? "" : pickupContact,
      weight: weight == null ? "" : weight,
    );
    var res = await serive.sendOrder(datas, "recive_order");
    switch (res) {
      case OrderState.Success:
        _navigator(context, serive.trackingCode);
        isLoading = false;
        notifyListeners();
        break;
      case OrderState.Failure:
      case OrderState.Empty:
        showMessage(context: context, message: "خطأ غير معروف");
        isLoading = false;
        notifyListeners();
        break;
      case OrderState.Socket:
        showMessage(context: context, message: "مشكلة في الإتصال ");
        isLoading = false;
        notifyListeners();
        break;
      case OrderState.NotPage:
        showMessage(context: context, message: "تم حذف التحكم مع السيرفر");
        isLoading = false;
        notifyListeners();
        break;
      case OrderState.SericveError:
        showMessage(context: context, message: "مشكلة غير معروفة");
        isLoading = false;
        notifyListeners();
        break;
    }
  }

  _navigator(context, String code) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ReciveDone(code: code)),
    );
  }

  showMessage({BuildContext context, String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }
}
