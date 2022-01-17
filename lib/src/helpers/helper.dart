import 'package:flutter/material.dart';

class Helper {
  loger(BuildContext context, String key, String value) {
    print('========================================');
    print('==========${key}==========');
    print(value);
    print('========================================');
  }

  showMessage({BuildContext context, String message}) {
    // MAlertDialog(
    //     context: context, title: 'Message', message: message, todo: () => {});
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text(message),
    // ));
  }

  int getCurrentYear() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    return dateParse.year;
  }
}
