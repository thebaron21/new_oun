import 'package:flutter/material.dart';
import 'package:oon_client/src/services/web_service.dart';
import 'package:oon_client/src/view/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class VerificationViewModel extends BaseViewModel {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  WebService _webService = WebService();

  submit(BuildContext context,
      {String location, String username, String opt}) async {
    _isLoading = true;
    notifyListeners();
    String loc;
    print("Location : $location");
    if (location.length > 30) location = location.substring(0, 30);
    notifyListeners();
    print(loc);

    var res = await _webService.optVerify(
      location: location,
      fullName: username,
      opt: opt,
    );

    switch (res) {
      case StateService.Success:
        SharedPreferences obj = await SharedPreferences.getInstance();
        print(obj.getString("token"));
        _openHome(context);
        _isLoading = false;
        notifyListeners();
        break;
      case StateService.Failure:
        _showMessage(context: context, message: "خطأ غير معروف");
        break;
      case StateService.ErrorServer:
        _showMessage(context: context, message: "خطأ في السيرفر");
        break;
      case StateService.FullData:
        _showMessage(context: context, message: "تأكد من إكمال البيانات");
        break;
    }
    _isLoading = false;
    notifyListeners();
  }

  _openHome(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  _showMessage({BuildContext context, String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }

  String sup() {}
}
