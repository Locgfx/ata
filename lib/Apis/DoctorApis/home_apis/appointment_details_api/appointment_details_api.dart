import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';
import '../../../../constants/urlconstants.dart';

class AppointmentDetailsApi {
  Future<dynamic> get({required String bookingId, required String status}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${counselorUrl}user_details.php?booking_id=$bookingId&status=$status'));

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
