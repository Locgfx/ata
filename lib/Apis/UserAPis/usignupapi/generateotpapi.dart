import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;

class Generateotpapi {
  Future<dynamic> get({
      required String mobileNo,
      }
      )async{
    // String? cookie = UserPrefs.getCookies();
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Cookie': 'PHPSESSID=29d5b9ddfb3dff4cc583fe3698602f86'
    // };
    var request = http.Request('POST',
        Uri.parse('$kAPIConst/api-user///send-otp.php'));
    request.body = json.encode({
      "mobile": mobileNo,
    });
    // request.headers.addAll(headers);
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