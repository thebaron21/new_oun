import 'package:flutter/material.dart';
import 'package:oon_client/src/view/reciver/ReciveTime.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class RecivePackDetailsViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  goToTimeAndDate(context,
      {@required String details,
      @required String price,
      @required bool isBig,
      String address}) async {
    String weight;
    isBig == true ? weight = "50" : weight = "30";
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("details", details);
    obj.setString("price", price);
    obj.setString("weight", weight);
    _navigator(
      context,
      ReciveTime(
        address: "",
      ),
    );
  }

  _navigator(context, dynamic page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
