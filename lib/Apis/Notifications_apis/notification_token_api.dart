import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:greymatter/constants/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/urlconstants.dart';

class NotificationTokenApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    String v = prefs.getString(Keys().fcmToken) ?? "";
    var token = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}update-fcm-token.php'));
    request.fields.addAll({
      'fcm_token': v,
      'device_type': Platform.isAndroid ? "android" : "ios"
    });

    request.headers.addAll(headers);
    log(request.fields.toString());
    log(request.fields.toString());
    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      log(resp.toString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
