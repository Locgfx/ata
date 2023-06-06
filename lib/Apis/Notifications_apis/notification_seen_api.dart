import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/globals.dart';

class NotificationSeenApi {
  Future<dynamic> get({required String notificationId}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    String userType = prefs.getString(Keys().userType) ?? "p";

    log(notificationId);
    log(userType);

    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.Request(
        'GET',
        Uri.parse(
            '${baseUrl}seen-notification.php?notification_id=$notificationId&sender_type=${userType.toLowerCase()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
