import 'dart:convert';
import 'dart:developer';

import 'package:greymatter/constants/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/urlconstants.dart';

class GetSlotsApi {
  Future<dynamic> get(
      {required String counsellorId, required String date}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}psychologist-slots.php'));
    request.fields.addAll({
      'psy_id': counsellorId,
      'date': date //'2022-11-30'
    });

    log(request.fields.toString());
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
