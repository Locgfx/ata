import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class DoctorChangePasswordApi {
  Future<dynamic> get({
    required String oldPassword,
    required String newPassword,
    required String cNewPassword,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(headers);
    var request =
        http.Request('PUT', Uri.parse('$baseUrl/change-user-password.php'));
    request.body = json.encode({
      "old_password": oldPassword,
      "new_password": newPassword,
      "cnew_password": cNewPassword,
    });
    print(request.body);
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
