import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginApi {
  Future<dynamic> get({
    required String username,
    required String password,
  }) async {
    // var prefs = await SharedPreferences.getInstance();
    // var v = prefs.getString('cookies');
    // print(v);
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Cookie': 'PHPSESSID=$v'
    // };
    var request =
        http.Request('POST', Uri.parse('$kAPIConst/api-user//login-user.php'));
    request.body = json.encode({
      "username": username,
      "password": password,
    });
    print(request.headers);
    // request.headers.addAll(headers);
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
