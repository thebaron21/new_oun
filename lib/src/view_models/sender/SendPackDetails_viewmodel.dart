import 'package:flutter/material.dart';
import 'package:oon_client/src/view/sender/AddSender.dart';
import 'package:oon_client/src/view/sender/SendTime.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class SendPackDetailsViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  back(context) {
    _navigator(context, AddSender());
  }

  goToTimeAndDate(context,
      {@required String details,
      @required String price,
      @required bool isBig,
      String address}) async {
    String weight;
    isBig == true ? weight = "50" : weight = "30";
    notifyListeners();
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setString("details", details);
    obj.setString("price", price);
    obj.setString("weight", weight);
    _navigator(
        context,
        SendTime(
          address: address,
        ));
  }

  _navigator(context, dynamic page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
