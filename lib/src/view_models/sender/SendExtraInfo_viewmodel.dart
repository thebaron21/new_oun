import 'package:flutter/material.dart';
import 'package:oon_client/src/view/sender/AddSender.dart';
import 'package:oon_client/src/view/sender/SendPackDetails.dart';
import 'package:oon_client/src/view/sender/SendTime.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class SendExtraInfoViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  gotToTime(context, address) => _navigator(
        context,
        AddSender(
          address: address,
        ),
      );

  _navigator(context, dynamic page) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
}
