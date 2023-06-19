import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/urlconstants.dart';

class RescheduleBookingApi {
  Future<dynamic> get(
      {required int bookingId,
      required String date,
      required String time}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request =
        http.Request('PUT', Uri.parse('${baseUrl}resechedule-booking.php'));
    request.body =
        json.encode({"booking_id": bookingId, "date": date, "time_slot": time});
    request.headers.addAll(headers);
    log(request.body + "Res");
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = jsonDecode(await response.stream.bytesToString());
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
