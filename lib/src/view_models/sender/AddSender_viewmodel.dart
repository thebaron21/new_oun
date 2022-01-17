import 'package:flutter/material.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view/sender/SendPackDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

enum OrderStatus2 { Completed, Inprogress }

class AddSenderViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();
  String initPhone = "";
  String initUae = "";
  OrderStatus2 _orderStatus2 = OrderStatus2.Inprogress;

  OrderStatus2 get orderStatus2 => _orderStatus2;
  set orderStatus(OrderStatus2 status2) {
    _orderStatus2 = status2;
    notifyListeners();
  }

  goToAddDetails(context, {String address, String uae, String myPhone}) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("uae", uae);
    obj.setString("myphone", myPhone);
    _navigator(
      context,
      SendPackDetails(
        address: address,
      ),
    );
  }

  _navigator(context, dynamic page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));

  changeInitValue(String phone, String uae) {
    initPhone = phone;
    initUae = uae;
    notifyListeners();
  }
}
