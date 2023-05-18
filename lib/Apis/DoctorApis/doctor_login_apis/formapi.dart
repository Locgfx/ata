import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;

class FormSignupAPi {
  Future<dynamic> get({
    required String name,
    required String email,
    required String phoneNo,
    required String alternateNo,
    required String adress,
    required String timing,
    required String date,
  }) async {
    String? cookie = UserPrefs().getCookies();
    var headers = {
      'Cookie': 'PHPSESSID=$cookie',
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('${counselorUrl}request-for-signup.php'));
    request.fields.addAll({
      'full_name': name,
      'email': email,
      'mobile': phoneNo,
      'alt_mobile': alternateNo,
      'address': adress,
      'timing': timing,
      'date': date,
    });
    request.headers.addAll(headers);
    print(request.fields);
    http.StreamedResponse response = await request.send();

    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
