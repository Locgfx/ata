import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class UserExploreApi {
  Future<dynamic> get({required String scroll, required String search}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    String searchUrl = '';
    if (search == "") {
      searchUrl = "";
    } else {
      searchUrl = "&search=$search";
    }
    var request = http.Request(
      'GET',
      Uri.parse('$baseUrl/psychologists.php?start=$scroll$searchUrl'),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // log(await response.stream.bytesToString());
    var rsp = jsonDecode(await response.stream.bytesToString());
    print(rsp);
    if (response.statusCode == 200) {
      return rsp;
    } else {
      log(rsp.toString());
      return rsp;
    }
  }
}
