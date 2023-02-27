import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';
import '../../../constants/urlconstants.dart';

class UserGoalsApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.Request('GET', Uri.parse('${baseUrl}my-goals.php'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var val = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return val;
    } else {
      print(response.reasonPhrase);
      return val;
    }
  }
}
