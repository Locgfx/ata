import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmBookingApi {
  Future<dynamic> get(
      {required String counsellorId,
      required String issueId,
      required String time,
      String? coupon,
      required String bookingType,
      required String date}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}booking.php'));
    request.fields.addAll({
      'psychologist': counsellorId,
      'issue': issueId,
      'time_slot': time,
      'coupon': coupon.toString(),
      'booking_type': bookingType,
      'date': date
    });
    log(request.fields.toString());
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
