import 'dart:convert';

import 'package:greymatter/constants/urlconstants.dart';
import 'package:greymatter/global/Sharedprefs.dart';
import 'package:http/http.dart' as http;

class UserSpecialistApi {
  Future<dynamic> get() async {
    String? cookie = UserPrefs().getCookies();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$cookie'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}speciallities.php'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var v = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return v;
    } else if (response.statusCode == 201) {
      return [];
    } else {
      print(response.reasonPhrase);
      return v;
    }

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    //   print(response.reasonPhrase);
    // }
  }
}
