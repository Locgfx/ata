import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/urlconstants.dart';

class UserOfferBannerApi {
  Future<dynamic> get() async {
    var request =
        http.Request('GET', Uri.parse('${baseUrl}crousal-banner.php'));
    http.StreamedResponse response = await request.send();
    var rsp = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return rsp;
    } else {
      return rsp;
    }
  }
}
