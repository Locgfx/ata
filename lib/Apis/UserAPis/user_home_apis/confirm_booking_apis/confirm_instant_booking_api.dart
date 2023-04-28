import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/globals.dart';

class ConfirmInstantBookingApi {
  Future<dynamic> get(
      {required String psychologistId,
      required String issueId,
      required String coupon}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}instant-booking.php'));
    request.fields.addAll(
        {'psychologist': psychologistId, 'issue': issueId, 'coupon': coupon});

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
