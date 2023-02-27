import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class PCreateNewPasswordApi {
  Future<dynamic> get({
    required String newPassword,
    required String confirmPassword,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-user//change-forget-password.php'));
    request.body = json.encode({
      "new_password": newPassword,
      "cnew_password": confirmPassword,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
