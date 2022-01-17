import 'package:flutter/material.dart';
import 'package:oon_client/src/view/sender/SendLocate.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class OrderStepOneViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  location(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SendLocate(),
      ),
    );
  }
}
