import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteGoalApi {
  Future<dynamic> get({required int activityId}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request =
        http.Request('DELETE', Uri.parse('${baseUrl}delete-goal.php'));
    request.body = json.encode({"activity_id": activityId});
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
