import 'package:flutter/material.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/services/web_service.dart';
import 'package:oon_client/src/view/auth/register.dart';
import 'package:stacked/stacked.dart';

// ignore: camel_case_types
class SignUPViewModel extends BaseViewModel {
   ColorPattern colorPattern = ColorPattern();
  WebService _service = WebService();
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;
  signUp(BuildContext context, String phone) async {
    _isLoading = true;
    notifyListeners();
    var re = await _service.register(phone: phone);
    print(re);
    switch (re) {
      case StateService.Success:
        openVerify(context);
        break;
      case StateService.Already:
        showMessage(context: context, message: "الرقم مسجل مسبقا");
        break;
      case StateService.Failure:
      case StateService.NotFound:
        showMessage(context: context, message: "خطأ غير معروف");
        break;
      case StateService.Least:
        showMessage(context: context, message: "الرقم غير صحيح");
        break;
      case StateService.ErrorServer:
        showMessage(context: context, message: "خظأ في السيرفر");
        break;
    }
    _isLoading = false;
    notifyListeners();
  }

  openVerify(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ),
      );

  showMessage({BuildContext context, String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }
}
