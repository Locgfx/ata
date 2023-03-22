import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';

class UpdateSlotsApi {
  Future<dynamic> get({
    required String mondayStart,
    required String mondayEnd,
    required String tuesdayStart,
    required String tuesdayEnd,
    required String wednesdayStart,
    required String wednesdayEnd,
    required String thursdayStart,
    required String thursdayEnd,
    required String fridayStart,
    required String fridayEnd,
    required String saturdayStart,
    required String saturdayEnd,
    required String sundayStart,
    required String sundayEnd,
    required String timeSlot,
    required String lunchStart,
    required String lunchEnd,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${counselorUrl}availability.php'));
    request.fields.addAll({
      'monday_open': mondayStart,
      'monday_close': mondayEnd,
      'tuesday_open': tuesdayStart,
      'tuesday_close': tuesdayEnd,
      'wednesday_open': wednesdayStart,
      'wednesday_close': wednesdayEnd,
      'thursday_open': thursdayStart,
      'thursday_close': thursdayEnd,
      'friday_open': fridayStart,
      'friday_close': fridayEnd,
      'saturday_open': saturdayStart,
      'saturday_close': saturdayEnd,
      'sunday_open': sundayStart,
      'sunday_close': sundayEnd,
      'time_slot': timeSlot,
      'lunch_time_start': lunchStart,
      'lunch_time_end': lunchEnd
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
