import 'package:flutter/services.dart';

import 'contact_model.dart';

class ContactPicker {
  static String channel = "com.baron.contact";
  final MethodChannel _methodChannel = MethodChannel(channel);

  Future<Phone> getContact() async {
    try {
      Map result = await _methodChannel.invokeMethod("choose");
      return Phone.toObject(result);
    } on PlatformException catch (ex) {
      throw Exception(ex);
    }
  }
}
