import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/functions/connect_remote.dart';
import 'package:oon_client/logic/app/models/order_model.dart';
import 'package:oon_client/logic/core/config/end_point.dart';

class CreateOrderSender {
  static const String sender = "Send";
  static const String recieve = "Recieve";
  static const String buy = "Buy";
  static const Map<String, String> headers = {"Accept": "application/json"};
  static Future setOrder(OrderModel order) async{
    try {
      var res = await Remote.postF(
        uri: EndPoint.orderCreate,
        headers: headers,
        body: order.toJson(sender),
      );
      return res;
    } catch (ex) {
      throw ex;
    }
  }

  setRecieve(OrderModel order) async {
    try {
      var res = Remote.postF(
        uri: EndPoint.orderCreate,
        headers: headers,
        body: order.toJson(recieve),
      );
      return res;
    } catch (ex) {
      throw ex;
    }
  }

  setBuy(OrderModel order) async {
    try {
      var res = Remote.postF(
        uri: EndPoint.orderCreate,
        headers: headers,
        body: order.toJson(buy),
      );
      return res;
    } catch (ex) {
      throw ex;
    }
  }
}
