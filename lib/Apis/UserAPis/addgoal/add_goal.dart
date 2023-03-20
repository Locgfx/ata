import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';
import '../../../constants/urlconstants.dart';

Future addGoalApi({
  required String activityId,
  required String goalType,
  required String goal,
  required String days,
  required String reminder,
  required String reminderTime,
}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().cookie);

  var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  var request =
      http.MultipartRequest('POST', Uri.parse('$baseUrl/add-goals.php'));
  request.fields.addAll({
    'activity_id': activityId,
    'goal_type': goalType,
    'goal': goal,
    'days': days,
    'reminder': reminder,
    'reminder_time': reminderTime
  });
  //log(request.fields.toString());
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200 && resp['status']) {
    log(resp.toString());
    Globals().showToast("Activity added.");
    return resp['status'];
  } else {
    Globals().showToast(resp['error']);
    print(response.statusCode);
    return false;
  }

  /* var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  var request = http.Request('POST', Uri.parse('$baseUrl/add-goals.php'));
  request.body = '''{\r\n    "activity_id":"$activityId",
  \r\n    "goal_type":"$goalType",
   "goal":"$goal",
   "days":"$days",
   "reminder":$reminder,\r\n
   "reminder_time":"$reminderTime" }''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  //log(request.url.toString());
  print(resp);*/
}
