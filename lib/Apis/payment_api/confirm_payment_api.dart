import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmPaymentApi {
  Future<dynamic> get(dynamic data) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request =
        http.Request('POST', Uri.parse('${baseUrl}booking-payment.php'));
    request.body = json.encode({"payment_intent": data});
    request.headers.addAll(headers);

    log(request.body.toString());
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
