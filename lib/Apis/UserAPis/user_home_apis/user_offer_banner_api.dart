import 'dart:convert';

import 'package:http/http.dart' as http;

class UserOfferBannerApi {
  Future<dynamic> get() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://beta.alfrik.com/ataraxis/api-user//crousal-banner.php'));
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
