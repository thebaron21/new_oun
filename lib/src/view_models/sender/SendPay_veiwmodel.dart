import 'package:oon_client/src/entities/order_entity.dart';
import 'package:oon_client/src/services/order_serivce.dart';
import 'package:oon_client/src/view/sender/SendDone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class SendPayViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();
  OrderService service = OrderService();
  OrderStatus3 _orderStatus3 = OrderStatus3.Inprogress;
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;
  OrderStatus3 get orderStatus => _orderStatus3;
  set orderStatus(OrderStatus3 status3) {
    _orderStatus3 = status3;
    notifyListeners();
  }

  sendOrder(context) async {
    _isLoading = true;
    notifyListeners();
    print("herro");
    SharedPreferences obj = await SharedPreferences.getInstance();
    bool isSender = obj.getBool("isSender");

    String areaId = obj.getString("address");
    String contentValue = obj.getString("price");
    String deleveryContact = obj.getString("key");
    String desc = obj.getString("details");
    String pickupContact = obj.getString("uae");
    String deliveryTime = obj.getString("time");
    String fullDesc = obj.getString("full_desc");
    String pickupDayId = obj.getString("date");
    String wei = obj.getString("weight");
    String phone = obj.getString("myphone");
    String weight;
    print(
        "Area : ${areaId == "" ? "Ahmed" : areaId} , Value : $contentValue , DeleveryContact: ${deleveryContact == null ? "Ahmed" : "Not"}");
    print(
        "Desc : $desc PickupContact : $pickupContact , DelivereyTime : $deliveryTime");
    print(
        "Full Desc $fullDesc , pickupDay : $pickupDayId , wei : $wei , phone: $phone");
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
      desc: desc == "" ? "" : desc,
      deliveryTime: deliveryTime == "" ? "" : deliveryTime,
      fullDesc: fullDesc == "" ? "" : fullDesc,
      pickupDayId: pickupDayId == null ? "" : pickupDayId,
      pickupContact: pickupContact == null ? "" : pickupContact,
      weight: weight == null ? "" : weight,
    );

    var res = await service.sendOrder(datas, "send_order");
    switch (res) {
      case OrderState.Success:
        print(res);
        _navigator(
          context,
          SendDone(
            code: service.trackingCode,
          ),
        );
        _isLoading = false;
        notifyListeners();
        break;
      case OrderState.Failure:
        showMessage(context: context, message: "خطأ غير معروف");
        _isLoading = false;
        notifyListeners();
        break;
      case OrderState.Empty:
      case OrderState.Socket:
      case OrderState.NotPage:
        showMessage(context: context, message: "خطأ في السيرفر");
        _isLoading = false;
        notifyListeners();
        break;
      case OrderState.SericveError:
        showMessage(context: context, message: "خطأ في السيرفر");
        _isLoading = false;
        notifyListeners();
        break;
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

enum OrderStatus3 { Completed, Inprogress }
    /*
  token [1] => [+]
  delevery_contact [1] => [+]
  phone (default = myphone) [1] => [+]
  orders_type_id (default = 1) [1] =>[+]
  
  weight [2] => [+]
  content_value [2] => [+]
  full_desc [2] => [+]
  
  pickup_day [3] => [+]
  delivery_time [3] => [+]

  area_id [4] => [+]
  desc [5] => [+]
  pickup_contact [Automatic]

    OrderEntity order = OrderEntity(
      desc: details,
      pickupContact: myPhone,
      contentValue: price,
      weight: weight,
      deliveryTime: date,
      areaId: address,
      fullDesc: fullDesc,
      pickupDayId: date,
      deleveryContact: phone,
    );
    // String details = obj.getString("details"); // "desc": desc,
    // String myPhone =
    //     obj.getString("myphone"); // "pickup_contact": pickupContact,
    // String price = obj.getString("price"); // "content_value": contentValue,
    // String uae = obj.getString("uae");
    // String weight = obj.getString("weight"); // "weight": weight,
    // String date = obj.getString("date"); // "delivery_time": deliveryTime,
    // String address = obj.getString("address"); // "area_id": areaId,
    // String fullDesc = obj.getString("full_desc"); //"full_desc": fullDesc,
    // String phone = obj.getString("phone"); // "phone": myPhone,
    // String time = obj.getString("time");
*/