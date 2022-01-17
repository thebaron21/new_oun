/*'package:alsalama_client/src/helpers/helper.dart';
 import 'package:alsalama_client/src/helpers/session_mananger.dart';
 import 'package:alsalama_client/src/services/http_service.dart';
 import 'package:alsalama_client/src/views/elements/progress_%20dialog.dart';
 import 'package:alsalama_client/src/views/home_view.dart';
 import 'package:alsalama_client/src/views/otp_view.dart';
 import 'package:dio/dio.dart';
 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:oun_client/src/helpers/helper.dart';
import 'package:oun_client/src/helpers/session_mananger.dart';
import 'package:oun_client/src/services/http_service.dart';
import 'package:oun_client/src/view/home_view.dart';
import 'package:oun_client/src/view/verification_view.dart';

import 'package:oun_client/src/view/widgets/progress_%20dialog.dart';

 class AuthService {
   HttpService httpService = HttpService();
   SessionManager sessionManager;
   Helper helper = Helper();
   MProgressDialog mProgressDialog;
   BuildContext context;
   AuthService(this.context);

   requestOTP(String phoneNumber) async {
     mProgressDialog = MProgressDialog(context);
     mProgressDialog.setupDialog('Please Wait ...');
    mProgressDialog.showDialog();
    Dio dio = httpService.getDio();
     Response response;
     try {
      response =
          await dio.post('/send_otp', data: {"phone_number": phoneNumber});
      final responseBody = response.data;
      final statusCode = response.statusCode;
      helper.loger(
          context, 'AuthService-requestOTP-statusCode', '${statusCode}');
      mProgressDialog.dissmsDialog();
      if (statusCode == 200 || responseBody != null) {
        print('success full ${responseBody}');
       if (responseBody['ResponseCode'] == 1) {
          print('ResponseCode is ${responseBody['ResponseCode']}');
           Navigator.pushReplacement(
           context,
             MaterialPageRoute(
            builder: (context) => VerificationView(phoneNumber: phoneNumber),
             ),
           );
         } else {
           print('ResponseCode isnot 1 => ${responseBody['ResponseCode']}');
           //TODO show response message
         }
       } else {
         print('failer');
         //TODO show request failer message
       }
     } catch (e) {
       mProgressDialog.dissmsDialog();
       helper.loger(context, 'AuthService-requestOTP-Eex', e.toString());
     }
   }

   verifyOTP(String phoneNumber, String code) async {
     mProgressDialog = MProgressDialog(context);
     mProgressDialog.setupDialog('Please Wait ...');
     mProgressDialog.showDialog();
     Dio dio = httpService.getDio();
     Response response;
     try {
       response = await dio.post('/check_otp',
           data: {"phone_number": phoneNumber, "code": code});
       final responseBody = response.data;
       final statusCode = response.statusCode;
       helper.loger(context, 'verifyOTP-statusCode', '${response.statusCode}');
       if (statusCode == 200 || responseBody != null) {
         print('success full ${responseBody}');
         if (responseBody['ResponseCode'] == 1) {
           print('ResponseCode is ${responseBody['ResponseCode']}');

           sessionManager = SessionManager();
          sessionManager.setValue(
              "fullName", responseBody["data"]["full_name"] ?? "");
          sessionManager.setValue(
              "phoneNumber", responseBody["data"]["phone_number"] ?? "");
          sessionManager.setValue("email", responseBody["data"]["email"] ?? "");
           sessionManager.setValue("token", responseBody["data"]["token"] ?? "");
           sessionManager.setValue(
               "profilePhotoUrl", responseBody["data"]["image"] ?? "");
           sessionManager.setValue(
               "createdAt", responseBody["data"]["created_at"] ?? "");
           sessionManager.setValue("isAuth", '1');

           mProgressDialog.dissmsDialog();
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(
               builder: (context) => HomeView(),
             ),
          );
         } else {
           print('ResponseCode isnot 1 => ${responseBody['ResponseCode']}');
           mProgressDialog.dissmsDialog();
           helper.showMessage(
               context: context, message: responseBody['ResponseMessage']);
         }
       } else {
         print('failer');
         mProgressDialog.dissmsDialog();
         helper.showMessage(
            context: context, message: 'Unable to handle your request');
      }
      mProgressDialog.dissmsDialog();
     } catch (e) {
      mProgressDialog.dissmsDialog();
     helper.loger(context, 'AuthService-verifyOTP-Eex', e.toString());
       helper.showMessage(
           context: context, message: 'Unable to handle your request');
     }
   }
 }*/
