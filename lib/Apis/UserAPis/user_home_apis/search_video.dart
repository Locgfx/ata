import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/urlconstants.dart';

class SearchVideo {
  Future<dynamic> get({required String search, required String start}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.Request(
        'GET', Uri.parse('${baseUrl}videos.php?search=$search&start=$start'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp = jsonDecode(await response.stream.bytesToString());
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
