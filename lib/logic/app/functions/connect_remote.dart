import 'dart:convert';

import 'package:http/http.dart' as http;

class Remote {
  static Future getF({String uri, Map<String, String> headers}) async {
    try {
      var response = await http.get(Uri.parse(uri), headers: headers);
      if (response.statusCode == 200) {
        return _toJson(response.body);
      } else {
        return _toJsonWithError(response.body, response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future postF({String uri, Map<String, String> headers, body}) async {
    try {
      var response = await http.post(Uri.parse(uri), headers: headers,body: body);
      if (response.statusCode == 200) {
        return _toJson(response.body);
      } else {
        return _toJsonWithError(response.body, response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static _toJson(String body) {
    return json.decode(body);
  }

  static _toJsonWithError(String body, int statusCode) {
    return {"error": json.decode(body), "status": statusCode};
  }
}
