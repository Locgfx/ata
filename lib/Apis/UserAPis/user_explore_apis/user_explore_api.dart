import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:greymatter/constants/urlconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserExploreApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };

    print(v);
    var request = http.Request('GET', Uri.parse('$baseUrl/psychologists.php'));
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
