import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class UserForgotPasswordOtpApi {
  Future<dynamic> get({
  required String emailMobile,
    // required String user,
})async{
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(v);
    print(headers);
    var request = http.Request('POST',
        Uri.parse('https://beta.alfrik.com/ataraxis/api-user/send-otp-forget-password.php'));
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