import 'dart:convert';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../UserAPis/user_home_apis/user_specialist_model.dart';

class EditCounselorInfo {
  Future<dynamic> get(
      {required String about,
      required String exp,
      required List<LanguageModel> langList,
      required String pricing,
      required List<UserSpecialistModel> specialityList}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    List<String> langId = [];
    List<String> specialityId = [];
    for (var v in langList) {
      langId.add(v.id.toString());
    }
    for (var v in specialityList) {
      specialityId.add(v.id.toString());
    }
    var lang = langList.map((c) => c.id).toList().join(',');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    var request =
        http.Request('PUT', Uri.parse('${counselorUrl}edit-profile.php'));
    request.body = json.encode({
      "about": about,
      "total_exprience": exp,
      "language": lang,
      "pricing": pricing,
      "specialities": specialityId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      print(response.reasonPhrase);
      return rsp;
    }
  }
}
