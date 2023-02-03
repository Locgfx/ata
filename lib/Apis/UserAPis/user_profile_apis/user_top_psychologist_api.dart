import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserTopSpecialistApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=5b852e68734d203fde6e9952995031d4'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-user//speciallities.php'));
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
