import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globals.dart';

Future<dynamic> googleSigningDetails({
  required String name,
  required String dob,
  required String gender,
  required String relationStatus,
  required String occupation,
  required String phone,
}) async {
  var prefs = await SharedPreferences.getInstance();
  var v = prefs.getString(Keys().cookie);
  var headers = {'Content-Type': 'application/json', 'Cookie': 'PHPSESSID=$v'};
  print("token check${v}");
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://theataraxis.com/ataraxis/api-user/sign-up-with-google-next.php'));
  request.body = json.encode({
    "name": name,
    "dob": dob,
    "gender": gender,
    "relationship_status": relationStatus,
    "occupation": occupation,
    "phone": phone
  });
  request.headers.addAll(headers);
  print(headers);
  print(request.body);
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  print(resp);
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.reasonPhrase);
    print(response.statusCode);
    return resp;
  }
}
