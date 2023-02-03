import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChangeEmailOtpVerifyApi {
  get({
    required String otp,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-user//verify-otp-for-mail.php'));
    request.body = json.encode({"otp": otp});
    print(request.body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return resp;
    }
  }
}
