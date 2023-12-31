import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class UserForgotPasswordOtpApi {
  Future<dynamic> get({
    required String emailMobile,
    // required String user,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(v);
    print(headers);
    var request = http.Request(
        'POST', Uri.parse('${baseUrl}send-otp-forget-password.php'));
    request.body = json.encode({
      "email_mobile": emailMobile,
      "user": "user",
    });
    request.headers.addAll(headers);
    print(request.body);
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
