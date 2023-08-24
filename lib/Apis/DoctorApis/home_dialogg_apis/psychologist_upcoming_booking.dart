import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';
import '../../../constants/urlconstants.dart';

// class PsychologistUpcomingApi {
//   Future<dynamic> get({required int status}) async {
//     var prefs = await SharedPreferences.getInstance();
//     var v = prefs.getString(Keys().cookie);
//     var headers = {
//       'Content-Type': 'application/json',
//       'Cookie': 'PHPSESSID=$v'
//     };
//     var request =
//         http.Request('PUT', Uri.parse('${counselorUrl}pending-bookings.php'));
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var resp = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       // print(resp);
//       return resp;
//     } else {
//       // print(resp);
//       print(response.statusCode);
//       print(response.reasonPhrase);
//       return resp;
//     }
//   }
// }

Future<dynamic> PsychologistUpcomingApi() async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().cookie);
  var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  var request =
      http.Request('PUT', Uri.parse('${counselorUrl}pending-bookings.php'));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}

Future<dynamic> psychologistAcceptAndDeclineBookApi({
  required String bookingId,
  required String confirmStatus,
}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().cookie);
  var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  var request = http.Request(
      'PUT', Uri.parse('${counselorUrl}booking-accept-decline.php'));
  request.body = json.encode({
    "booking_id": bookingId,
    "confirmation_status": confirmStatus,
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}
