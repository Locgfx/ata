import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';
import '../../../constants/urlconstants.dart';

class UserPersonalDetailsApi {
  get({
    required name,
    required email,
    required password,
    required cPassword,
    required dob,
    required gender,
    required relationStatus,
    required occupation,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    print(headers);
    var request = http.Request('POST', Uri.parse('${baseUrl}signup-user.php'));
    request.body = json.encode({
      "name": name,
      "email": email,
      "dob": dob,
      "gender": gender,
      "relationship_status": relationStatus,
      "occupation": occupation,
      "password": password,
      "cpassword": cPassword,
      // "name": name,
      // "email": email,
      // "password": password,
      // "cpassword": cPassword,
    });
    print(request.body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    //log(await response.stream.bytesToString());
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      print(resp);
      return resp;
    } else {
      print(response.reasonPhrase);
      print(resp);
      return resp;
    }
  }
}
