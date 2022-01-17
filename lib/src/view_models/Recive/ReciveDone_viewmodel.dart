import 'package:flutter/material.dart';
import 'package:oon_client/src/view/Track/Track.dart';
import 'package:oon_client/src/view/reciver/AddReciver.dart';
import 'package:oon_client/src/view/sender/SendSelectLocal.dart';
import 'package:oon_client/src/view/widgets/home.dart';

import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class ReciveDoneViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  goToRecive(BuildContext context) {
    _navigator(context, AddReciver());
  }

  goToBuy(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "تنبيه",
            textAlign: TextAlign.right,
          ),
          content: Text(
            "قريبا ...   إنتقال إلى الصفحة الرئسية",
            textAlign: TextAlign.right,
          ),
          actions: [
            FlatButton(
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              onPressed: () {
                _navigator(context, Home());
              },
              child: Text("موفق"),
            )
          ],
        );
      },
    );
  }

  goToTrack(BuildContext context) {
    _navigator(context, Track());
  }

  goToSender(context) {
    _navigator(context, SelectLocation());
  }

  _navigator(context, dynamic page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
