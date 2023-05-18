import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;

class SlotAvailabilityApi {
  Future<dynamic> get({
    required String mondayOpen,
    required String mondayClose,
    required String tuesdayOpen,
    required String tuesdayClose,
    required String wednesdayOpen,
    required String wednesdayClose,
    required String thursdayOpen,
    required String thursdayClose,
    required String fridayOpen,
    required String fridayClose,
    required String saturdayOpen,
    required String saturdayClose,
    required String sundayOpen,
    required String sundayClose,
  }) async {
    String? cookie = UserPrefs().getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=0ab9a87045c72fe80378fffd782f219d'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${counselorUrl}availability.php'));
    request.fields.addAll({
      'monday_open': mondayOpen,
      'monday_close': mondayClose,
      'tuesday_open': tuesdayOpen,
      'tuesday_close': tuesdayClose,
      'wednesday_open': wednesdayOpen,
      'wednesday_close': wednesdayClose,
      'thursday_open': tuesdayOpen,
      'thursday_close': tuesdayClose,
      'friday_open': fridayOpen,
      'friday_close': fridayClose,
      'saturday_open': saturdayOpen,
      'saturday_close': saturdayClose,
      'sunday_open': sundayOpen,
      'sunday_close': saturdayClose
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
