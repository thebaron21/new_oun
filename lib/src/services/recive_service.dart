import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReciveSerive {
  String baseUrl = "http://192.168.43.163:8000/api";
  Future<ReciveRepository> createRecive(ReciveEntity recive) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    String token = obj.getString("token");
    String phone = obj.getString("phone");
    try {
      http.Response _response = await http.post(
        Uri.parse(baseUrl + "/create_pickup"),
        body: recive.toMap(token, phone),
      );
      var data = json.decode(_response.body);
      switch (_response.statusCode) {
        case 200:
          var dataValue = data["data"];
          if (dataValue["status"] == "ok") {
            return ReciveRepository.fromJson(data);
          } else if (dataValue["status"] == "on") {
            return ReciveRepository.withError(dataValue.toString());
          }
          break;
        case 422:
          return ReciveRepository.withError(data.toString());
          break;
        case 500:
          return ReciveRepository.withError(data.toString());
          break;
        case 4040:
          return ReciveRepository.withError(data.toString());
          break;
      }
    } catch (e) {
      return ReciveRepository.withError(e.toString());
    }
  }

  // ignore: missing_return
  Future<ReciveRepository> fetchRecive() async {
    try {
      SharedPreferences obj = await SharedPreferences.getInstance();
      String token = obj.getString("token");
      http.Response _respnose = await http.post(
        Uri.parse(baseUrl + "/order_history"),
        body: {
          "token": token,
          "orders_type_id": "recive_order",
        },
      );
      print("${_respnose.statusCode}");
      switch (_respnose.statusCode) {
        case 200:
          var data = json.decode(_respnose.body);
          if (data["status"] == "ok") {
            
            return ReciveRepository.fromJson(data["data"]);
          } else if (data["status"] == "no") {
            return ReciveRepository.withError("not data");
          }
          break;
        case 500:
          return ReciveRepository.withError("serivce error");
      }
    } catch (ex) {
      return ReciveRepository.withError(ex.toString());
    }
  }
}

class ReciveEntity {
  final String pickupContact; //
  final String areaId; // Not First Page
  final String fullDesc; // 2
  final String pickupDayId; // 3

  final String deleveryContact;
  final String deliveryTime;

  final String weight; // 2
  final String desc; // 4
  final String contentValue;

  ReciveEntity({
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
  toMap(token, phone) => {
        "token": token,
        "orders_type_id": "recive_order",
        "pickup_contact": pickupContact,
        "area_id": areaId,
        "full_desc": fullDesc,
        "pickup_day_id": pickupDayId,
        "delevery_contact": deleveryContact,
        "phone": phone,
        "delivery_time": deliveryTime,
        "weight": weight,
        "desc": desc,
        "content_value": contentValue,
      };

  ReciveEntity.formMap(Map<String, dynamic> json)
      : pickupContact = json["pickup_contact"],
        areaId = json["area_id"],
        fullDesc = json["full"],
        pickupDayId = json["pickupDay"],
        deleveryContact = json["delevery"],
        deliveryTime = json["delivery_time"],
        weight = json["weight"],
        desc = json["desc"],
        contentValue = json["content_value"];
}

class ReciveRepository {
  List<ReciveEntity> recives;
  String error;

  ReciveRepository.fromJson(var json)
      : recives = (json as List).map((e) => ReciveEntity.formMap(e)).toList(),
        error = null;

  ReciveRepository.withError(String ex)
      : recives = List(),
        error = ex;
}
