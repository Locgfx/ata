import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

Future<dynamic> googleSingingOtpVerifyApi({required String otp}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().cookie);
  var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  var request = http.Request(
      'POST', Uri.parse('$baseUrl/sign-up-with-google-verify-otp.php'));
  request.body = json.encode({"otp": otp});
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  print(resp);
  if (response.statusCode == 200) {
    return resp;
  } else {
    print(resp);
    print(response.reasonPhrase);
    print(response.statusCode);
    return resp;
  }
}
