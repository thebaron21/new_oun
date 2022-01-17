import 'package:flutter/material.dart';
import 'package:oon_client/src/view/reciver/RecivePay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class ReciveExtraInfoViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  goToBuy(context, String details) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("full_desc", details);
    String weight = obj.getString("weight");
    _navigator(
        context,
        RecivePay(
          weight: weight,
        ));
  }

  _navigator(context, dynamic page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
