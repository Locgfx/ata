import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String cookies = "cookies";
  SharedPreferences? prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? getCookies() {
    return prefs?.getString(cookies);
  }

  Future setCookies(String value) async {
    return await prefs?.setString(cookies, value);
  }
}
