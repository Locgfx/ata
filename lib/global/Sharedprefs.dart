import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  String login = 'login';
  static SharedPreferences? _prefs;
  static const String cookies = "cookies";

  SharedPreferences? prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? getCookies() {
    return prefs?.getString(cookies);
  }

  Future setLoginFalse() async {
    return await _prefs?.setBool(login, false);
  }

  Future setCookies(String value) async {
    return await prefs?.setString(cookies, value);
  }


}
