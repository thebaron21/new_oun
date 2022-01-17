import 'package:flutter/material.dart';
import 'package:oon_client/src/view/reciver/ReciveLocate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class ReciveTimeViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

   goToSelectLocation(context, date) async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("date", date);
    obj.setString("time", TimeOfDay.now().toString());
    String price = obj.getString("weight");

    _navigator(context,
      ReciveLocate()
      );
  }


  _navigator(context, dynamic page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
