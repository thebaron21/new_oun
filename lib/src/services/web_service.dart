import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oon_client/src/entities/order_entity.dart';

import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum StateService {
  Success,
  Failure,
  NotFound,
  Already,
  Least,
  ErrorServer,
  FullData
}

class WebService {
  // SessionManager _sessionManager = SessionManager();

  String baseUrl = "https://api.oun.express/public/api";
  // "http://192.168.43.163:8000/api";
  var client = http.Client();

  Future<StateService> register({String phone}) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    http.Response _response;
    try {
      _response = await client.post(
        Uri.parse(baseUrl + "/opt_register"),
        body: {
          "phone": phone,
        },
      );
      print("Phone ${_response.statusCode}");
      if (_response.statusCode == 200) {
        var data = json.decode(_response.body);
        var dataValue = data["data"];
        if (data["status"] == "ok") {
          print(dataValue["opt"]);
          var isClear = await obj.clear();
          print(isClear);
          obj.setString("phone", dataValue["phone"]);
          print(dataValue["opt"]);
          obj.setString("opt", dataValue["opt"]);
          return StateService.Success;
        } else {
          print(dataValue[0]);
          if (dataValue[0].toString() ==
              "The phone must be at least 10 characters.") {
            return StateService.Least;
          } else if (dataValue["data"] ==
              "The phone has already been taken.") {
            return StateService.Already;
          }
        }
      } else if (_response.statusCode == 404) {
        return StateService.NotFound;
      } else if (_response.statusCode == 500) {
        return StateService.ErrorServer;
      }
    } on SocketException catch (e) {
      print(e);
      return StateService.Failure;
    }
  }

  Future<StateService> optVerify(
      {String location, String fullName, String opt}) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    String phone = obj.getString("phone");
    print("Phone : $phone, OTP : $opt , FullName : $fullName , Location $location");
    http.Response _response;
    try {
      _response = await http.post(
        Uri.parse("https://api.oun.express/public/api/verify_opt"),
        body: {
          "location": location,
          "full_name": fullName.toString(),
          "otp": opt.toString(),
          "phone": phone.toString(),
        },
      );

      var data = json.decode(_response.body);
      print("StatusCode : ${_response.statusCode}");
      if (_response.statusCode == 200) {
        var dataValue = data["data"];
        print(data["status"]);
        print(data);
        if (data["status"] == "ok") {
          print(dataValue);
          await obj.setString("token", dataValue["token"]);
          return StateService.Success;
        } else if (data["status"] == "no") {
          print("Date => ${data["data"][0]} ");
          if (data["data"][0] == "The full name field is required.") {
            return StateService.FullData;
          } else {
            return StateService.Failure;
          }
        }
      } else if (_response.statusCode == 404) {
        return StateService.NotFound;
      } else if (_response.statusCode == 500) {
        return StateService.ErrorServer;
      }
    } catch (e) {
      print(e.toString());
      return StateService.Failure;
    }
  }
}
