import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class UserExploreApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };

    //print(v);
    var request = http.Request('GET', Uri.parse('$baseUrl/psychologists.php'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    //print(rsp);
    if (response.statusCode == 200) {
      return rsp;
    } else {
      print(response.statusCode);
      Globals().showToast(rsp['error']);
      //return rsp;
    }
  }
}
