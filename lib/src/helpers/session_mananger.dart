import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SharedPreferences _prefs;

  SessionManager() {
    initPreferences();
  }

  initPreferences() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  clear() async {
    return await this._prefs.clear();
  }

  void removeValue(String key) async {
    await this._prefs.remove(key);
  }

  String getValue(String key) {
    return _prefs.getString(key);
  }

  setValue(String key, String value) {
    _prefs.setString(key, value);
  }
}
