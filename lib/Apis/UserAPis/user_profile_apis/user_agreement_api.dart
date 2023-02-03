import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserAgreementApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(headers);
    var request =
        http.Request('GET', Uri.parse('https://beta.alfrik.com/ataraxis/api-user//agreement.php'));
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
