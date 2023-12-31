import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class UserSavedPostsApi {
  Future<dynamic> get({required String scroll}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'GET', Uri.parse('${baseUrl}my-saved-posts.php?start=$scroll'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else if (response.statusCode == 201) {
      print(response.reasonPhrase);
      return [];
    } else {
      print(response.reasonPhrase);
      return resp;
    }
  }
}
