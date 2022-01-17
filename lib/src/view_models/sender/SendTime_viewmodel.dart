import 'package:flutter/material.dart';
import 'package:oon_client/src/view/sender/SendPackDetails.dart';
import 'package:oon_client/src/view/sender/SendPay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class SendTimeViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  goToDetails(context, date, address) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("date", date);
    obj.setString("time", TimeOfDay.now().toString());
    String price = obj.getString("weight");
    _navigator(
        context,
        SendPay(
          price: price,
        ));
  }

  back(context) => Navigator.of(context).pop();

  _navigator(context, dynamic page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
