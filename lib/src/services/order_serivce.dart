import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oon_client/src/entities/order_entity.dart';

import 'repositories/order_repository.dart';

enum OrderState { Success, Failure, Empty, Socket, NotPage, SericveError }

class OrderService {
  String baseUrl =
      "https://api.oun.express/public/api"; //  "http://192.168.43.163:8000/api/create
  var client = http.Client();
  String trackingCode = "";

  Future<OrderState> sendOrder(OrderEntity order, String type) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    String token = obj.getString("token");
    print("Token : $token , State $type");
    String phone = obj.getString("phone");
    try {
      print("Starting Response");
      http.Response _response = await client.post(
        Uri.parse(baseUrl + "/create"),
        body: order.toMap(token, phone, type),
      );

      switch (_response.statusCode) {
        case 200:
          var data = json.decode(_response.body);
          var dataValue = data["data"];
          print("Code : ${dataValue["order"]["tracking_code"]}");
          trackingCode = dataValue["order"]["tracking_code"];
          print("${data["status"]} here ${_response.body} ");
          if (data["status"] == "ok") {
            return OrderState.Success;
          } else if (data["status"] == "on") {
            return OrderState.Failure;
          }
          break;
        case 404:
          return OrderState.NotPage;
          break;

        case 500:
          return OrderState.SericveError;
          break;
      }
    } on SocketException catch (r) {
      print(r);
      return OrderState.Socket;
    } catch (ex) {
      print(ex);
      return OrderState.Socket;
    }
  }

  // ignore: missing_return
  Future<OrderRepository> fetchOrder({String token}) async {
    http.Response _respnose;
    try {
      _respnose = await client.post(
        Uri.parse(baseUrl + "/order_history"),
        body: {
          "token": token,
        },
      );
      switch (_respnose.statusCode) {
        case 200:
          var data = json.decode(_respnose.body);
          if (data["status"] == "ok") {
            print(data["data"]);
            return OrderRepository.fromJson(data["data"]);
          } else if (data["status"] == "no") {
            return OrderRepository.fromJson([]);
          }
          break;
        case 500:
          return OrderRepository.withError("serivce error");
      }
    } on SocketException catch (r) {
      return OrderRepository.withError(r.message);
    } catch (ex) {
      return OrderRepository.withError(ex.toString());
    }
  }
}
