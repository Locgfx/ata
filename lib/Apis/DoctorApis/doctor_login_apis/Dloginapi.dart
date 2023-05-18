import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;

class DoctorLoginApi {
  Future<dynamic> get({
    required username,
    required password,
  }) async {
    // var prefs = await SharedPreferences.getInstance();
    // var v = prefs.getString(Keys().cookie);
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Cookie': 'PHPSESSID=$v'
    // };
    var request = http.Request(
        'POST', Uri.parse('${counselorUrl}login-psychologist.php'));
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
