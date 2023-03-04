import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

class CompletedBookingApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };

    print(v);
    var request = http.Request(
        'GET', Uri.parse('${counselorUrl}completed-booking.php?start=0'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else if (response.statusCode == 201) {
      return [];
    } else {
      return rsp;
    }
  }
}
