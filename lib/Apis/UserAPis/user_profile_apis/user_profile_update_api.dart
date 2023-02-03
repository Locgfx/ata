import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProfileUpdateApi {
  Future<dynamic> get({
    required String name,
    required String dob,
    required String gender,
    required String relationshipStatus,
    required String occupation,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString('cookies');
    print(v);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v',
    };
    var request = http.Request('PUT', Uri.parse('$baseUrl/update-profile.php'));
    request.body = json.encode({
      "name": name,
      "dob": dob,
      "gender": gender,
      "relationship_status": relationshipStatus,
      "occupation": occupation,
    });
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
