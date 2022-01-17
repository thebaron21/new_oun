import 'package:flutter/material.dart';
import 'package:oon_client/src/view/reciver/RecivePackDetails.dart';
import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum OrderStatus1 { Completed, Inprogress }

class AddReciverViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();
  String initPhone = "";
  String initUae = "";
  OrderStatus1 _orderStatus1 = OrderStatus1.Inprogress;

  OrderStatus1 get orderStatus1 => _orderStatus1;
  set orderStatus(OrderStatus1 status2) {
    _orderStatus1 = status2;
    notifyListeners();
  }

  goToAddDetails(context, {String uae, String myPhone}) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("name", uae);
    obj.setString("myphone", myPhone);
    _navigator(
      context,
      RecivePackDetails(
        address: "",
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
