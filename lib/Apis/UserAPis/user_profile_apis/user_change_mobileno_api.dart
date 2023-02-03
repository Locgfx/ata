import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserChangeEmailApi {
  Future<dynamic> get({
    required String newEmail,
    required String confirmEmail,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'POST', Uri.parse('https://beta.alfrik.com/ataraxis/api-user/change-email.php'));
    print(v);
    // print(headers);
    request.body =
        json.encode({"new_email": newEmail, "cnew_email": confirmEmail});
    // print(request.body);
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
