import 'dart:io';

import 'package:greymatter/constants/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/urlconstants.dart';

class NotificationTokenApi {
  Future<dynamic> get() async {
    var prefs = await SharedPreferences.getInstance();
    String v = prefs.getString(Keys().fcmToken) ?? "";
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}update-fcm-token.php'));
    request.fields.addAll({
      'fcm_token': v,
      'device_type': Platform.isAndroid ? "android" : "ios"
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
