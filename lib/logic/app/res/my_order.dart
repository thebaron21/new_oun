import 'package:oon_client/logic/app/functions/connect_remote.dart';
import 'package:oon_client/logic/app/models/my_order.dart';
import 'package:oon_client/logic/core/config/end_point.dart';

class RemoteMyOrder {
  static const Map<String, String> headers = {"Accept": "application/json"};
  static Future<List<MyOrder>> myOrder(userId) async {
    try {
      var res = await Remote.postF(
        uri: EndPoint.myOrder,
        headers: headers,
        body: {
          'user_id': userId.toString(),
        },
      );
      print(res);
      List<MyOrder> orders =
          (res as List).map((e) => MyOrder.fromJson(e)).toList();
      return orders;
    } catch (ex) {
      throw ex;
    }
  }

  static Future tarckingOrder(orderId) async {
    try {
      var res = await Remote.postF(
        uri: EndPoint.myOrder,
        headers: headers,
        body: {
          'order_id': orderId,
        },
      );
    } catch (ex) {
      throw ex;
    }
  }
}
