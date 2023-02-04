import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(v);
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-user//user-profile.php'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }

// var v = jsonDecode(await response.stream.bytesToString());
// if (response.statusCode == 200) {
//   return v;
// } else {
//   print(response.reasonPhrase);
//   return v;
// }
}