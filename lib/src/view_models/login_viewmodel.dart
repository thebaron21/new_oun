import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/session_mananger.dart';
import '../services/http_service.dart';
// import '../view/New folder/verification_view.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  // HttpService _httpService = HttpService();
  SessionManager sessionManager = SessionManager();
  TextEditingController phoneNumberController = TextEditingController();
  String message;
  login(context) {
    print("Clicked");
  }

  submit(BuildContext context) async {
    // String phoneNumber = phoneNumberController.text;
    // print("----------------> $phoneNumber");
    // bool isValidFormData = validation();
    // dynamic requestData;
    // if (isValidFormData) {
    //   requestData = {
    //     'phone': phoneNumber,
    //   };
    //   Response response =
    //       await _httpService.post(context, "/opt_register", requestData);
    //   try {
    //     if (response == null) {
    //       message =
    //           'Sorry, Server dosen\'t response please contact the administrator';
    //       notifyListeners();
    //       return;
    //     }
    //     if (response.statusCode == 200) {
    //       String responsCode = response.data['code'];
    //       if (responsCode == "1") {
    //         sessionManager.setValue('loginStatus', "1");
    //         sessionManager.setValue('phoneNumber', phoneNumber);
    //         Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => VerificationView(),
    //           ),
    //         );
    //       } else {
    //         message = response.data['responseMessage'];
    //         notifyListeners();
    //         return;
    //       }
    //     } else {
    //       message =
    //           'Sorry, Unexpected respnse please contact the administrator';
    //       notifyListeners();
    //     }
    //   } catch (e) {}
    // }
  }

  bool validation() {
    String phoneNumber = phoneNumberController.text;

    if (phoneNumber.isEmpty) {
      message = 'Sorry, Phone number is requierd';
      return false;
    } else if (phoneNumber.length != 10) {
      message = 'Sorry, Phone number must be 10 digits';
      return false;
    }
    return true;
  }
}
