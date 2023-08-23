import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/urlconstants.dart';

class AppleSignInApi {
  Future<dynamic> get({
    required String idToken,
    required String auCode,
    required String name,
    required String email,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseUrl/sign-up-with-apple.php'));
    // var headers = {
    //   'Content-Type': 'application/json',
    //   //'Cookie': 'password=1234567890; user_type=user; username=1234567890; PHPSESSID=1b10fa7f6ab629786d4ea96760b84681'
    // };
    // log(idToken);
    // var request =
    //     http.Request('POST', Uri.parse('$baseUrl/sign-up-with-google.php'));
    request.body = json.encode({
      "authorization_code": auCode,
      "grant_type": "authorization_code",
      "refresh_token": idToken,
      "name": name,
      "email": email,
    });
    print(request.body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var resp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      print(resp);
      return resp;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
