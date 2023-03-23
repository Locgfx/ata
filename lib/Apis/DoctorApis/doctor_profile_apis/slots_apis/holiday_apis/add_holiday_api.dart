import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/globals.dart';

class AddHolidayApi {
  Future<dynamic> get(
      {required String startDateTime, required String endDateTime}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.Request(
        'POST', Uri.parse('${counselorUrl}psychologist-holiday.php'));
    request.body = json.encode(
        {"start_date_time": startDateTime, "end_date_time": endDateTime});
    request.headers.addAll(headers);
    log(request.body);

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
