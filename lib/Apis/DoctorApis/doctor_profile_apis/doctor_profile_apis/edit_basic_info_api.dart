import 'dart:convert';
import 'dart:io';

import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/constants/urlconstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditBasicInfoApi {
  Future<dynamic> get(
      {required String name,
      required String dob,
      required String gender,
      required String designation,
      required File signature}) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {'Cookie': 'PHPSESSID=$v'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${counselorUrl}update-basic-details.php'));
    request.fields.addAll({
      'name': name,
      'dob': dob, //'1998-09-09',
      'gender': gender,
      'designation': designation
    });
    if (signature.path.isNotEmpty) {
      request.files
          .add(await http.MultipartFile.fromPath('signature', signature.path));
    }
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
