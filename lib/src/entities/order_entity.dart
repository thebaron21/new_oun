import 'package:flutter/foundation.dart';

class OrderEntity {
  final String pickupContact; //
  final String areaId; // Not First Page
  final String fullDesc; // 2
  final String pickupDayId; // 3

  final String deleveryContact;
  final String deliveryTime;

  final String weight; // 2
  final String desc; // 4
  final String contentValue; //4

  OrderEntity({
    @required this.areaId,
    @required this.fullDesc,
    @required this.pickupDayId,
    @required this.deleveryContact,
    @required this.deliveryTime,
    @required this.contentValue,
    @required this.pickupContact,
    @required this.weight,
    @required this.desc,
  });
  toMap(String token, String myPhone,String type) => {
        "token": token,
        "orders_type_id": type,
        "pickup_contact": pickupContact,
        "area_id": areaId,
        "full_desc": fullDesc,
        "pickup_day_id": pickupDayId,
        "delevery_contact": deleveryContact,
        "phone": myPhone,
        "delivery_time": deliveryTime,
        "weight": weight,
        "desc": desc,
        "content_value": contentValue,
      };
  OrderEntity.fromMap(Map<String, dynamic> json)
  :
        pickupContact = json["pickup_contact"],
        areaId = json["area_id"],
        fullDesc = json["full"],
        pickupDayId = json["pickupDay"],
        deleveryContact = json["delevery"],
        deliveryTime = json["delivery_time"],
        weight = json["weight"],
        desc = json["desc"],
        contentValue = json["content_value"];
}
