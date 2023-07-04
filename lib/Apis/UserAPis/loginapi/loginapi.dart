import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginApi {
  Future<dynamic> get({
    required String username,
    required String password,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var loginWith = prefs.getString(Keys().loginWith);
    // print(v);
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Cookie': 'PHPSESSID=$v'
    // };
    var request =
        http.Request('POST', Uri.parse('$kAPIConst/api-user/login-user.php'));
    if (loginWith == "google") {
      request.body = json.encode(
          {"username": username, "password": password, "login_with": "google"});
    } else {
      request.body = json.encode({
        "username": username,
        "password": password,
      });
    }

    //print(request.headers);
    // request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    //log(await response.stream.bytesToString());
    var resp = jsonDecode(await response.stream.bytesToString());
    print(resp);
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.statusCode);
      //return resp;
    }
  }
}
