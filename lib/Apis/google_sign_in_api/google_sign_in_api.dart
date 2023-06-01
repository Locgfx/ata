import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../constants/urlconstants.dart';

class GoogleSignInApi {
  Future<dynamic> get({required String idToken}) async {
    var headers = {
      'Content-Type': 'application/json',
      //'Cookie': 'password=1234567890; user_type=user; username=1234567890; PHPSESSID=1b10fa7f6ab629786d4ea96760b84681'
    };
    log(idToken);
    var request =
        http.Request('POST', Uri.parse('$baseUrl/sign-up-with-google.php'));
    request.body = json.encode({"id_token": idToken});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
