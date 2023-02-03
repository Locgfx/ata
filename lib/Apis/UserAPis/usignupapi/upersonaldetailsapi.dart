import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/global/Sharedprefs.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserPersonalDetailsApi {
  get({
    required name,
    required email,
    required password,
    required cPassword,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(headers);
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-user//signup-user.php'));
    request.body = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "cpassword": cPassword,
    });
    print(request.body);
    request.headers.addAll(headers);
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
