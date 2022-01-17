import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MProgressDialog {
  ProgressDialog pr;
  BuildContext context;

  MProgressDialog(@required this.context) {
    pr = pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
  }

  setupDialog(String message) {
    pr.style(
        message: message,
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
  }

  showDialog() {
    if (!pr.isShowing()) {
      pr.show();
    }
  }

  dissmsDialog() {
    if (pr.isShowing()) {
      pr.hide();
    }
  }
}
