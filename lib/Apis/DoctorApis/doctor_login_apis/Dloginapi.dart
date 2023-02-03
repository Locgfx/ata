import 'dart:convert';

import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoctorLoginApi {
  Future<dynamic> get({
    required username,
    required password,
  }) async {
    // var prefs = await SharedPreferences.getInstance();
    // var v = prefs.getString('cookies');
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Cookie': 'PHPSESSID=$v'
    // };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-psychologist/login-psychologist.php'));
    request.body = json.encode({
      "username": username,
      "password": password,
    });
    print(request.body);
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
